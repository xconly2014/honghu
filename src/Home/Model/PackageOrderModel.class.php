<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-14
 * Time: 下午4:31
 */

namespace Home\Model;


use Utils\ConstantUtils;

class PackageOrderModel extends OrderBaseModel{
    protected $tableName = 'package_order';

    public function insertOrder($type,$package_id, $payment, $gaId){
        $created_date = date('Y-m-d H:i:s',time());
        $isPaid = 0;
        $uid = get_uid();

        $sql = "insert into $this->tableName (game_account_id, customer_id, is_paid, real_payment, type, package_id, created_date)
        value ($gaId, $uid, $isPaid, $payment, '$type','$package_id', '$created_date')";
        return $this->insert($sql);
    }

    public function insertTradingOrder($package_id, $game_account_id){
        $type = ConstantUtils::$ORDER_TYPE_TRADE;
        $created_date = date('Y-m-d H:i:s',time());
        $sql = "insert into $this->tableName (type,package_id,created_date,game_account_id) value ($type,'$package_id','$created_date','$game_account_id')";
        return $this->insert($sql);
    }

    public function getPackage($id){
        $sql = "select package_id from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return !empty($result) && is_array($result)? $result[0]['package_id']:0;
    }

    public function getPackageOrder($id){
        $sql ="select package_id from $this->tableName where id='$id'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0]['package_id'];

    }
    public function setParentOrderId($id, $parent_order_id){
        $sql = "update $this->tableName set parent_order_id={$parent_order_id} where id={$id} ";
        return $this->insert($sql);
    }

    public function getOrderId($type,$package_id){
        $sql = "select id from $this->tableName where package_id=$package_id and type=$type";
        $result = $this->query($sql);
        return empty($result)?'':$result[0]['id'];
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
        $packageId = $this->getPackage($orderId);

        if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER){
            $packageMgr = new PackageMgrModel();
            $orderInfo = $this->getInfo($orderId);

            $traderOrderId = $this->insertTradingOrder($packageId, $orderInfo['game_account_id']);
            $packageMgr->processAfterPlayerPay($packageId, $traderOrderId, $orderId, $this->getCustomerId($idNo));
            $cashOrderInfo = $packageMgr->getCashOrder($packageId);
            $this->setParentOrderId($cashOrderInfo[ConstantUtils::$CASH_ORDER_PLAYER], $traderOrderId);
            $this->setParentOrderId($cashOrderInfo[ConstantUtils::$CASH_ORDER_TRAINER], $traderOrderId);
        }

        else if($type == ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER){
            $packageMgr = new PackageMgrModel();
            $packageMgr->processAfterTrainerPay($packageId, $orderId);
        }
    }
    
    public function getInfo($id){
        $sql = "select id,package_id,game_account_id,real_payment from $this->tableName where id='$id'";
        $result = $this->query($sql);
        if(empty($result)){
            return '';
        }
        $retValue = $result[0];
        $package = new PackageMgrModel();
        $packageRes = $package->getPackageInfo($retValue['package_id']);
        $retValue['game_name'] = $packageRes['name'];
        $retValue['title'] = $packageRes['title'];

        return $retValue;
    }

    public function getSellerOrderHref($pId){
        $is_paid = ConstantUtils::$IS_PAY['no'];
        $type = ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER;
        $uid = get_uid();

        $sql = "select id from $this->tableName where package_id=$pId and type=$type and is_paid=$is_paid and customer_id=$uid";
        $result = $this->query($sql);

        $retHref = array('url'=>"", 'text'=>"");
        if(!empty($result) && $result[0]['id']){
            $retHref['url'] = U('Home/PackageOrder/pay_security', array('orderId'=>$result[0]['id']));
            $retHref['text'] = "马上付款";
        }
        return $retHref;
    }

    /*private function getMyUnPaidOrder($requirement_id){
        $is_paid = ConstantUtils::$IS_PAY['no'];
        $type = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
        $uid = get_uid();

        $sql = "select id from $this->tableName where package_id = '$requirement_id' and customer_id = '$uid' and is_paid = '$is_paid' and type = '$type'";
        $result = $this->query($sql);

        return empty($result) ? '' : $result[0]['id'];
    }

    public function delNotPaidOrderIfNeed($packageId){
        $tradeOId = $this->getTradeOrderId($packageId);
        $myOId = $this->getMyUnPaidOrder($packageId);
        if($tradeOId && $myOId){
            $this->delOrder($tradeOId);
            $this->delOrder($myOId);
        }
    }

    private function delOrder($oid){
        $sql = "delete from $this->tableName where id = '$oid'";
        return $this->execute($sql);
    }

    private function getTradeOrderId($packageId){
        $type = ConstantUtils::$ORDER_TYPE_TRADE;
        $sql = "select id from $this->tableName where package_id = '$packageId' and type = $type";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0]['id'];
    }
    */
} 