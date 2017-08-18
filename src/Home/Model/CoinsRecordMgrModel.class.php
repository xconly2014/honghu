<?php
namespace Home\Model;
use Utils\ConstantUtils;

class CoinsRecordMgrModel extends DataMgrBaseModel{
	private $tableName = 'coins_record';

    public function RecordExist($oId, $type){
        $sql = "select id from $this->tableName where original_id=$oId and type=$type";
        $result = $this->query($sql);
        return !empty($result) && $result[0]['id']? true: false;
    }

    private function getOperationByType($type){
        $operation = "";
        switch($type){
            case ConstantUtils::$HB_RECORD_TYPE_CONTRIBUTION_VALUE:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$HB_RECORD_TYPE_BUY:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$HB_RECORD_TYPE_GIFT:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$HB_RECORD_TYPE_CZ:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;
            case ConstantUtils::$HB_RECORD_TYPE_SC_BACK:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_ACCOUNT_TRADE:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_ANDROID_SC:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_GROUP_BUY:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_CZ_PACKAGE:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_PACKAGE:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_REQUIREMENT:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_IOS_SC:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;

            case ConstantUtils::$HB_RECORD_TYPE_TRAFFIC:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;
        }
       return $operation;
    }

    public function generateRecord($oid, $coins, $uId, $type){
        if($type == ConstantUtils::$HR_RECORD_TYPE_NONE){
            dump(CONTROLLER_NAME."不能使用虎币支付");
            exit;
        }
        $operation = $this->getOperationByType($type);

        $userMgr = new UserMgrModel();
        if($operation == ConstantUtils::$OPERATION_ADD){
            $userMgr->addCoins($uId, $coins);
        }
        else if($operation == ConstantUtils::$OPERATION_MINUS){
            $userMgr->minusCoins($uId, $coins);
        }
        else{
            $this->error("该功能不允许使用虎币支付");
            exit;
        }

        $created_date = date('Y-m-d H:i:s',time());
        $sql = "insert into $this->tableName (original_id,coins_number,type,operation,user_id,created_date)
               value ($oid,$coins,$type,'$operation','$uId','$created_date')";
        return $this->execute($sql);
    }

    public function getList($userId){
        $creditsList = array();
        $rowUnit = array();

        $sql = "select id from $this->tableName where user_id='$userId'";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count, 8);
        $show = $Page->show();
        $sql = "select created_date,coins_number,operation,type,original_id from $this->tableName where user_id='$userId' order by id desc limit $Page->firstRow,$Page->listRows";
        $result = $this->query($sql);

        foreach($result as $row){
            $rowUnit['oid'] = $row['original_id'];
            $rowUnit['created_date'] = $row['created_date'];
            $rowUnit['score'] = $row['coins_number'];
            $rowUnit['operation'] = $row['operation'];
            $rowUnit['type'] = ConstantUtils::$HB_RECORD_TYPE_TEXT[$row['type']];

            $creditsList[] = $rowUnit;
        }

        return array('pager'=>$show,
            'data'=>$creditsList);
    }
    
    private function getCoinsCount($uid,$operation){
        $sql = "select sum(coins_number) as s from $this->tableName where user_id='$uid' and operation='$operation'";
        $result = $this->query($sql);
        return empty($result)?0:$result[0]['s'];
    }
    public function getCurrentCoins($uid){
        $addCoins = $this->getCoinsCount($uid, ConstantUtils::$OPERATION_ADD);
        $minusCoins = $this->getCoinsCount($uid, ConstantUtils::$OPERATION_MINUS);
        
        $currentCoins = $addCoins-$minusCoins;
        return $currentCoins;
    }
	
}
