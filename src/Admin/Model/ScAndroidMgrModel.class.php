<?php
namespace Admin\Model;

class ScAndroidMgrModel extends DataMgrBaseModel{
	private $tableName = 'sc_account_android';
	private $tableName2 = 'game';
	private $tableName3 = 'android_operator';

	public function getList($keyword = ""){  
	    $sql = "select sc.id from $this->tableName sc,$this->tableName2 g
	    where sc.game_id=g.id and g.name like '%$keyword%'";
	    
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
	
	
	public function insert(){ 
		$game_id = trim($_POST['game_id']);
		$operator_id = trim($_POST['operator_id']);
		$details = trim($_POST['details']);
		$price = trim($_POST['price']);
		$discount = trim($_POST['discount']);
		$amount = trim($_POST['amount']);
		$sell_amount = trim($_POST['sell_amount']);
		$sql = "insert into $this->tableName (game_id,operator_id,details,price,discount,amount,sell_amount)value('$game_id','$operator_id','$details','$price','$discount','$amount','$sell_amount')";
		
		return $this->execute($sql);
	}
	
	public function delete(){
		$id = $_GET['id'];
		$sql = "delete from $this->tableName where id=$id";
		return $this->execute($sql);
	}
	
	public function info($id){
	    $sql = "select id, game_id, operator_id, details, price, discount, amount, sell_amount from $this->tableName where id='$id'";
	    $result = $this->query($sql);
        $retValue = $result[0];
        
        $scAndroidMgr = new ScAndroidOrderMgrModel();
        $retValue['operator_name'] = $scAndroidMgr->getOperatorName($retValue['operator_id']);
        
        $gameMgr = new GameMgrModel();
        $retValue['name'] = $gameMgr->getGameName($retValue['game_id']);
        
        return $retValue;
	}
	
	public function update($id){
	    $details = I('post.details');
	    $price = I('post.price');
	    $discount = I('post.discount');
	    $amount = I('post.amount');
	    $sell_amount = I('post.sell_amount');
	    $sql = "update $this->tableName set details='$details',price='$price',discount='$discount',amount='$amount',sell_amount='$sell_amount' where id='$id'";
	    return $this->execute($sql);
	}
	
	
	public function getOperator(){ 
	    $sql = "select id,name from $this->tableName3";
	    $result = $this->query($sql);

	    return empty($result) ? '' : $result;
	}
	
	public function getRow($id){
	    $sql = "select details,price,discount,operator_id from $this->tableName where id = '$id'";
	    $result = $this->query($sql);
	    return empty($result) ? '' : $result[0];
	}
		
}