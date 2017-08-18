<?php
namespace Admin\Model;

class ArticleMgrModel extends DataMgrBaseModel{
	private $tableName = 'help_article';
	
	public function getArticle(){
		$help_category_id = $_GET['help_category_id'];
		$sql = "select id,help_category_id,name from $this->tableName where help_category_id=$help_category_id";
		return $this->query($sql);

	}
	
	//插入文章数据
	public function insertArticle(){
		$help_category_id = $_GET['help_category_id'];
		$name = trim($_POST['name']);
		$text = trim($_POST['content']);
		$sql = "insert into $this->tableName (`name`,`help_category_id`,`text`)value('$name','$help_category_id','$text')";
		return $this->execute($sql);
	}
	
	public function delArticle($id){
		$sql = "delete from $this->tableName where id=$id";
		return $this->execute($sql);
	}
	
	public function editArticle($id){
		$sql = "select * from $this->tableName where id=$id";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];
	}
	
	public function updateArticle($id){
		$name = trim($_POST['name']);
		$text = trim($_POST['content']);
		$sql = "update $this->tableName set name='$name',`text`='$text' where id=$id";
		return $this->execute($sql);
	}
}