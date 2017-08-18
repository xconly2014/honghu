<?php
namespace Home\Controller;
use Home\Model\CZ\CZOrderIOSModel;
use Home\Model\OrderBaseModel;
use Utils\ConstantUtils;


class CZOrderIOSController extends OrderBaseController {
    private $type = "cz_order_ios";

    public function order_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = 'CZIOS/chongzhi_doing';
            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment'], $orderId);
        }

        $orderMgr = new CZOrderIOSModel();
        if($orderMgr->orderIsPaid($orderId)){
            return $this->redirect('Home/CZIOS/chongzhi_doing', array('orderId'=>$orderId));
        }

        $info = $orderMgr->getInfo($orderId);

        $this->assign('order_id', $orderId);
        $this->assign('pay_title', "充值");
        $this->assign('pay_price', $info['czInfo']['payment']);
        $this->assign('result_url', U('Home/CZOrderIOS/customer_paid_finish', array('orderId'=>$orderId)));
        $this->assign('result_finish_url', U('Home/CZOrderIOS/paid_finish', array('orderId'=>$orderId)));
        $this->assign('submit_url', U('Home/CZOrderIOS/order_pay', array('orderId'=>$orderId)));
        $this->theme($this->theme)->display();
    }

    public function paid_finish($orderId){
        $orderMgr = new CZOrderIOSModel();
        $status = $orderMgr->orderIsPaid($orderId);

        if(!$status){
            return $this->redirect('Home/CZOrderIOS/order_pay', array('orderId'=>$orderId));
        }

        return $this->redirect('Home/CZIOS/chongzhi_doing', array('orderId'=>$orderId));
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new CZOrderIOSModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_CZ);
    }
    
} 