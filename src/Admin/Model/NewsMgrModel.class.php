<?php
namespace Admin\Model;


class NewsMgrModel extends DataMgrBaseModel{
	private $tableName = 'news';
	
	public function getList($title=""){
		$sql = "select id from $this->tableName where title like '%$title%'";
		$res = $this->query($sql);
		$count = count($res);
		$Page = new \Think\Page($count,8);//实例化分页类，传入总记录数和每页显示的记录数
		$sql= "select id,created_date,title,text,html_title,html_keyword,html_desc from $this->tableName where title like '%$title%' order by id desc limit $Page->firstRow,$Page->listRows";
			
		$data = $this->query($sql);
		$show = $Page->show();//分页显示输出
			
		$result['data'] = $data;
		$result['show'] = $show; 
		return $result;				
	}
	
	public function addNews(){
		$created_date = date('Y-m-d H:i:s');
		$title = I('post.title');
		$html_desc = I('post.html_desc');
		$html_keyword = I('post.html_keyword');
		$html_title = I('post.html_title');
		$text = I('post.content');
		
		$sql = "insert into $this->tableName (created_date,title,html_desc,html_keyword,html_title,`text`) value ('$created_date','$title','$html_desc','$html_keyword','$html_title','$text')";
		return $this->execute($sql);
	}
	
	public  function editNews($id){
	    $sql = "select id, created_date, title, text, html_title, html_keyword, html_desc from $this->tableName where id='$id'";
	    $result = $this->query($sql);
	    return empty($result)?'':$result[0];
	}
	
	public function updateNews($id){
	    $title = I('post.title');
	    $html_title = I('post.html_title');
	    $html_desc = I('post.html_desc');
	    $html_keyword = I('post.html_keyword');
	    $text = I('post.content');
		$cur_time = date('Y-m-d H:i:s');
	    
	    $sql = "update $this->tableName set created_date='$cur_time', title='$title', html_title='$html_title', html_desc='$html_desc', html_keyword='$html_keyword', `text`='$text' where id='$id'";
	    return $this->execute($sql);
	}
	
	public function deleteNews($id){
		$sql = "delete from $this->tableName where id='$id'";
		return $this->execute($sql);
	}
	
}
