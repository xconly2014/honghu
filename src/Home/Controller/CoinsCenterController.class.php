<?php


namespace Home\Controller;
use Home\Model\CoinsOrderMgrModel;
use Utils\ConstantUtils;
use Home\Model\UserMgrModel;


class CoinsCenterController extends DetectorController{

    /*
     * 虎币购买入口
     */
    public function index(){

        if(IS_POST){
            $payments = I('post.payments');
            $coins = intval($payments) * ConstantUtils::$PAYMENT_TO_COINS;
            $coinsOrder = new CoinsOrderMgrModel();
            $coinsOrderId = $coinsOrder->coinsOrderInsert($payments,$coins);
            $this->redirect('Home/CoinsCenterOrder/order_pay', array('orderId'=> $coinsOrderId));
        }

    	$user = new UserMgrModel();
    	$userRes = $user->getUserInfo(get_uid());
    	$coinsTotal = $userRes['coins'] | 0;//获取总虎币数

        $this->assign('cur_tab','index');
    	$this->assign('coins_total', $coinsTotal);
    	$this->assign('discount',ConstantUtils::$PAYMENT_TO_COINS);
        $this->theme($this->theme)->display();

       // $this->redirect('Home/Index/index');
    }

    public function fees(){
        if(IS_POST){
            $payments = I('post.payments');
            $coins = intval($payments) * ConstantUtils::$FEES_TO_COINS;
            $coinsOrder = new CoinsOrderMgrModel();
            $coinsOrderId = $coinsOrder->coinsOrderInsert($payments, $coins);

        }
        $this->assign('cur_tab','fees');
        $this->assign('discount',ConstantUtils::$FEES_TO_COINS);
        $this->theme($this->theme)->display();
    }

    public function card(){
        if(IS_POST){
            $payments = I('post.payments');
            $coins = floor(intval($payments) * ConstantUtils::$CARD_TO_COINS);
            $coinsOrder = new CoinsOrderMgrModel();
            $coinsOrderId = $coinsOrder->coinsOrderInsert($payments, $coins);
            $this->redirect('Home/CoinsCenterOrder/autoPost', array('orderId'=>$coinsOrderId, 'payWay'=> "mp_banlance"));
        }

        $user = new UserMgrModel();
        $userRes = $user->getUserInfo(get_uid());
        $coinsTotal = $userRes['coins'] | 0;
        $this->assign('coins_total', $coinsTotal);
        $this->assign('cur_tab','card');
        $this->assign('discount',ConstantUtils::$CARD_TO_COINS);
        $this->theme($this->theme)->display();
    }
    
    public function coins_cz_finish($orderId){
        $coinsOrder = new CoinsOrderMgrModel();
        $coinsOrderInfo = $coinsOrder->getInfo($orderId);
        $coinsNum = $coinsOrderInfo['coins'];
        $this->assign('coins_num',$coinsNum);

        $user = new UserMgrModel();
		$userRes = $user->getUserInfo(get_uid());
		$coinsTotal = $userRes['coins'];//获取总虎币数
		$this->assign('coins_total',$coinsTotal);

    	$this->theme($this->theme)->display();
    }
} 