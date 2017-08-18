<?php
namespace Admin\Model;

class FriendLinkMgrModel extends DataMgrBaseModel{
	private $tableName = 'friend_link';
	
	public function getList($name=''){
		$sql = "select id from $this->tableName where name like '%$name%'";
		$res = $this->query($sql);
		$count = count($res);
		$Page = new \Think\Page($count,8);//实例化分页类，传入总记录数和每页显示的记录数
		$sql = "select id,name,url from $this->tableName where name like '%$name%' order by id desc limit $Page->firstRow,$Page->listRows";
			
		$data = $this->query($sql);
		$show = $Page->show();//分页显示输出
			
		$result['data'] = $data;
		$result['show'] = $show;
		return $result;
	}
	
	public function addFriendLink(){
		$name = I('post.name');
		$url = I('post.url');
		
		$sql = "insert into $this->tableName (name,url) value ('$name','$url')";
		return $this->execute($sql);
	}
	
	public function delFriendLink($id){
		$sql = "delete from $this->tableName where id='$id'";
		return $this->execute($sql);
	}
}