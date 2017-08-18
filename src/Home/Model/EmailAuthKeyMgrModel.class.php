<?php
namespace Home\Model;

class EmailAuthKeyMgrModel extends DataMgrBaseModel{
	
	private $tableName = 'email_auth_key';
	
	//插入生成key
	public function insertEmailKey($u_id,$rand_num,$key){
		
		$created_date = date('Y-m-d H:i:s',time());
		
		$sql = "insert into $this->tableName (u_id,rand_num,`key`,created_date,active) value ('$u_id','$rand_num','$key','$created_date','1')";
		return $this->execute($sql);
	}
	
	//检测验证key是否村子以及获取key和创建时间
	public function checkEmailKey($u_id){
		
		$sql = "select created_date,`key` from $this->tableName where u_id='$u_id'";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];
	}
	
	//更新emailKey
	public function updateEmailKey($u_id,$rand_num,$key){
		$created_date = date('Y-m-d H:i:s',time());
		
		$sql = "update $this->tableName set rand_num='$rand_num',`key`='$key',created_date='$created_date',active=1 where u_id='$u_id'";
		return $this->execute($sql);
	}
	
	//更新Key的状态，即是否已经验证
	public function updateKeyActive($uid){
		$sql = "update $this->tableName set active='0' where u_id='$uid'";
		return $this->execute($sql);
	}
	
	//获取当前的验证Key状态
	public function getKeyActive($uid){
		$sql = "select active from $this->tableName where u_id='$uid'";
		$result = $this->query($sql);
		return empty($result)?'':$result[0]['active'];
		
	}
}