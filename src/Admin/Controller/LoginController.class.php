<?php
namespace Admin\Controller;


use Admin\Model\UserMgrModel;
use Admin\Model\MenuMgrModel;
use Think\Controller;
use Utils\ConstantUtils;

class LoginController extends Controller{

    public function index(){
        $title = "登录";
        $this->assign('title', $title);
        $this->display();
    }

    public function logout(){
        $userMgr = new UserMgrModel();
        $userMgr->logout();
        $this->redirect('/');
    }
    
    
    public function ajax_admin_login(){
    	if(IS_AJAX){
    		$username = I('post.username');
    		$passwrod = I('post.password');
    		
    		$userMgr = new UserMgrModel();
    		$uId = $userMgr->login($username,$passwrod);
    		
    		if($uId > 0){
    			$userMgr->updateLogin($uId);
    			
    			$menuMgr = new MenuMgrModel();
    			$url = $menuMgr->getRuleUrl($uId);
    			
    			$data =array('status'=>true,'url'=>$url);
    			$this->ajaxReturn($data);
    		}
    		else{
    			switch($uId){
    				case ConstantUtils::$LOGIN_STATE_PWD_ERROR:
    					$msg = "密码错误";
    					break;
					case ConstantUtils::$LOGIN_STATE_USER_NOT_EXIST:
    					$msg = "该用户不存在";
    					break;
    				case ConstantUtils::$LOGIN_STATE_USER_NOT_ADMIN:
    					$msg = "您不是管理员";
    					break;
    				default:
    					$msg = "未知错误";
    					break;
    			}
    			
    			$data = array('status'=>false,'data'=>$msg);
    			$this->ajaxReturn($data);
    		}    		
    	}
    }
    
    
    

} 