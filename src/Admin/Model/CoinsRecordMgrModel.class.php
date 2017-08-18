<?php
namespace Admin\Model;

use Utils\ConstantUtils;
class CoinsRecordMgrModel extends DataMgrBaseModel{
    private $tableName = 'coins_record';
    
    public function getList($uid){
        $sql = "select id, original_id, coins_number, type, created_date, operation from $this->tableName where user_id='$uid'";
        $result = $this->query($sql);
        
    foreach($result as $row){
            $rowUnit['oid'] = $row['original_id'];
            $rowUnit['created_date'] = $row['created_date'];
            $rowUnit['score'] = $row['coins_number'];
            $rowUnit['operation'] = $row['operation'];
            $rowUnit['type'] = $row['type'];
            $rowUnit['type_text'] = ConstantUtils::$HB_RECORD_TYPE_TEXT[$row['type']];
            $rowUnit['url'] = $this->getOriginalUrl($row['type'], $row['original_id']);

            $creditsList[] = $rowUnit;
        }
        return $creditsList;
    }

    private function getOriginalUrl($type, $originalId){
        $url = "";
        switch($type){
            case ConstantUtils::$HB_RECORD_TYPE_BUY:
                $url = U('Admin/CoinsOrder/record_details', array('id'=>$originalId));
                break;
            case ConstantUtils::$HB_RECORD_TYPE_CZ:
                $url = U('Admin/CZOrderIOS/order_view', array('id'=>$originalId));
                break;
        }

        return $url;
    }

    public function getInfo($oid){
        $sql = "select id, original_id, coins_number, type, created_date, operation from $this->tableName where original_id='$oid'";
        $result = $this->query($sql);

        return !empty($result)? $result[0]:"";
    }

    public function addSendCoins($uid){

        $operation = ConstantUtils::$OPERATION_ADD;
        $coins = I('post.num');
        $created_date = date('Y-m-d H:i:s',time());
        $original_id = 0;
        $type = I('post.type');

        $sql = "insert into $this->tableName (original_id,coins_number,type,user_id,created_date,operation)
                value ('$original_id','$coins','$type','$uid','$created_date','$operation')";

        return $this->execute($sql);
    }

    /*
     * 退款操作
     */
    public function addRecord($uid, $original_id, $payment){
        $type = ConstantUtils::$HB_RECORD_TYPE_CZ_BACK;
        $created_date = date('Y-m-d H:i:s',time());
        $operation = ConstantUtils::$OPERATION_ADD;

        $sql = "insert into $this->tableName (original_id, coins_number, type, user_id, created_date,operation)
                value ($original_id,$payment,$type,$uid,'$created_date','$operation')";
        $this->execute($sql);
    }
}