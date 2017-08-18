<?php


namespace Home\Model;


use Utils\ConstantUtils;

class OrderBaseModel extends DataMgrBaseModel {

    public function setPayInfo($payway, $callbackUrl, $id){
        $payOid = genOrderId($this->tableName, $id);
        $sql = "update $this->tableName set pay_way='$payway', callback_url='$callbackUrl', id_no='$payOid' where id=".$id;

        $this->execute($sql);
        return $this->getPayInfo($id);
    }

    public function getPayInfo($id){
        $sql = "select real_payment, pay_way, id_no from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }
        return array(
            'way'=> $result[0]['pay_way'],
            'payment'=> $result[0]['real_payment'],
            'id_no'  => $result[0]['id_no']
        );
    }

    public function checkOrderStatus($idNo){
        $sql = "select is_paid from $this->tableName where id_no=$idNo";
        $result = $this->query($sql);
        return $result[0]['is_paid'];
    }

    public function orderHandle($idNo){
        $modifyTime = date('Y-m-d H:i:s',time());
        $isPaid = 1;

        $sql = "update $this->tableName set modified_date='$modifyTime', is_paid=$isPaid, pay_time='$modifyTime' where id_no=$idNo";
        $this->execute($sql);
    }

    public function getCallBackUrl($idNo){
        $sql = "select callback_url from $this->tableName where id_no=".$idNo;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }

        $id = $this->getRealId($idNo);
        return U($result[0]['callback_url'], array('orderId'=>$id));
    }

    public function orderIsPaid($id){
        $sql = "select is_paid from $this->tableName where id=$id";
        $result = $this->query($sql);

        return !empty($result) && $result[0]['is_paid']? true:false;
    }

    public function getIdNoByOid($id){
        $sql = "select id_no from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }
        return $result[0]['id_no'];
    }

    public function getRealId($idNo){
        $sql = "select id from $this->tableName where id_no=".$idNo;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }
        return $result[0]['id'];
    }

    public function getPaidTime($id){
        $sql = "select pay_time from $this->tableName where id=$id";
        $result = $this->query($sql);

        return !empty($result) && $result[0]['pay_time']? $result[0]['pay_time']:"";
    }

    public function getCustomerId($idNo){
        $sql = "select customer_id from $this->tableName where id_no=".$idNo;
        $result = $this->query($sql);
        return !empty($result) && $result[0]['customer_id']? $result[0]['customer_id']:ConstantUtils::$ID_NONE;
    }
    
    public function insertGrow($idNo,$oid,$unit,$type){
        $growRecordMgr = new GrowRecordMgrModel();
        if(!$growRecordMgr->recordExist($oid, $type)){
            $customer_id = $this->getCustomerId($idNo);
            $growRecordMgr->addRecord($oid, $type, $customer_id, $unit);
            $userMgr = new UserMgrModel();
            $userMgr->addGrowUnit($customer_id, $unit);
            $msgMgr = new MessageMgrModel();
            $msgMgr->generateMessage(ConstantUtils::$MESSAGE_TYPE_VIP_CHANGE, $customer_id, "");
        }
    }

} 