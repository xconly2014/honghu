<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/25
 * Time: 10:29
 */

namespace Home\Model;


use Utils\ConstantUtils;

class GrowRecordMgrModel extends DataMgrBaseModel
{
    protected $tableName = "grow_records";

    private function getOperationByType($type){
        $operation = "";
        switch($type){
            case ConstantUtils::$GROW_RECORD_TYPE_CZ:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$GROW_RECORD_TYPE_SCH_IOS:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$GROW_RECORD_TYPE_SCH_ANDROID:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$GROW_RECORD_TYPE_CZ_PACKAGE:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$GROW_RECORD_TYPE_ONE_GROUP:
                $operation = ConstantUtils::$OPERATION_ADD;
                break;
            case ConstantUtils::$GROW_RECORD_TYPE_DAILY:
                $operation = ConstantUtils::$OPERATION_MINUS;
                break;
            default:
                break;
        }
        return $operation;
    }

    public function addRecord($oid, $type, $customer_id, $unit){
        $operation = $this->getOperationByType($type);
        $created_date = date('Y-m-d H:i:s',time());

        $sql = "insert into $this->tableName(type, operation, user_id, unit, original_id, created_date) value($type, '$operation', $customer_id, $unit, $oid, '$created_date')";
        $this->insert($sql);
    }

    public function recordExist($oid, $type){
        $sql = "select id from $this->tableName where type=$type and original_id=$oid";
        $result = $this->query($sql);

        return empty($result)? false:true;
    }

    public function getList($uid){

        $sql = "select id from $this->tableName where user_id='$uid'";
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,10);
        $show = $Page->show();

        $sql = "select id,created_date,type,operation,original_id,unit from $this->tableName where user_id='$uid' order by id desc limit $Page->firstRow,$Page->listRows";
        $result = $this->query($sql);

        $retValue = $result;
        foreach($result as $k=>$row){
            $retValue[$k]['type'] = ConstantUtils::$GROW_RECORD_TYPE_TEXT[$row['type']];
        }


        $info['show'] = $show;
        $info['data'] = $retValue;

        return $info;
    }
}