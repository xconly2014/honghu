<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-16
 * Time: 下午3:55
 */

namespace Home\Controller;


use Home\Model\AccountTradeMgrModel;
use Home\Model\AccountTradeOrderMgrModel;
use Think\Controller;
use Utils\ConstantUtils;

class AccountTradeOrderController extends OrderBaseController{
    private $type = "account_trade_order";

    /**
     * 卖家付保证金
     */
    public function seller_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "AccountTrade/publish_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }
        if(IS_GET){
        	$orderMgr = new AccountTradeOrderMgrModel();
        	$account_trade_id = $orderMgr->getAccountTrade($orderId);
        	
            $tradeMgr = new AccountTradeMgrModel();
            $price = $tradeMgr->getSecurityMoney($account_trade_id);

            $this->assign('pay_title',"保证金");
            $this->assign('pay_price',$price);
            $this->assign('result_url', U('Home/AccountTradeOrder/customer_paid_finish', array('orderId'=>$orderId)));
            $this->assign('result_finish_url', U('Home/AccountTradeOrder/paid_finish', array('orderId'=>$orderId)));
            $this->assign('submit_url', U('Home/AccountTradeOrder/seller_pay', array('orderId'=>$orderId)));
            
            $this->theme($this->theme)->display('seller_pay');
        }
    }
    
    public function buyer_pay($orderId){
        if(IS_POST){
            $payway = I('post.pay_way');
            $callbackUrl = "AccountTrade/get_finish";

            $info = $this->prePay($payway, $callbackUrl, $orderId);
            return $this->pay($payway, $this->type, $info['id_no'], $info['payment']);
        }
        if(IS_GET){
            $orderMgr = new AccountTradeOrderMgrModel();
            $account_trade_id = $orderMgr->getAccountTrade($orderId);
            
            $tradeMgr = new AccountTradeMgrModel();
            $price = $tradeMgr->getPrice($account_trade_id);
            
            $this->assign('pay_title',"游戏账号");
            $this->assign('pay_price',$price);
            $this->assign('result_url', U('Home/AccountTradeOrder/customer_paid_finish', array('orderId'=>$orderId)));
            $this->assign('result_finish_url', U('Home/AccountTradeOrder/paid_finish', array('orderId'=>$orderId)));
            $this->assign('submit_url', U('Home/AccountTradeOrder/buyer_pay', array('orderId'=>$orderId)));
            
            $this->theme($this->theme)->display('buyer_pay');
        }
        
    }

    public function paid_finish($orderId){
        $orderMgr = new AccountTradeOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $type = $orderMgr->getOrderType($orderId);

        if(!$status){
            if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['BUYER']){
                return $this->redirect('Home/AccountTradeOrder/buyer_pay', array('orderId'=>$orderId));

            }
            else if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['SELLER']){
                return $this->redirect('Home/AccountTradeOrder/seller_pay', array('orderId'=>$orderId));
            }
        }

        if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['BUYER']){
            return $this->redirect('Home/AccountTrade/publish_finish', array('orderId'=>$orderId));
        }
        else if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['SELLER']){
            return $this->redirect('Home/AccountTrade/get_finish', array('orderId'=>$orderId));
        }
    }

    public function customer_paid_finish($orderId){
        $orderMgr = new AccountTradeOrderMgrModel();
        $status = $orderMgr->orderIsPaid($orderId);
        $this->ajaxReturn(array('status'=>$status));
    }

    public function order_hb_pay($idNo, $payment){
        parent::order_hb_pay($idNo, $payment, ConstantUtils::$HB_RECORD_TYPE_ACCOUNT_TRADE);
    }


} 