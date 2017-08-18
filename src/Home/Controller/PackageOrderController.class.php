<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-14
 * Time: 下午4:36
 */

namespace Home\Controller;


use Home\Model\PackageMgrModel;
use Home\Model\PackageOrderModel;
use Think\Controller;
use Utils\ConstantUtils;

class PackageOrderController extends OrderBaseController{
    private $type = "package_order";

    public function pay_security($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "Package/publish_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }

        $packageOrder = new PackageOrderModel();
        $packageId = $packageOrder->getPackage($orderId);
        $package = new PackageMgrModel();
        $price = $package->getPackageSecurityPrice($packageId);

        $this->assign('pay_title', "发布套餐保证金");
        $this->assign('pay_price', $price);
        $this->assign('result_url', U('Home/PackageOrder/customer_paid_finish', array('orderId'=>$orderId)));
        $this->assign('result_finish_url', U('Home/PackageOrder/paid_finish', array('orderId'=>$orderId)));
        $this->assign('submit_url', U('Home/PackageOrder/pay_security', array('orderId'=>$orderId)));
        $this->theme($this->theme)->display('package_publish_pay');
    }

    public function pay_price($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "Package/get_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }

        $package = new PackageOrderModel();
        $package_id = $package->getPackage($orderId);
        $package = new PackageMgrModel();
        $price = $package->getPackagePrice($package_id);

        $this->assign('pay_title',"套餐价格");
        $this->assign('pay_price',$price);
        $this->assign('result_url', U('Home/PackageOrder/customer_paid_finish', array('orderId'=>$orderId)));
        $this->assign('result_finish_url', U('Home/PackageOrder/paid_finish', array('orderId'=>$orderId)));
        $this->assign('submit_url', U('Home/PackageOrder/pay_price', array('orderId'=>$orderId)));
        $this->theme($this->theme)->display('package_buy_pay');
    }

    public function paid_finish($orderId){
        $orderMgr = new PackageOrderModel();
        $status = $orderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/PackageOrder/order_pay', array('orderId'=>$orderId));
        }

        $type = $orderMgr->getOrderType($orderId);
        if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER){
            return $this->redirect('Home/Package/publish_finish', array('orderId'=>$orderId));
        }

        else if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER){
            return $this->redirect('Home/Package/get_finish', array('orderId'=>$orderId));
        }
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new PackageOrderModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_PACKAGE);
    }
} 