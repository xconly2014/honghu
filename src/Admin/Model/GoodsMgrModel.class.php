<?php
namespace Admin\Model;

class GoodsMgrModel extends DataMgrBaseModel{
	private $tableName = 'goods';
	
	public function addGoods($pic_name){
		$name = I('post.name');
		$credits = I('post.credits');
		$store_num = I('post.store_num');
		$exchange_num = I('post.exchange_num');
		$details = I('post.content');
		
		$sql = "insert into $this->tableName (name,credits,store_num,exchange_num,pic_name,details) values ('$name','$credits','$store_num','$exchange_num','$pic_name','$details')";
		$this->execute($sql);
	}
	
	public function getGoodsList($name='',$isPage=false){
		if($isPage){
			$sql = "select id from $this->tableName where name like '%$name%'";
			$res = $this->query($sql);
			$count = count($res);
			
			$Page = new \Think\Page($count,8);  //实例化分页类，传入总记录数和每页显示的记录数
			$sql = "select id,name,credits,store_num,exchange_num,pic_name from $this->tableName where name like '%$name%' order by id desc limit $Page->firstRow,$Page->listRows";
			
			$data = $this->query($sql);
			$show = $Page->show();
			
			$result['data'] = $data;
			$result['show'] = $show;	
			return $result;		
		}else{
			$sql = "select id,name,credits,store_num,exchange_num,pic_name from $this->tableName where name like '%$name%'";
			$data = $this->query($sql);
			$result['data'] = $data;
			return $result;
		}
	}
	
	public function deleteGoods($id){
		$sql = "delete from $this->tableName where id = '$id'";
		return $this->execute($sql);
	}
	
	public function getInfo($id){
	    $sql = "select id, name,credits, store_num, exchange_num, pic_name, details from $this->tableName where id = '$id'";
	    $result = $this->query($sql);
	    return empty($result) ? '' : $result[0];
	}
	
	public function updateGoods($id){
	    $name = I('post.name');
	    $credits = I('post.credits');
	    $store_num = I('post.store_num');
	    $exchange_num = I('post.exchange_num');
	    $details = I('post.content');
	    
	    $sql = "update $this->tableName set name='$name',credits='$credits',store_num='$store_num',exchange_num='$exchange_num',details='$details' where id='$id'";
	    return $this->execute($sql);
	}
	
	
	
	
}