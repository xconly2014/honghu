<?php
namespace Admin\Model;

class CategoryMgrModel extends DataMgrBaseModel{
		private $tableName = 'help_category';
		
		//获取目录列表
		public function getCategory(){
			$sql = "select id,name from $this->tableName";
			return $this->query($sql);
		}
		//插入目录数据
		public function insertCategory(){
			 $name = trim($_POST['name']);
			 $sql = "insert into $this->tableName (name)value('$name')";
			 return $this->execute($sql);
		}
		
		public function delCategory(){
			$id=$_GET['id'];
			$sql = "delete from $this->tableName where id=$id";
			return $this->execute($sql);
		}
		
		public function editCategory(){
		 	$id = $_GET['id'];
		 	$sql = "select id,name from $this->tableName where id=$id";
		 	$result = $this->query($sql);
		 	return empty($result)?'':$result[0];
	 }
	 
	 public function updateCategory(){
	 	$id=$_GET['id'];
	 	$name = trim($_POST['name']);
	 	$sql = "update $this->tableName set name='$name' where id=$id";
	 	return $this->execute($sql);
	 }
	 
	 
}