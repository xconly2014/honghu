<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/1/5
 * Time: 11:23
 */

namespace Admin\Model;


use Utils\ConstantUtils;

class GrowRecordMgrModel extends DataMgrBaseModel
{
    protected $tableName = "grow_records";

    /*
     * 退款操作
     */
    public function delRecord($original_id){
        $sql = "delete from $this->tableName where original_id=$original_id";
        return $this->execute($sql);
    }

    private function getGrowUnitCount($uid, $operation){
        $sql = "select sum(unit) as s from $this->tableName where user_id='$uid' and operation='$operation'";
        $result = $this->query($sql);
        return empty($result)? 0:$result[0]['s'];
    }

    public function updateUnitInfo($uid){
        $addUnit = $this->getGrowUnitCount($uid,ConstantUtils::$OPERATION_ADD);
        $minusUnit = $this->getGrowUnitCount($uid,ConstantUtils::$OPERATION_MINUS);
        $currentUnit = $addUnit - $minusUnit;

        return array(
            'add'=>$addUnit,
            'minus'=>$minusUnit,
            'current'=>$currentUnit
        );
    }
}