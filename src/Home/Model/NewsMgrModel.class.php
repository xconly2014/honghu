<?php
namespace Home\Model;

class NewsMgrModel extends DataMgrBaseModel{
	
	private $tableName = 'news';
	
	public function getList(){
		
		$sql= "select id,title from $this->tableName order by created_date desc limit 8";
		return $this->query($sql);
	}
	
	public function getInfo($id){
		
		$sql = "select id,title, `text`,created_date,html_title,html_keyword,html_desc from $this->tableName where id='$id'";
		$result = $this->query($sql);
		if(empty($result)){
			return '';
		}
		return $result[0];
	}
}