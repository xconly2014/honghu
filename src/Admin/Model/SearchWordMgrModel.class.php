<?php
namespace Admin\Model;


class SearchWordMgrModel extends DataMgrBaseModel{
	private $tableName = 'search_word';
	
	public function getList($word=""){
		$sql = "select created_date from $this->tableName where word like '%$word%'";
		$res = $this->query($sql);
		$count = count($res);
		$Page = new \Think\Page($count,20);//实例化分页类，传入总记录数和每页显示的记录数
		$sql= "select created_date,word from $this->tableName where word like '%$word%' order by created_date desc limit $Page->firstRow,$Page->listRows";
			
		$data = $this->query($sql);
		$show = $Page->show();//分页显示输出
			
		$result['data'] = $data;
		$result['show'] = $show; 
		return $result;				
	}
	
}
