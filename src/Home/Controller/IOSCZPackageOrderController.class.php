<?php


namespace Home\Controller;


use Home\Model\IOSCZPackageOrderModel;
use Think\Controller;
use Utils\ConstantUtils;

class IOSCZPackageOrderController extends OrderBaseController {
    private $type = "ios_cz_package_order";

    public function order_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = 'IOSCZPackage/cz_package_doing/';
            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);

        }
        $orderMgr = new IOSCZPackageOrderModel();
        $info = $orderMgr->getOrderById($orderId);

        $this->assign('pay_title', "充值套餐价格");
        $this->assign('pay_price', $info['payment']);

        $this->assign('result_url', U('Home/IOSCZPackageOrder/customer_paid_finish', array('orderId'=>$orderId)));
        $this->assign('result_finish_url', U('Home/IOSCZPackageOrder/paid_finish', array('orderId'=>$orderId)));
        $this->assign('submit_url', U('Home/IOSCZPackageOrder/order_pay', array('orderId'=>$orderId)));
        $this->theme($this->theme)->display();
    }

    public function paid_finish($orderId){
        $orderMgr = new IOSCZPackageOrderModel();
        $status = $orderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/IOSCZPackageOrder/order_pay', array('orderId'=>$orderId));
        }

        return $this->redirect('Home/IOSCZPackage/cz_package_doing', array('orderId'=>$orderId));
    }

    /*
     * 客户点击“支付完成”
     */
    public function customer_paid_finish($orderId){
        $orderMgr = new IOSCZPackageOrderModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_CZ_PACKAGE);
    }
} 