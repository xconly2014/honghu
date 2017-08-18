<?php
namespace Home\Model;

class SearchWordMgrModel extends DataMgrBaseModel{
	
	private $tableName = 'search_word';
	
	public function insertWord($name){
		if(!$this->isWordHasSearch($name)){
			$created_date = date('Y-m-d H:i:s',time());
			$sql= "insert into $this->tableName (created_date,word) values('$created_date','$name')";
			$this->execute($sql);
		}
	}

	private function isWordHasSearch($name){
		$sql = "select word from $this->tableName where word='$name'";
		return $this->query($sql);
	}
	
}