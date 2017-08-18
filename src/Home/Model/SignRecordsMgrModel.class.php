<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-18
 * Time: 下午5:03
 */

namespace Home\Model;


class SignRecordsMgrModel extends DataMgrBaseModel{
    private $tableName = 'sign_records';

    /*
     * 用户是否已经签到
     * 返回值：
     *       是：true
     *       否：false
     */
    public function hasSign($uid){
        $year = date('Y', time());
        $month = date('m', time());
        $day = date('d', time());

        $sql = "select id from $this->tableName where user_id=$uid and year=$year and month=$month and day=$day";

        $result = $this->query($sql);

        return !empty($result) && is_array($result)? true:false;
    }

    public function generateSignRecords(){
       
        $uid = get_uid();
        
        $year = date('Y', time());
        $month = date('m', time());
        $day = date('d', time());
        $createTime = date('Y-m-d H:i:s',time());

        $sql = "insert into $this->tableName(user_id, year, month, day, created_date)
                value($uid, $year, $month, $day, '$createTime')";
        return $this->insert($sql);
    }
    
    public function getLastRecord($uid){
        $sql = "select year, month, day from $this->tableName where user_id=$uid order by id desc limit 1";
        $result = $this->query($sql);
        if(empty($result)){
            return 0;
        }
        $lastSignDate = $result[0]['year'].'-'.$result[0]['month'].'-'.$result[0]['day'];
        $lastSignTime = strtotime($lastSignDate);
        return $lastSignTime;
    }
    
    public function getList($uId){
        $sql = "select created_date, year, month, day from $this->tableName where user_id=$uId";
        
        $result =  $this->query($sql);
        foreach($result as $rowIndex=>$rowValue){
            $result[$rowIndex]['signTime'] = strtotime($rowValue['created_date']);
            $result[$rowIndex]['signTag'] = $rowValue['year'].$rowValue['month'].$rowValue['day'];
        }       
        return $result;
    }
    
    public function isSignContinuous($uid){
        $lastSignTime = $this->getLastRecord($uid);
        $signDay =date('Y-m-d',time());
        $signTime = strtotime($signDay);
        return $signTime - $lastSignTime == 3600*24? true:false;
    }
} 