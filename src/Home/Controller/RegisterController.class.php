<?php

namespace Home\Controller;
use Home\Model\QuestionAnswerMgrModel;
use Home\Model\QuestionMgrModel;
use Home\Model\UserMgrModel;
use Home\Model\PwdAuthKeyMgrModel;
use Home\Utils\Constants;
use Think\Controller;
use Think\Verify;
use Utils\VerifyUtil;
use Utils\ConstantUtils;


class RegisterController extends DetectorController{

    public function index(){
        if(IS_POST){
            $userMgr = new UserMgrModel();
            $uId = $userMgr->insertUser();
            if($uId){
                $userMgr->updateLogin($uId);
                $this->redirect('Home/Register/reg_finish');
            }else{
                $this->error('注册失败，请联系管理员');
            }

        }else{
            if(I('get.from')){
                $this->assign('submit_url', U('Register/index?from='.I('get.from')));
            }
            $this->assign('ajax_url', U('Home/Register/ajax_check_vcode'));
            $this->assign("cur_page", "reg");
            $this->theme($this->theme)->display();
        }
    }

    public function reg_tel(){
        if(IS_POST){
            $userMgr = new UserMgrModel();
            $uId = $userMgr->insertTel();
            if($uId){
                $userMgr->updateLogin($uId);
                $this->redirect('Home/Register/reg_finish');
            }else{
                $this->error('注册失败，请联系管理员');
            }
        }else{
            $this->assign('submit_url', U('Register/reg_tel'));
            $this->assign('vcode', ConstantUtils::$MSG_TYPE_REGISTER);
            $this->assign("cur_page", "reg_tel");
            $this->theme($this->theme)->display();
        }
    }

    public function reg_finish(){
        $this->assign('login_url', U('/'));
        $this->theme($this->theme)->display();
    }

    public function vcode(){
        $config = array(
            'fontSize' =>50,
            'length'   =>4,
        );
        $Verify = new \Think\Verify($config);
        $Verify->codeSet = 'abcdefghjkmnpqrstvwxyABCDEFGHJKMNOPQRSTVWXY123456789';
        $Verify->entry();
    }

    //判断验证码 $code为用户输入的验证码
    private function check_vcode($code, $id = ''){
        $vcode = new \Think\Verify();
        //返回布尔值
        return $vcode->check($code, $id);
    }

    public function ajax_check_vcode(){
        $vcode = I('post.vcode');
        if($this->check_vcode($vcode)){
            echo 'true';
        }else{
            echo 'false';
        }
    }

    public function ajax_check_tel(){
        $user = new UserMgrModel();
        $find = $user->checkTel(I('post.tel'));
        if($find){
            echo 'false';
        }else{
            echo 'true';
        }
    }

    public function ajax_check_nickname(){
        $user = new UserMgrModel();
        $find = $user->checkNickname(I('post.nickname'));
        if($find){
            echo 'false';
        }else{
            echo 'true';
        }
    }

    public function ajax_check_email(){
        $user = new UserMgrModel();
        $find = $user->checkEmail(I('post.email'));
        if($find){
            echo 'false';
        }else{
            echo 'true';
        }
    }
    
    
    
    public function ajax_send_msg(){
    	if(IS_AJAX){
    	    $tel = I('post.tel');
    	    $type=ConstantUtils::$MSG_TYPE_REGISTER;
    		echo send_msg($tel,$type);
    	}
    }
    
    
     public function ajax_check_tel_code(){
     	if(IS_AJAX){
            echo check_msg_code();
     	}
     	
     }
     
     public function introduce(){
         if(I('get.type')){
             session('from_wx', 1);
         }
         $this->theme($this->theme)->display();
     }
 
       
} 