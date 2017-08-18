<?php
namespace Admin\Controller;

use Admin\Model\IOSCZPackageOrderMgrModel;
use Utils\ConstantUtils;

class IOSCZPackageOrderController extends AuthController {
    private static  $order_function ='order_list';
    
    private function filterOrderState($orderState){
        $fiterResult = $orderState;
        unset($fiterResult[ConstantUtils::$CZ_PACKAGE_ORDER_STATE_INIT]);
        unset($fiterResult[ConstantUtils::$CZ_PACKAGE_ORDER_STATE_BACK]);
    
        return $fiterResult;
    }
    
    public function order_list(){
        
        if(IS_GET){
            $packageId= I('get.packageId');
        }

        $orderMgr = new IOSCZPackageOrderMgrModel();
        $orderRes = $orderMgr->getList($packageId);
        $this->assign('show',$orderRes['page']);
        $this->assign('orderRes',$orderRes['list']);
        $this->assign('order_state_text', $this->filterOrderState(ConstantUtils::$CZ_PACKAGE_ORDER_STATE));
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->assign('title', "充值套餐订单");
        $this->display();
    }

     public function details($id){
        $orderMgr = new IOSCZPackageOrderMgrModel();
        $orderRes = $orderMgr->getInfo($id);
        
        $this->assign('orderRes',$orderRes);
        $this->assign('title','充值套餐订单查看');
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$order_function);
        $this->display();
    }
    
    
    public function ajax_edit_state(){
        if(IS_AJAX){
            $state = I('post.state');
            $oid = I('post.id');
            $orderMgr = new IOSCZPackageOrderMgrModel();
            $result = $orderMgr->updateState($oid, $state);
            $this->ajaxReturn($result);
        }
    }

} 