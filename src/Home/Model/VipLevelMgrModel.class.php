<?php
namespace Home\Model;

use Utils\ConstantUtils;
class VipLevelMgrModel extends DataMgrBaseModel{
    private $tableName = 'vip_level';

    public function getVipLevel(){
        $sql = "select start, name from $this->tableName";
        return $this->query($sql);
    }

    public function getVipInfo($cz_sum){
        
        if($cz_sum < ConstantUtils::$VIP_START){
            return '';
        }
        
        $sql = "select id, name, start, end, level from $this->tableName where start<='$cz_sum' and end>'$cz_sum'";
        $result = $this->query($sql);
        
        return empty($result)?'':$result[0];
    }
    
    public function getVipSignScore($cz_sum){
        $multiple = 1;
        $unit_score = ConstantUtils::$CREDITS_SCORE_SIGN_DAY;

        if($cz_sum >= ConstantUtils::$VIP_START){
            $sql = "select id, sign_score from $this->tableName where start<='$cz_sum' and end>'$cz_sum'";
            $result = $this->query($sql);
            $multiple =  $result[0]['sign_score'];
        }//if
        
        return $unit_score * $multiple;
    }
}