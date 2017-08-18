<?php
namespace Home\Model\SC;

use Home\Model\DataMgrBaseModel;

class IOSScGameAccountMgrModel extends DataMgrBaseModel{
	private $tableName = 'sc_game_account_ios';
	
	public function scAccountInsert(){
		$role = trim($_POST['role']);
		$qufu = trim($_POST['qufu']);
		$contact_way = trim($_POST['contact_way']);
		$account = trim($_POST['account']);
		$password = trim($_POST['password']);
		$sql = "insert into $this->tableName(role,qufu,contact_way,account,password)value('$role','$qufu','$contact_way','$account','$password')";
		return $this->insert($sql);
	}
	
	
	public function getGameAccount($gaid){
	    $sql = "select account,qufu,role,contact_way from $this->tableName where id = '$gaid'";
	    $result = $this->query($sql);
	    return empty($result)?'':$result[0];
	    
	}
}