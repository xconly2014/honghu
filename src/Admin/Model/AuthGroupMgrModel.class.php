<?php
/**
 * 游戏model
 * @author Administrator
 *
 */

namespace Admin\Model;
use Utils\ConstantUtils;

class AuthGroupMgrModel extends DataMgrBaseModel{
	private $table_name = "auth_group";
	
	/**
	 * 获取数据
	 * @return \Think\mixed
	 */
	public function getAll(){
		$sql = "select id,title from $this->table_name order by id desc ";
		return $this->query($sql);
	}
	
	/**
	 * 添加权限组
	 * @return string
	 */
	public function addData(){
		$title = I('post.name');
		$rules =  implode(',',I('post.rule_id'));
		$status = ConstantUtils::$AUTH_GROUP_STATUS;
		$sql = "insert into $this->table_name (title,status,rules) values('$title','$status','$rules')";
		return $this->insert($sql);
	}
	
	/**
	 * 通过id获取权限组的title和规则
	 * @param unknown $id
	 * @return multitype:
	 */
	public function getRuleById($id){
		$sql = "select title,rules from $this->table_name where id = '$id'";
		$data = $this->query($sql);
		$info['name'] = $data[0]['title'];
		$info['myRules'] = explode(',', $data[0]['rules']);
		return $info;
	}
	
	/**
	 * 通过id修改数据
	 * @param unknown $id
	 * @return \Think\false
	 */
	public function updateData($id){
		$rules =  implode(',',I('post.rule_id'));
		$sql = "update $this->table_name set rules = '$rules' where id = '$id'";
		return $this->execute($sql);
	}
	
	/**
	 * 批量删除
	 * @param unknown $ids
	 */
	public function delAll($ids){
		$sql = "delete from  $this->table_name where id in($ids)";
		return $this->execute($sql);
	}
	
	
} 