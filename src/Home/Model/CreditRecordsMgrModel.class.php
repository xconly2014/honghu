<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-18
 * Time: 下午5:25
 */

namespace Home\Model;


use Utils\ConstantUtils;

class CreditRecordsMgrModel extends DataMgrBaseModel{
    private $tableName = 'credit_records';

    private function generateCreditRecords($uid, $type, $score, $originalId, $operation){
        $createTime = date('Y-m-d H:i:s',time());

        $sql =  "insert into $this->tableName(type, user_id, score, original_id, created_date, operation)
                 value($type, $uid, $score, $originalId, '$createTime', '$operation')";
        return $this->insert($sql);
    }

    public function generateSignRecord($originalId, $uid, $score){
        $type = ConstantUtils::$CREDITS_TYPE_SIGN_DAY;
        $operation = ConstantUtils::$OPERATION_ADD;
        return $this->generateCreditRecords($uid, $type, $score, $originalId, $operation);
    }

    public function generateCZRecord($uid, $originalId, $score){
        $type = ConstantUtils::$CREDITS_TYPE_CZ;
        $operation = ConstantUtils::$OPERATION_ADD;
        return $this->generateCreditRecords($uid, $type, $score, $originalId, $operation);
    }
    
  
    public function generateGoodsExchangeRecord($uid,$originalId,$credits){
    	$type = ConstantUtils::$CREDITS_TYPE_GOODS_EXCHANGE;
    	$operation = ConstantUtils::$OPERATION_MINUS;
    	$score = $credits;
    	return $this->generateCreditRecords($uid, $type, $score, $originalId, $operation);
    }

	public function getList($userId){
        $creditsList = array();
        $rowUnit = array();

        $sql = "select id from $this->tableName where user_id='$userId'";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count, 10);
        $show = $Page->show();
		$sql = "select id, type, created_date,score,operation from $this->tableName where user_id='$userId' order by id desc limit $Page->firstRow,$Page->listRows";
		$result = $this->query($sql);

        foreach($result as $row){
            $rowUnit['created_date'] = $row['created_date'];
            $rowUnit['score'] = $row['score'];
            $rowUnit['operation'] = $row['operation'];
            $rowUnit['type'] = ConstantUtils::$CREDIT_TYPE_TEXT[$row['type']];

            $creditsList[] = $rowUnit;
        }

		return array('pager'=>$show,
                     'data'=>$creditsList);
	}

    public function recordExist($type, $originalId){
        switch($type){
            case ConstantUtils::$CREDITS_TYPE_CZ:
                $sql = "select id from $this->tableName where original_id=$originalId";
                break;

            default:
                break;
        }

        $result = $this->query($sql);
        return empty($result)? false:true;
    }
    
    private function getCreditsCount($uid, $operation){
        $sql = "select sum(score) as s from $this->tableName where user_id='$uid' and operation='$operation'";
        $result = $this->query($sql);
        return empty($result)? 0:$result[0]['s'];
    }
    
    public function getCurrentCredits($uid){
        $addCredits = $this->getCreditsCount($uid,ConstantUtils::$OPERATION_ADD);
        $minusCredits = $this->getCreditsCount($uid,ConstantUtils::$OPERATION_MINUS);
        
        $currentCredits = $addCredits - $minusCredits;
        return $currentCredits;
    }
}