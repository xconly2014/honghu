<?php
namespace Admin\Model;
use Utils\ConstantUtils;
use Admin\Model\GameMgrModel;
use Admin\Model\RequirementOrderMgrModel;

class RequirementMgrModel extends DataMgrBaseModel{
	private $tableName = 'requirement';
	
	public function getRequirementList($title=''){
		$sql = "select id from $this->tableName where title like '%$title%'";
		$res = $this->query($sql);
		$count = count($res);
		$Page = new \Think\Page($count,8);//实例化分页类，传入总记录数和每页显示的记录数
		$sql = "select id,title,platform,game_id,price,spend_day,state from $this->tableName where title like '%$title%' order by id desc limit $Page->firstRow,$Page->listRows";
		
		$result = $this->query($sql);
		$show = $Page->show();//分页显示输出
		
		$retValue = $result;
		$game = new GameMgrModel();
		foreach($result as $k=>$v){
			$gameInfo = $game->getInfo($v['game_id']);
			$retValue[$k]['game_name'] = $gameInfo['name'];
		}
		$info['data'] = $retValue;
		$info['show'] = $show;
		return $info;		
	}
	
	public function getRequirementInfo($id){
		$sql = "select id,game_id,publisher_id,title,price,security_price,spend_day,created_date,modified_date,state,remarks,cz_provided,game_account_id from $this->tableName where id='$id'";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];
	}
	
	public function updateRequirement($id){
		$state = I('post.state');
		$result = I('post.result');
		$sql = "update $this->tableName set state='$state',result='$result' where id='$id'";
		return $this->execute($sql);
	}
	
	public function getInfo($id){
	    $itemRes = $this->getRequirementInfo($id);
	    $type = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
	    
	    $orderMgr = new RequirementOrderMgrModel();
	    $oid = $orderMgr->getOrderId($id,$type);
	    
	    $orderInfo = $orderMgr->getInfo($oid);
	    return $orderInfo;
	}
}