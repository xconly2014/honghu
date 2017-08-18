<?php

namespace Home\Model;


use Utils\ConstantUtils;

class AccountTradeOrderMgrModel extends OrderBaseModel{
    protected $tableName = "account_trade_order";

    public function addOrder($id,$type, $buyerTel="", $buyerQQ=""){
        $tradeMgr = new AccountTradeMgrModel();
        $gameId = $tradeMgr->getGameId($id);

        $created_date = date('Y-m-d H:i:s',time());
        $account_trade_id = $id;
        $isPaid = ConstantUtils::$IS_PAY['no'];

        if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['SELLER']){
            $real_payment = $tradeMgr->getSecurityMoney($id);
            $uid = get_uid();

        }elseif($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['BUYER']){
            $real_payment = $tradeMgr->getPrice($id);
            $uid = get_uid();

        }elseif($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['TRADE']){
            $real_payment = 0;
            $uid = ConstantUtils::$ID_NONE;
        }

        $sql = "insert into $this->tableName (buyer_tel, buyer_qq, customer_id, real_payment, is_paid, game_id,type,created_date,account_trade_id)
	        value ('$buyerTel', '$buyerQQ', $uid, $real_payment, $isPaid, '$gameId','$type','$created_date','$account_trade_id')";

        return $this->insert($sql);
    }

    public function getAccountTrade($oid){
        $sql = "select account_trade_id from $this->tableName where id = '$oid'";
        $result = $this->query($sql);
        return !empty($result) && is_array($result)? $result[0]['account_trade_id']:0;
    }

    public function updateOrder($atid,$dealOid,$type){
        $modified_date = date("Y-m-d H:i:s",time());
        $sql ="update $this->tableName set parent_order_id = '$dealOid',modified_date = '$modified_date' where account_trade_id = '$atid' and type = '$type' ";
        return $this->execute($sql);
    }

    public function getOrderType($id){
        $sql = "select type from $this->tableName where id=$id";
        $result = $this->query($sql);
        return $result[0]['type'];
    }

    public function orderHandle($idNo){
        parent::orderHandle($idNo);

        $orderId = $this->getRealId($idNo);
        $type = $this->getOrderType($orderId);

        $accountTradeId = $this->getAccountTrade($orderId);
        $atMgr = new AccountTradeMgrModel();

        if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['SELLER']){
            $atMgr->processAfterSellerPay($accountTradeId, $orderId);
        }
        if($type == ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['BUYER']){
            $orderInfo = $this->getInfo($orderId);
            $traderOrderId = $this->addOrder($accountTradeId, ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['TRADE'], $orderInfo['buyer_tel'], $orderInfo['buyer_qq']);

            $atMgr->processAfterBuyerPay($accountTradeId, $orderId, $traderOrderId, $this->getCustomerId($idNo));
            $cashOrderInfo = $atMgr->getCashOrder($accountTradeId);
            $this->setParentOrderId($cashOrderInfo[ConstantUtils::$CASH_ORDER_SELLER], $traderOrderId);
            $this->setParentOrderId($cashOrderInfo[ConstantUtils::$CASH_ORDER_BUYER], $traderOrderId);
        }
    }

    private function setParentOrderId($id, $parent_order_id){
        $sql = "update $this->tableName set parent_order_id={$parent_order_id} where id={$id}";
        return $this->insert($sql);
    }

    public function getInfo($id){
        $sql = "select id, game_id, account_trade_id, buyer_tel, buyer_qq from $this->tableName where id=$id";
        $result = $this->query($sql);
        if(empty($result)){
            return '';
        }
        $retValue = $result[0];

        $tradeMgr = new AccountTradeMgrModel();
        $tradeInfo = $tradeMgr->getRow($retValue['account_trade_id']);

        $retValue['game_name'] = $tradeInfo['game_name'];
        $retValue['title'] = $tradeInfo['title'];
        $retValue['price'] = $tradeInfo['price'];
        $retValue['security_money'] = $tradeInfo['security_money'];

        return $retValue;
    }

    public function delNotPaidOrder($atId, $type){
        $isPaid = ConstantUtils::$IS_PAY['no'];
        $uid = get_uid();

        $sql = "delete from $this->tableName where is_paid=$isPaid and customer_id=$uid and type=$type and account_trade_id=$atId";
        $this->execute($sql);
    }

    public function getSellerOrderHref($atId){
        $is_paid = ConstantUtils::$IS_PAY['no'];
        $type = ConstantUtils::$ACCOUNT_TRADE_ORDER_TYPE['SELLER'];
        $uid = get_uid();

        $sql = "select id from $this->tableName where account_trade_id=$atId and type=$type and is_paid=$is_paid and customer_id=$uid";
        $result = $this->query($sql);

        $retHref = array('url'=>"",'text'=>"");
        if(!empty($result) && $result[0]['id']){
            $retHref['url'] = U('Home/AccountTradeOrder/seller_pay', array('orderId'=>$result[0]['id']));
            $retHref['text'] = "马上付款";
        }
        return $retHref;
    }
}