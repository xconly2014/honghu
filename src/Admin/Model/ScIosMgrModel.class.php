<?php
namespace Admin\Model;

class ScIosMgrModel extends DataMgrBaseModel{
	private $tableName = 'sc_account_ios';
	private $tableName2 = 'game';

	public function getList($keyword = ""){
	    
	    $sql = "select sc.id from $this->tableName sc,$this->tableName2 g
	    where sc.game_id = g.id and g.name like '%$keyword%'";
	    
	    $res = $this->query($sql);
	    $count = count($res);
	    $Page = new \Think\Page($count,20);
	    
		$sql = "select sc.*,g.name,g.currency_name from $this->tableName sc,$this->tableName2 g
		where sc.game_id=g.id and g.name like '%$keyword%' limit $Page->firstRow,$Page->listRows";

		$data =  $this->query($sql);
		
		$show = $Page->show();
		$result['show'] = $show;
		$result['data'] = $data;
		
		return $result;
	}
	
	public function getIosOne($id){
		$sql = "select sc.*,g.name,g.currency_name from $this->tableName sc,$this->tableName2 g where sc.game_id=g.id and sc.id=$id";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];
	}
	
	public function add(){
		$game_id = trim($_POST['game_id']);
		$details = trim($_POST['details']);
		$price = trim($_POST['price']);
		$discount = trim($_POST['discount']);
		$amount = trim($_POST['amount']);
		$sell_amount = trim($_POST['sell_amount']);
		$sql = "insert into $this->tableName (game_id,details,price,discount,amount,sell_amount)value('$game_id','$details','$price','$discount','$amount','$sell_amount')";
		return $this->execute($sql);
	}
	
	public function del(){
		$id = $_GET['id'];
		$sql = "delete from $this->tableName where id=$id";
		return $this->execute($sql);
	}
	
	public function info($id){
		$sql = "select SC.id, name, game_id,details, price, SC.discount, amount, sell_amount from $this->tableName SC join game on SC.game_id=game.id where SC.id=$id";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];	
	}
	
	public function update(){
		$id = $_GET['id'];
		$details = trim($_POST['details']);
		$price = trim($_POST['price']);
		$discount = trim($_POST['discount']);
		$amount = trim($_POST['amount']);
		$sell_amount = trim($_POST['sell_amount']);
		$sql = "update $this->tableName set details='$details',price='$price',discount='$discount',amount='$amount',sell_amount='$sell_amount' where id=$id";
		return $this->execute($sql);
	}
	
	public function getRow($id){
	    $sql = "select details,price,discount from $this->tableName where id = '$id'";
	    $result = $this->query($sql);
	    return empty($result) ? '' : $result[0];
	}
}