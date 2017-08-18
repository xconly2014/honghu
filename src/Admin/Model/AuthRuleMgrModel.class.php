<?php
/**
 * 游戏model
 * @author Administrator
 *
 */

namespace Admin\Model;

class AuthRuleMgrModel extends DataMgrBaseModel{
	private $table_name = "auth_rule";

	public function getAllRule(){
		$sql = "select id,title,m_id from $this->table_name order by id asc";
		return $this->query($sql);
	}
	
} 