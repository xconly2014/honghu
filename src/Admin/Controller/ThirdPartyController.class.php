<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/11/1
 * Time: 14:49
 */

namespace Admin\Controller;


use Admin\Model\CZOrderIOSModel;
use Admin\Model\UserMgrModel;
use Think\Controller;

class ThirdPartyController extends AuthController {
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

    public function order_list(){
        $orderMgr = new CZOrderIOSModel();
        $orderList = $orderMgr->getThirdList(I('get.start_date'),I('get.end_date'));
        
        $this->assign('start_date',I('get.start_date'));
        $this->assign('end_date',I('get.end_date'));
        $this->assign('order_list', $orderList['data']);
        $this->assign('count_select',$orderList['count']);
        $this->assign('show', $orderList['show']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$user_function);
        $this->display();
    }

}