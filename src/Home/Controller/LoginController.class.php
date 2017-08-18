<?php
namespace Home\Controller;
use Home\Model\UserMgrModel;
use Utils\ConstantUtils;
use Think\Controller;
use Utils\WXUtils;

class LoginController extends  DetectorController{

    public function _initialize(){
        parent::_initialize();
        vendor('Alipay.Corefunction');
        vendor('Alipay.Md5function');
        vendor('Alipay.Submit');
        vendor('Alipay.Notify');
    }

     public function index(){
        $title = "登录";
        $this->assign('title', $title);

        $this->theme($this->theme)->display();
    } 

    public function wx_login(){
        $wxUtilsMgr = new WXUtils();
        $url = $wxUtilsMgr->getLoginUrl();
        redirect($url);
    }

    public function wx_login_back(){
        $state = $_GET['state'];
        $code = $_GET['code'];

        if($code){
            $wxUtilsMgr = new WXUtils();
            $userInfo = $wxUtilsMgr->getUserInfo($code);
            if($userInfo['status']){
                $userMgr = new UserMgrModel();
                $nickName = $userInfo['data'];
                $uId = $userMgr->isThirdNameIn(ConstantUtils::$THIRD_LOGIN_WX, $nickName);
                if(!$uId){
                    $uId = $userMgr->createThirdName(ConstantUtils::$THIRD_LOGIN_WX, $nickName);
                    if($uId){
                        $userMgr->updateLogin($uId);
                        $this->redirect('/');
                    }else{
                        $this->error('第三方登录（微信）创建用户失败，请联系管理员');
                    }
                }
                else{
                    $userMgr->updateLogin($uId);
                    $this->redirect('/');
                }
            }
            else{
                $this->error($userInfo['msg']);
            }
        }
    }

    public function ali_login(){
        if(IS_GET){
            $alipay_config = C('alipay_config');
            $target_service = "user.auth.quick.login";
            $baseLoginReturnUrl = C('third_party_login');
            $return_url = $baseLoginReturnUrl[ACTION_NAME];

            $parameter = array(
                "service" => "alipay.auth.authorize",
                "partner" => trim($alipay_config['partner']),
                "target_service"	=> $target_service,
                "return_url"	=> $return_url,
                "anti_phishing_key"	=> "",
                "exter_invoke_ip"	=> "",
                "_input_charset"	=> $alipay_config['input_charset']
            );
            //建立请求
            $url = $alipay_config['gateway_url'];
            $alipaySubmit = new \AlipaySubmit($url, $alipay_config);
            $html_text = $alipaySubmit->buildRequestForm($parameter,"get", "支付宝登录跳转中……");
            echo $html_text;
        }
    }

    public function alipay_login_back(){
        $alipay_config = C('alipay_config');

        $alipayNotify = new \AlipayNotify($alipay_config);
        $verify_result = $alipayNotify->verifyReturn();
        if($verify_result){
            $userName = $_GET['real_name'];
            $token = $_GET['token'];
            $userMgr = new UserMgrModel();
            $uId = $userMgr->isThirdNameIn(ConstantUtils::$THIRD_LOGIN_ALI, $userName);
            if(!$uId){
                $uId = $userMgr->createThirdName(ConstantUtils::$THIRD_LOGIN_ALI, $userName);
                if($uId){
                    $userMgr->updateLogin($uId);
                    $this->redirect('/');
                }
                else{
                    $this->error('第三方登录（支付宝）创建用户失败，请联系管理员');
                }
            }//if
            else{
                $userMgr->updateLogin($uId);
                $this->redirect('/');
            }
        }
        else {
            echo "第三方登录返回验证失败";
        }
    }
    
 

    public function logout(){
        $userMgr = new UserMgrModel();
        $uId = $userMgr->logout();
        return $this->redirect('/');
    }
    
    
    public function ajaxLogin(){
    	if(IS_AJAX){
    		$userTel = I('post.username');
            $userPw = I('post.password');
    		$type = I('post.type');
    		$auto = I('post.remember');
    		
    		$userMgr = new UserMgrModel();
    		$uId = $userMgr->login($userTel, $userPw);
    		if($uId > 0){
    			$userMgr->updateLogin($uId);
    			$next_url = $_SESSION['next_url']? $_SESSION['next_url']:U('/');
    			
    			if($auto == 'on'){
    			    cookie('username',$userTel,7*24*3600);
    			    cookie('userpwd',$userPw,7*24*3600);
    			}
    			
    			if($type == 'mb'){
    			    
    				$data = $next_url;
    			}else if($type == 'home'){
    			    
    			    $data = $next_url;
    			}else{
    			    $img = $userMgr->getHeadImg($uId);
    			    
    			    $userName = '';
    			    $session_data = session('user_auth');
    			    if($session_data){
    			         $userName = $session_data['username']?$session_data['username']:$session_data['tel'];
    			    }
    			   
    			    $uInfo = $userMgr->getUserInfo(get_uid());
    			    $coins = $uInfo['coins'];
    			    $credit = $uInfo['credit'];
    			    
    				$head ='<li><span>您好<a href="'.U('Home/User/info').'">'.$userName.'</a>，欢迎光临轰轰虎</span></li><li><a href='.U('Home/Login/logout').' rel="nofollow">退出</a></li>';
    				$data['head'] = $head;
                    
                    $ulHtml = "<div class='user_header_info'><img src='Public".$img."' alt='用户头像'><p><a href=".U('Home/User/info').">个人中心</a></p></div>";
                    $ulHtml .= '<ul class="login_in">'. '<a href="'.U('Home/User/coins_list')
                             .'">虎 币：'.$coins.'</a><a href="'.U('Home/User/credits').'">积 分：'.$credit.'</a><a href="'
                            .U('Home/User/info').'">今 日 签 到</a></ul>';
                    $data['info'] = $ulHtml;
    			}
    			$result = array('status'=>true,'data'=>$data);
    			$this->ajaxReturn($result);
    		}else{
    			switch($uId){
    				case 0:
    					$msg = "用户名或密码错误";
    					break;
    				case -1:
    					$msg = "用户被禁用";
    					break;
    				default:
    					$msg = "未知错误";
    					break;
    			}
    			$result = array('status'=>false,'data'=>$msg);
    			$this->ajaxReturn($result);
    		}
    	}
    }
    
    
    
}