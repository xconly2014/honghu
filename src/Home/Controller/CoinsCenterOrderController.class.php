<?php


namespace Home\Controller;


use Home\Model\CoinsOrderMgrModel;
use Utils\ConstantUtils;

class CoinsCenterOrderController extends OrderBaseController {
    private $type = "cz_coins";

    public function autoPost($orderId, $payWay){
        $params = array('pay_way'=>$payWay);
        $postUrl = U('Home/CoinsCenterOrder/order_pay', array('orderId'=>$orderId));
        echo '<form method="post" action="'.$postUrl.'">';
        foreach($params as $key=>$value){
            echo '<input type="hidden" name="'.$key.'" value="'.$value.'"/>';
        }//foreach
        echo '<input type="submit" name="submit" value="提交" id="dh">
				<script>var a=document.getElementById("dh");a.click();</script>
			</form>';
    }

    public function order_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = 'CoinsCenter/coins_cz_finish';
            $info = $this->prePay($payway, $callbackUrl, $orderId);

            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }

        $coinsOrder = new CoinsOrderMgrModel();
        $info = $coinsOrder->getInfo($orderId);

        $this->assign('pay_title',"虎币充值");
        $this->assign('pay_price',$info['real_payment']);

        $this->assign('result_url', U('Home/CoinsCenterOrder/customer_paid_finish', array('orderId'=>$orderId)));
        $this->assign('result_finish_url', U('Home/CoinsCenterOrder/paid_finish', array('orderId'=>$orderId)));
        $this->assign('submit_url', U('Home/CoinsCenterOrder/order_pay', array('orderId'=>$orderId)));
       
        $this->theme($this->theme)->display();
    }

    public function order_test(){
        $type = "cz_coins";
        $oid = "48526";
        $payment = 1;
        $this->order_gamecard_pay($type, $oid, $payment);
    }

    public function paid_finish($orderId){
        $orderMgr = new CoinsOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        if(!$status){
            return $this->redirect('Home/CoinsCenterOrder/order_pay', array('orderId'=>$orderId));
        }

        return $this->redirect('Home/CoinsCenter/coins_cz_finish', array('orderId'=>$orderId));
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new CoinsOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }
} 