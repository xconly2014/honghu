<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-30
 * Time: 下午5:48
 */

namespace Home\Model;


use Utils\ConstantUtils;

class PwdAuthKeyMgrModel extends DataMgrBaseModel{
    private $tableName = 'pwd_auth_key';

    public function insertKey($account,$number){
    	$created_date = date('Y-m-d H:i:s',time());
    	$ticket = $account;
        $rand_num = $number;
        $active = ConstantUtils::$IS_AUTH['no'];

        $sql = "insert into $this->tableName (created_date,ticket,rand_num,active) value ('$created_date','$ticket','$rand_num', '$active')";
        return $this->insert($sql);
    }

    
    //检查有效性
    public function checkEffectiveness($id){
    	$sql = "select created_date,active from $this->tableName where id = '$id'";
    	$fields = $this->query($sql);
    	$data['time'] = strtotime($fields[0]['created_date']);
    	$data['active'] = $fields[0]['active'];
    	return $data;
    }
    
    //检查邮箱或者短信的验证码
    public function checkAuthKey($id,$code){
    	$sql = "select rand_num from $this->tableName where id = '$id' and rand_num = '$code'";
    	return $this->query($sql);
    }
    
    //修改Active
    public function updateAuthActive($id){
    	$active = ConstantUtils::$IS_AUTH['yes'];
    	$sql = "update $this->tableName set active = '$active' where id = '$id'";
    	return $this->execute($sql);
    }
	
    
    //获取邮箱或手机号码
    public function getTicket($id){
        $active = ConstantUtils::$IS_AUTH['yes'];
    	$sql = "select ticket from $this->tableName where id = '$id' and active=$active";
        $result = $this->query($sql);
        return !empty($result) && $result[0]['ticket']? $result[0]['ticket']:"";
    }

    public function unvalidTicket($id){
        $active = ConstantUtils::$IS_AUTH['no'];
        $sql = "update $this->tableName set active=$active where id=$id";
        $this->execute($sql);
    }
} 