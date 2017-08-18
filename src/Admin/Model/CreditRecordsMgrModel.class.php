<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/10/23
 * Time: 14:40
 */

namespace Admin\Model;


use Utils\ConstantUtils;
class CreditRecordsMgrModel extends DataMgrBaseModel {
    private $tableName = 'credit_records';

    public function getAllRecordList(){
        $result = array('data'=> "", 'show'=> "");

        $sql = "select id from $this->tableName";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        $sql = "select id, type, operation, user_id, score, original_id, created_date from $this->tableName order by id desc limit $Page->firstRow,$Page->listRows";
        $result['show'] = $Page->show();

        $data = $this->query($sql);
        $rowUnit = array();
        foreach($data as $row){
            $rowUnit['oid_url'] = $this->getOrderUrl($row['type'], $row['original_id']);
            $rowUnit['oid'] = $row['original_id'];
            $rowUnit['created_date'] = $row['created_date'];
            $rowUnit['score'] = $row['score'];
            $rowUnit['operation'] = $row['operation'];
            $rowUnit['type'] = ConstantUtils::$CREDIT_TYPE_TEXT[$row['type']];
            $result['data'][] = $rowUnit;
        }
        return $result;
    }

    public function getUserRecordList($uid){
        if(!$uid){
            return "";
        }
        $sql = "select id from $this->tableName where user_id='$uid'";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        $sql = "select id, type, created_date, original_id, score, operation from $this->tableName where user_id='$uid' order by id desc limit $Page->firstRow,$Page->listRows";
        $creditsList['show'] = $Page->show();
        
        $data = $this->query($sql);
        
        foreach($data as $row){
            $rowUnit['oid_url'] = $this->getOrderUrl($row['type'], $row['original_id']);
            $rowUnit['oid'] = $row['original_id'];
            $rowUnit['created_date'] = $row['created_date'];
            $rowUnit['score'] = $row['score'];
            $rowUnit['operation'] = $row['operation'];
            $rowUnit['type'] = ConstantUtils::$CREDIT_TYPE_TEXT[$row['type']];
            $creditsList['data'][] = $rowUnit;
        }
        return $creditsList;
    }

    private function getOrderUrl($type, $orderId){
        $url = "";
        switch($type){
            case ConstantUtils::$CREDITS_TYPE_CZ:
                $url =  U("Admin/CZOrderIOS/order_view", array('id'=>$orderId));
                break;
            case ConstantUtils::$CREDITS_TYPE_GOODS_EXCHANGE:
                $url =  U("Admin/GoodsOrder/details", array('id'=>$orderId));
            default:
                break;
        }
        return $url;
    }
    
    private function getCreditsCount($uid, $operation){
        $sql = "select sum(score) as s from $this->tableName where user_id='$uid' and operation='$operation'";
        $result = $this->query($sql);
        return empty($result)? 0:$result[0]['s'];
    }

    public function user_credit_info($uid){
        $addCredits = $this->getCreditsCount($uid,ConstantUtils::$OPERATION_ADD);
        $minusCredits = $this->getCreditsCount($uid,ConstantUtils::$OPERATION_MINUS);
        $currentCredits = $addCredits - $minusCredits;

        return array('add'=>$addCredits,
                     'minus'=>$minusCredits,
                     'current'=>$currentCredits);
    }
    
    public function getCreatedDate($Cid){
        $sql = "select created_date from $this->tableName where id = '$Cid'";
        $result =  $this->query($sql);
        $pay_time = '';
        if(!empty($result)){
            $pay_time = $result[0]['created_date'];
        }
        return $pay_time;
    }

    public function delRecord($original_id){
        $sql = "delete from $this->tableName where original_id=$original_id";
        return $this->execute($sql);
    }
}
