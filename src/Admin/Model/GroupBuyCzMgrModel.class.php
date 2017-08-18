<?php

namespace Admin\Model;
use Utils\ConstantUtils;

class GroupBuyCzMgrModel extends DataMgrBaseModel{
	private $tableName = "group_buy_cz";
	private $tableName2 = 'game';
	
	
	
	public function getList($keyword = ""){
	     
	    $sql = "select A.id from $this->tableName A,$this->tableName2 G
	    where A.game_id = G.id and G.name like '%$keyword%'";
	     
	    $res = $this->query($sql);
	    $count = count($res);
	    $Page = new \Think\Page($count,20);
	     
	    $sql = "select A.id,A.option_text,A.active,A.price,A.dued_date,A.max_time,G.name,G.currency_name from $this->tableName A,$this->tableName2 G
	    where A.game_id = G.id and G.name like '%$keyword%' order by A.active asc limit $Page->firstRow,$Page->listRows";
	
	    $data =  $this->query($sql);

        $GroupBuyCzOrderMgr = new GroupBuyCzOrderMgrModel();
        foreach($data as $key=>$list){
            $data[$key]['buy_num'] =  $GroupBuyCzOrderMgr->getBuyNum($list['id']);
        }
	
	    $show = $Page->show();
	    $result['show'] = $show;
	    $result['data'] = $data;
	
	    return $result;
	}
	
	
	public function del(){
	    $id = $_GET['id'];
	    $sql = "delete from $this->tableName where id=$id";
	    return $this->execute($sql);
	}
	
	public function getGroupBuyCzRow($id){
	    $sql = "select game_id,option_num,option_text,price,max_time,dued_date,lucky_code,lucky_ticket_id from $this->tableName where id = '$id'";
	    $result  = $this->query($sql);
	    return empty($result) ? '' : $result[0];
	}
	
    public function insertData(){
	    $game_id = I('post.game_id');
	    $option_num = I('post.option');
	    $max_time = I('post.max');
	    $day = intval((I('post.day'))) * 24 * 3600;
	    $dued_date = date('Y-m-d H:i:s',time()+$day);
	    $price = I('post.price');
	    $state = ConstantUtils::$GROUP_BUY_STATE_SOLDING;
	    $active = ConstantUtils::$USUAL;
		$randTxt = time();
	    
	    $gameMgr = new GameMgrModel();
	    $gameInfo = $gameMgr->getInfo($game_id);
	    $option_text = $gameInfo['name'].$option_num.$gameInfo['currency'].'一元购';
	    
	    $sql = "insert into $this->tableName (game_id,option_num,max_time,dued_date,price,option_text,unit_num,state,active, rand_txt) values('$game_id','$option_num','$max_time','$dued_date','$price','$option_text','1','$state','$active', '$randTxt')";
	    
        return $this->insert($sql);
	}

	public function updateTicketIndex($id, $sepLineId){
		$sql = "update $this->tableName set sep_line=$sepLineId where id=$id";
		$this->execute($sql);
	}

    public function getDetails($id){
        $itemInfo = $this->getGroupBuyCzRow($id);
        $gameMgr = new GameMgrModel();
        $gameInfo = $gameMgr->getInfo($itemInfo['game_id']);
        $itemInfo['game'] = $gameInfo['name'];
        $itemInfo['currency'] = $gameInfo['currency'];
        $itemInfo['code'] = $itemInfo['lucky_code'] ? $itemInfo['lucky_code'] + ConstantUtils::$FIXED_NUMBER_CODE -1 : '未开奖';

        $sql = "select id,account,password,qufu,qufu_type,role,contact_way from group_buy_cz_lucker where item_id = '$id'";
        $confirmInfo = $this->query($sql);

        if($itemInfo['lucky_ticket_id']){
            $groupBuyTicket = new GroupBuyCzTicketModel();
            $luck = $groupBuyTicket->getRow($itemInfo['lucky_ticket_id']);
            $user = new UserMgrModel();
            $username = $user->getUserName($luck['user_id']);
        }

        $confirmInfo[0]['username'] = $username;

        $res['itemInfo'] = empty($itemInfo) ? '':$itemInfo;
        $res['luckerInfo'] = empty($confirmInfo) ? '':$confirmInfo[0];


        return $res;
    }
	
} 