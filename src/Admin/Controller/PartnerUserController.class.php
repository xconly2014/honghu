<?php
namespace Admin\Controller;
use Admin\Model\UserMgrModel;

class PartnerUserController extends AuthController{
    private static  $user_function ='user_list';

    public function user_list(){
    	$name = I('get.name');
        $userMgr = new UserMgrModel();
        $userInfo = $userMgr->getThirdList($name);
        $this->assign('user_list', $userInfo['data']);
        $this->assign('show', $userInfo['show']);
       	$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$user_function);
        $this->display();
    }

} 