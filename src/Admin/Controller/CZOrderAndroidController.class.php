<?php
namespace Admin\Controller;

use Admin\Model\CZOrderAndroidModel;
use Utils\ConstantUtils;

class CZOrderAndroidController extends AuthController{
    private static  $order_function ='order_list';
    public function order_list(){
        $oid = ConstantUtils::$ID_NONE;
        if(IS_POST){
            $oid = I('post.orderId');
        }

        $orderMgr = new CZOrderAndroidModel();
        $this->assign('order_list', $orderMgr->getList($oid));
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->assign('title', "安卓充值订单");
        $this->display('OrderCenter/cz_order_android_list');
    }

} 