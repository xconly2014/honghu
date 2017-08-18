<?php
namespace Home\Model;

class FriendLinkMgrModel extends DataMgrBaseModel{
	private $tableName = 'friend_link';
	
	public function getList(){
		$sql = "select name,url from $this->tableName";
		return $this->query($sql);
	}
}