<?php
/**
 * 游戏代练需求表model
 * @author Administrator
 *
 */

namespace Home\Model;

use Utils\ConstantUtils;
use Home\Model\CZ\AndroidOperatorModel;
use Home\Model\RequirementOrderMgrModel;

class RequirementMgrModel extends DataMgrBaseModel{
	private $tableName = "requirement";

    public function getList($gameId='', $where=''){
        $retValue = array();
        $state = ConstantUtils::$REQUIREMENT_SOLDING;

        if (empty($gameId)) {
            $sql = "select id, game_id, title, platform, price from $this->tableName where state>=$state";
        }else{
            $sql = "select id, game_id, title, platform, price from $this->tableName where state>=$state and game_id= $gameId";
        }  
           
        if($where != ""){
            $sql = $sql." and ".$where;
        }
        $sql .=' order by id desc'; 
        
        $result = $this->query($sql);
        $userObj = new UserMgrModel();
        
        $game = new GameMgrModel();
        foreach($result as $row){
            $rowUnit['id'] = $row['id'];
            $rowUnit['game_id'] = $row['game_id'];
            $rowUnit['game_name'] = $game->getGameName($row['game_id']);
            $rowUnit['name'] = $row['title'];
            $rowUnit['platform'] = ConstantUtils::$PLATFORM_STRING[$row['platform']];
            $rowUnit['price'] = $row['price'];
            $rowUnit['type'] = ConstantUtils::$GAME_GOOD_TYPE_STRING[ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT];
            $rowUnit['credits'] = $userObj->getUserCredit(ConstantUtils::$USER_IDENTIFY_SYSTEM);
            $rowUnit['href'] = U('Home/Requirement/receive', array('id'=>$row['id']));
            $retValue[] = $rowUnit;

            $rowUnit = array();
        }
        return $retValue;
    }

    public function getMyRequirement(){
        $uid = get_uid();
        $sql = "select id, game_id,title, platform, state,publisher_id,receiver_id from $this->tableName where publisher_id =$uid or receiver_id=$uid";
        $game = new GameMgrModel();
        $result = $this->query($sql);
        $retValue = array();
        foreach($result as $row){
            $rowUnit['id'] = $row['id'];
            $rowUnit['title'] = $row['title'];
            $rowUnit['platform'] = ConstantUtils::$PLATFORM_STRING[$row['platform']];
            $rowUnit['state'] = $row['state'];
            $rowUnit['state_text'] = ConstantUtils::$REQUIREMENT_STATE_TEXT[$row['state']];

            
            $rowUnit['game_name'] = $game->getGameName($row['game_id']);
            if($row['publisher_id'] == $uid){
                $rowUnit['role'] = ConstantUtils::$ROLE_PLAYER;
                $hrefInfo = $this->getPublisherHref($row['state'], $row['id']);
                $rowUnit['href'] = $hrefInfo['url'];
                $rowUnit['href_text'] = $hrefInfo['text'];
            }else if($row['receiver_id'] == $uid){
                $rowUnit['role'] = ConstantUtils::$ROLE_TRAINER;
                $hrefInfo = $this->getReceiverHref($row['state'], $row['id']);
                $rowUnit['href'] = $hrefInfo['url'];
                $rowUnit['href_text'] = $hrefInfo['text'];
            }

            $retValue[] = $rowUnit;
            $rowUnit = array();
        }
        
        return $retValue;
    }

    public function getPublisherHref($state, $rid){
        switch($state){
            case ConstantUtils::$REQUIREMENT_INFO_UNCOMPLETED:
                return array('url'=>U('Home/Requirement/game_account', array('rid'=>$rid)),'text'=>"继续填写");
            case ConstantUtils::$REQUIREMENT_UNPAID:
                $reqOrderMgr = new RequirementOrderMgrModel();
                return $reqOrderMgr->getSellerOrderHref($rid);
            case ConstantUtils::$REQUIREMENT_SOLDING:
                return array('url'=>U('Home/Requirement/receive', array('id'=>$rid)), 'text'=>"查看");
            case ConstantUtils::$REQUIREMENT_SOLD_OUT:
                return array('url'=>U('Home/Requirement/receive', array('id'=>$rid)), 'text'=>"查看");
                //return array('url'=>U('Home/Requirement/sold_out_publisher', array('id'=>$rid)), 'text'=>"查看"); //TODO:引入新页面，代练师可点击“开始代练”
            case ConstantUtils::$REQUIREMENT_TRAINING:
                return array('url'=>U('Home/Requirement/receive', array('id'=>$rid)), 'text'=>"查看");
               //return array('url'=>U('Home/Requirement/training_publisher', array('id'=>$rid)), 'text'=>"查看"); TODO:引入新页面，代练师可点击“代练完成”，玩家可点击“催促玩家”
            case ConstantUtils::$REQUIREMENT_FINISH:
                return array('url'=>U('Home/Requirement/receive', array('id'=>$rid)), 'text'=>"查看");
              //return array('url'=>U('Home/Requirement/finish_publisher', array('id'=>$rid)), 'text'=>"查看");//TODO：引入新页面，玩家可“评价”
        }
    }

    public function getReceiverHref($state, $rId){
        
        switch($state){
            case ConstantUtils::$REQUIREMENT_SOLD_OUT:
                return array('url'=>U('Home/Requirement/receive', array('id'=> $rId)), 'text'=>"详情");
                //return array('url'=>U('Home/Requirement/sold_out_receiver', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$REQUIREMENT_TRAINING:
                return array('url'=>U('Home/Requirement/receive', array('id'=> $rId)), 'text'=>"详情");
               //return array('url'=>U('Home/Requirement/training_receiver', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$REQUIREMENT_FINISH:
                return array('url'=>U('Home/Requirement/receive', array('id'=> $rId)), 'text'=>"详情");
            //return array('url'=>U('Home/Requirement/finish_receiver', array('id'=> $pId)), 'text'=>"详情");
        }
    }
	
	/**
	 * 将数据添加到游戏代练需求表
	 * @param unknown $id
	 */
	public function addInfo($gameid){
		$accountObj = new RequirementAccountMgrModel();
		$aid = $accountObj->addItem();
		if($aid == "上传文件大小不符！"){
		    return $aid;
		}

        $platform = I('post.hu_platform');              //游戏平台
		$title = I('post.hu_title');					//标题数
		$spend_day = I('post.days');					//代练天数
		$remarks = I('post.hu_remarks');				//账号备注
		$game_id = $gameid;								//游戏id
		$cz_provided = I('post.hu_provided');			//是否支持充值
		$game_account_id = $aid;						//代练游戏账号信息表编号
		$publisher_id = get_uid();					    //玩家id
		$created_date = date("Y-m-d H:i:s",time());		//创建时间
        $active = ConstantUtils::$REQUIREMENT_UNACTIVE;
        $state = ConstantUtils::$REQUIREMENT_INFO_UNCOMPLETED;
		
		$sql = "insert into $this->tableName (state, active, title,platform,spend_day,remarks,game_id,cz_provided,game_account_id,publisher_id,created_date)
		values($state, $active, '$title','$platform', '$spend_day','$remarks','$game_id','$cz_provided','$game_account_id','$publisher_id','$created_date')";
		$rid= $this->insert($sql);
		return $rid;
	}
	
	
	
	/**
	 * 通过修改来完善数据的添加
	 * @param unknown $rid
	 * @return \Think\false
	 */
	public function updateInfo($rid){
		//用rid 查出 aid
		$aid = $this->getFieldById($rid,'game_account_id');

		
		//修改RequiremenGameAccount的数据
		$accountObj = new RequirementAccountMgrModel();
		$accountObj->updateInfo($aid);
		
		$price = I('post.hu_price');				//代练价格
		$security_price = I('post.hu_security');	//保证金
		$modified_date = date("Y-m-d H:i:s",time());//修改时间
        $state = ConstantUtils::$REQUIREMENT_UNPAID;
		$sql = "update $this->tableName set state=$state, price = '$price',security_price = '$security_price',modified_date = '$modified_date' where id = '$rid'";
		return $this->execute($sql);
	}
	
	/**
	 * 通过id获取字段
	 * @param unknown $id
	 */
	public function getFieldById($id,$field = '*'){
		$sql = "select ".$field." from $this->tableName where id = '$id'";
		$data = $this->query($sql);
		$in = strpos($field, ',');
		if($field == '*' ||  $in){
			return $data[0];
		}else{
			return $data[0]["$field"];
		}
	}

    public function getPrice($id){
        $sql = "select price from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)? '':$result[0]['price'];
    }

    public function getSecurityPrice($id){
        $sql = "select security_price from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)? '':$result[0]['security_price'];
    }

   
    public function getDataById($id){
        $sql = "select id,game_id, title,price,security_price,spend_day,game_account_id,active,state from $this->tableName where id = '$id'";
        $info = $this->query($sql);
        
        $accountObj = new RequirementAccountMgrModel();
        $accData = $accountObj->getFieldById($info[0]['game_account_id']);
        
        $path = './Public'.$accData['image_path'];
        $dir = @opendir($path);
        if($dir){
            $imgs = array();
            $picSuffix = array('gif','jpg' ,'png','jpeg');
            while (($file = readdir($dir)) !== false){
                list($filesname,$fileSuffix)=explode(".",$file);
                if(in_array($fileSuffix, $picSuffix)) {
                    if (!is_dir('./'.$file)) {
                        $imgs[] = $accData['image_path'].$file;
                    }
                }
            }
            closedir($dir);
        }
        
        $game = new GameMgrModel();
        $gameRes = $game->getInfo($info[0]['game_id']);

        $data['hu_game'] = $game->getGameName($info[0]['game_id']);
        $data['hu_title'] = $info[0]['title'];     
        $data['hu_price'] = $info[0]['price'];
        $data['hu_security'] = $info[0]['security_price'];
        $data['hu_days'] = $info[0]['spend_day'];
        $data['hu_qufu'] = $accData['qufu'];
        $data['hu_result'] = $accData['result'];
        $data['hu_pic'] = $gameRes['pic'];
        $data['hu_account'] = $accData['account'];
        $data['hu_role'] = $accData['role'];
        $data['hu_details'] = $accData['role_details'];
        $data['hu_system'] = ConstantUtils::$PLATFORM_STRING[$accData['platform']];
        $data['hu_active'] = $info[0]['active'];
        $data['hu_state'] = $info[0]['state'];
        $data['state_text'] = ConstantUtils::$REQUIREMENT_STATE_TEXT[$info[0]['state']];
        $data['img'] = $imgs;
        if($accData['platform'] == ConstantUtils::$PLATFORM_ANDROID){
            $operatorObj = new AndroidOperatorModel();
            $data['operator'] = $operatorObj->getName($accData['operator_id']);
            $data['system_img'] = 'android.png';
        }else{
            $data['system_img'] = 'ios.png';
        }
        
        return $data;
    }

    /**
     * 通过id获取数据
     * @param unknown $id
     * @return unknown
     */
    public function getInfo($id){
        $sql = "select title,price,security_price,spend_day,game_id ,game_account_id from $this->tableName where id = '$id'";
        $info = $this->query($sql);
        $data['title'] = $info[0]['title'];
        $data['money'] = $info[0]['price'];
        $data['game_id'] = $info[0]['game_id'];
        $data['security_money'] = $info[0]['security_price'];
        $data['days'] = $info[0]['spend_day'];
        $data['active'] = $info[0]['active'];
        $data['state'] = $info[0]['state'];
        $game = new GameMgrModel();
        $data['game_name'] = $game->getGameName($info[0]['game_id']);
        return $data;
    }

    //获取搜索时的标题
    public function getTitle($gameId){
        $result = $this->getList($gameId);
    	return empty($result)?'':$result;
    }

    public function changeActive($id, $active){
        $sql = "update $this->tableName set active=$active where id=$id";
        $this->execute($sql);
    }

    public function changeState($id, $state){
        $sql =  "update $this->tableName set state=$state where id=$id";
        $this->execute($sql);
    }

    public function setReceiver($id, $receiverId){
        $sql = "update $this->tableName set receiver_id=$receiverId where id=$id";
        $this->execute($sql);
    }

    public function processAfterPlayerPay($id, $cashOrderId){
        $active = ConstantUtils::$REQUIREMENT_ACTIVE;
        $state = ConstantUtils::$REQUIREMENT_SOLDING;
        $sql = "update $this->tableName set active=$active,state=$state,cash_order_player=$cashOrderId where id=$id";
        $this->execute($sql);
    }

    public function processAfterTrainerPay($id, $tradeOrderId, $cashOrderId, $receiverId){
        $active = ConstantUtils::$REQUIREMENT_UNACTIVE;
        $state = ConstantUtils::$REQUIREMENT_SOLD_OUT;

        $sql = "update $this->tableName set active=$active,state=$state,RECEIVER_ID=$receiverId, trade_order=$tradeOrderId, cash_order_trainer=$cashOrderId where id=$id";
        $this->execute($sql);
    }

    public function getCashOrder($id){
        $retValue = array(ConstantUtils::$CASH_ORDER_PLAYER=>"", ConstantUtils::$CASH_ORDER_TRAINER=>"");
        $sql = "select cash_order_trainer, cash_order_player from $this->tableName where id=$id";
        $result = $this->query($sql);
        if(!empty($result) && $result[0]['cash_order_trainer'] && $result[0]['cash_order_player']){
            $retValue[ConstantUtils::$CASH_ORDER_PLAYER] = $result[0]['cash_order_player'];
            $retValue[ConstantUtils::$CASH_ORDER_TRAINER] = $result[0]['cash_order_trainer'];
        }

        return $retValue;
    }

    public function isStateCorrect($id, $state){
        $stateTxt = "";
        switch($state){
            case ConstantUtils::$REQUIREMENT_STATE_MAP['receive']:
                $stateTxt = "state >=".ConstantUtils::$REQUIREMENT_SOLDING;
                break;
            case ConstantUtils::$REQUIREMENT_STATE_MAP['verify_requirement']:
                $stateTxt = "state =".ConstantUtils::$REQUIREMENT_SOLDING;
                break;
            default:
                break;
        }

        $sql = "select id from $this->tableName where id=$id and ".$stateTxt;
        return $this->query($sql);
    }
}
	