<?php

namespace Admin\Model;
use Utils\ConstantUtils;

use Admin\Controller\UserController;
class GroupBuyCzOrderMgrModel extends DataMgrBaseModel{
	private $tableName = " group_buy_cz_order";
	private $tableName2 = "group_buy_cz_ticket";
	

	public function getList($keyword = ""){
		$keywordIsNum = false;

		if(is_numeric($keyword)){
			$keywordIsNum = true;
		}
	    $sql = "select A.id from $this->tableName as A
	            LEFT JOIN group_buy_cz as B on A.group_buy_cz_id = B.id 
	            LEFT JOIN game as G on B.game_id = G.id 
	            where A.is_paid=1";
		if($keyword){
			if($keywordIsNum){
				$sql .=" and A.id='$keyword' or A.id_no='$keyword'";
			}
			else{
				$sql .=" and G.name like '%$keyword%'";
			}
		}

	    $res = $this->query($sql);
	    $count = count($res);
	    $Page = new \Think\Page($count,20);
		$limit = " order by A.id desc limit $Page->firstRow,$Page->listRows";

		$sql = "select A.id,A.real_payment,A.pay_way,A.customer_id,B.option_text,B.price,G.name from $this->tableName as A
	            LEFT JOIN group_buy_cz as B on A.group_buy_cz_id = B.id
	            LEFT JOIN game as G on B.game_id = G.id
	            where A.is_paid=1";
		if($keyword){
			if($keywordIsNum){
				$sql .=" and A.id='$keyword' or A.id_no='$keyword'";
			}
			else{
				$sql .=" and G.name like '%$keyword%'";
			}
		}
		$sql .=$limit;

	    $data =  $this->query($sql);
	    $show = $Page->show();
		
	    $userMgr = new UserMgrModel();
	    foreach($data as $key=>$list){
	        $data[$key]['username'] = $userMgr->getUserName($list['customer_id']);
	    }
	    $result['show'] = $show;
	    $result['data'] = $data;
	
	    return $result;
	}
	
	
	public function getRow($id){
	    $sql = "select id,group_buy_cz_id,real_payment,pay_way from $this->tableName where id = '$id'";
	    $orderRes = $this->query($sql);
	    
	    $groupBuyCzMgr = new GroupBuyCzMgrModel();
	    $groupBuyCzRes = $groupBuyCzMgr->getGroupBuyCzRow($orderRes[0]['group_buy_cz_id']);
	    
	    $result['code']  = $this->getTicket($orderRes[0]['id']);
	    
	    $gameMgr = new GameMgrModel();
	    $gameRes = $gameMgr->getInfo($groupBuyCzRes['game_id']);
	   
	    $result['game'] = $gameRes['name'];
	    $result['buy_num'] = $orderRes[0]['real_payment'];
	    $result['way'] = $orderRes[0]['pay_way'];
	    $result['option'] = $groupBuyCzRes['option_num'];
	    $result['title'] = $groupBuyCzRes['option_text'];
	    $result['price'] = $groupBuyCzRes['price'];
	    
	    return $result;

	}
	
	
	private function getTicket($oid){
	    $sql = "select value from $this->tableName2 where id = '$oid'";
	    $result  = $this->query($sql);
	    if(!empty($result)){
	        return explode(',', $result[0]['value']); 
	    }
	    return '';
	}


    public function getBuyNum($group_buy_cz_id){
        $sql = "select sum(real_payment) as buy_num from $this->tableName where group_buy_cz_id = '$group_buy_cz_id' and is_paid = ".ConstantUtils::$IS_PAY['yes'];
        $result = $this->query($sql);
        return empty($result[0]['buy_num']) ? 0 : $result[0]['buy_num'];
    }
} 