<?php
namespace Admin\Controller;


use Think\Auth;
use Think\Controller;

class AuthController extends Controller{
    protected function _initialize(){
        $uid = get_uid();
        if(!$uid){
            $this->redirect('Admin/Login/index');
        }

        $adminId = getAdminUserId($uid);

        $msg = "您没有权限，请联系网站管理员";
        
        if($adminId == 0){
            $this->redirect('Admin/Login/index','',1,$msg);
        }

        $auth = new Auth();
        
//         if(!$auth->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME,
//                          $adminId,
//                          $type = 1,
//                          $mode='url',
//                          $relation='or')){
//             $this->error($msg);
//         }

    }
} 