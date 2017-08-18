<?php

namespace Home\Model;

use Utils\ConstantUtils;
use Home\Model\CZ\AndroidOperatorModel;
class AccountTradeMgrModel extends DataMgrBaseModel{
	private $tableName = "account_trade";
	
	public function addData($id){
		$tradeAccountMgr = new AccountTradeGameAccountMgrModel;
		$taInfo = $tradeAccountMgr->getRow($id);
        $game_id = $taInfo['game_id'];
        $platform = $taInfo['platform'];
		
		$title = I('post.title');
		$price = intval(I('post.jiaqian'));
		$security_money = floor($price * 0.2);
		$created_date = date('Y-m-d H:i:s',time());
		$limit_hours = intval(I('post.time')) * 24;
		$details = I('post.details');
		$game_account_id = $id;
		$seller_user_id = get_uid();
        $state = ConstantUtils::$ACCOUT_TRADE_UNPAID;
		
		formatPicData();
		$maxid = $this->getMaxId();
		$num = $maxid + 1;
		$path = ConstantUtils::$UPLOAD_PATH_ACCOUNT_TRADE;
		
		$imgInfo = uploads($num,$path);
		if($imgInfo == "没有文件被上传！"){
			return '没有文件被上传';
			
		}elseif($imgInfo == '上传文件大小不符！'){
		    return '上传文件大小不符';
		}else{
			$image_path = $imgInfo;
		}
		
		$sql = "insert into $this->tableName (state,game_id,platform,title,price,security_money,created_date,limit_hours,image_path,details,game_account_id,active,seller_user_id)
		value('$state','$game_id',$platform,'$title','$price','$security_money','$created_date','$limit_hours','$image_path','$details','$game_account_id',0,'$seller_user_id')";
		
		return $this->insert($sql);
 	}
 	
 	
	private function getMaxId(){
		$sql = "select id from $this->tableName order by id desc limit 1";
		$data = $this->query($sql);
		return intval($data[0]['id']);
	}
	
	public function getSecurityMoney($id){
		$sql = "select security_money from $this->tableName where id=".$id;
		$result = $this->query($sql);
		return !empty($result) && is_array($result)? $result[0]['security_money']:0;
	}
	
	public function getPrice($id){
	    $sql = "select price from $this->tableName where id=".$id;
	    $result = $this->query($sql);
	    return !empty($result) && is_array($result)? $result[0]['price']:0;
	}
	
	public function getRow($id){
        $sql = "select game_id,price,security_money,details,image_path,title,game_account_id,active,state from $this->tableName where id = '$id'";
        $tradeData = $this->query($sql);

        $tradeAccountMgr = new AccountTradeGameAccountMgrModel;
        $accountData = $tradeAccountMgr->getRow($tradeData[0]['game_account_id']);

        $path = './Public'.$tradeData[0]['image_path'];
        $dir = @opendir($path);
        if($dir){
            $imgs = array();
            $picSuffix = array('gif','jpg' ,'png','jpeg');
            //过滤文件，拼接图片的路径
            while (($file = readdir($dir)) !== false){
                list($filesname,$fileSuffix)=explode(".",$file);
                if(in_array($fileSuffix, $picSuffix)) {
                    if (!is_dir('./'.$file)) {
                        $imgs[] = $tradeData[0]['image_path'].$file;
                    }
                }
            }
            closedir($dir);
        }

        $game = new GameMgrModel();
        $gameInfo = $game->getInfo($tradeData[0]['game_id']);
        $data['game_name'] = $gameInfo['name'];
        $data['game_pic'] = $gameInfo['pic'];
        $data['price'] = $tradeData[0]['price'];
        $data['title'] = $tradeData[0]['title'];
        $data['security_money'] = $tradeData[0]['security_money'];
        $data['qufu'] = $accountData['qufu'];
        $data['system'] = ConstantUtils::$PLATFORM_STRING[$accountData['platform']];
        $data['juese'] = $accountData['role'];
        $data['zhiye'] = $accountData['occupation'];
        $data['remark'] = $accountData['comment'];
        $data['level'] = $accountData['level'];
        $data['details'] = $tradeData[0]['details'];
        $data['state'] = $tradeData[0]['state'];
        $data['active'] = $tradeData[0]['active'];
        $data['img'] = $imgs;
        if($accountData['platform'] == ConstantUtils::$PLATFORM_ANDROID){
            $operatorObj = new AndroidOperatorModel();
            $data['operator'] = $operatorObj->getName($accountData['operator_id']);
            $data['system_img'] = 'android.png';
        }else{
            $data['system_img'] = 'ios.png';
        }

        return $data;
	}
	
	
	public function getGameId($id){
	    $sql = "select game_id from $this->tableName where id = '$id'";
	    $result = $this->query($sql);
	    return !empty($result) && is_array($result)? $result[0]['game_id']:0;
	}

    public function processAfterSellerPay($id, $cashOrderId){
        $active = ConstantUtils::$ACTIVE;
        $state = ConstantUtils::$ACCOUNT_TRADE_SOLDING;
        $sql = "update $this->tableName set active=$active, state=$state, cash_order_seller=$cashOrderId where id=$id";
        $this->execute($sql);
    }

    public function processAfterBuyerPay($id, $cashOrderId, $tradeOrderId, $buyerId){
        $active = ConstantUtils::$UNACTIVE;
        $state = ConstantUtils::$ACCOUNT_TRADE_SOLD_OUT;

        $sql = "update $this->tableName set active=$active, state=$state, buyer_user_id=$buyerId, cash_order_buyer=$cashOrderId, trade_order=$tradeOrderId where id=$id";
        $this->execute($sql);
    }

    public function getCashOrder($id){
        $retValue = array(ConstantUtils::$CASH_ORDER_SELLER=>"", ConstantUtils::$CASH_ORDER_BUYER=>"");
        $sql = "select cash_order_seller, cash_order_buyer from $this->tableName where id=$id";
        $result = $this->query($sql);
        if(!empty($result) && $result[0]['cash_order_seller'] && $result[0]['cash_order_buyer']){
            $retValue[ConstantUtils::$CASH_ORDER_SELLER] = $result[0]['cash_order_seller'];
            $retValue[ConstantUtils::$CASH_ORDER_BUYER] = $result[0]['cash_order_buyer'];
        }
        return $retValue;
    }

    public function getList($gameId='', $where){
        $retValue = array();
        $active = ConstantUtils::$ACCOUNT_TRADE_ACTIVE;
        $state = ConstantUtils::$ACCOUNT_TRADE_SOLDING;
        
        if (empty($gameId)) {
            $sql = "select id, game_id, title, platform, price from $this->tableName where active= $active and state = $state ";
        }else{
            $sql = "select id, game_id, title, platform, price from $this->tableName where active= $active and state = $state and game_id= $gameId";
        }
        
        if($where != ""){
            $sql = $sql." and ".$where;
        }
        $sql .= ' order by id desc';
        
        $result = $this->query($sql);

        $userObj = new UserMgrModel();
        $game = new GameMgrModel();
        
        foreach($result as $row){
            $gameRes = $game->getInfo($row['game_id']);
            $rowUnit['game_name'] = $gameRes['name'];
            $rowUnit['pic'] = $gameRes['pic'];
            $rowUnit['id'] = $row['id'];
            $rowUnit['game_id'] = $row['game_id'];
            $rowUnit['name'] = $row['title'];
            $rowUnit['platform'] = ConstantUtils::$PLATFORM_STRING[$row['platform']];
            $rowUnit['price'] = $row['price'];
            $rowUnit['type'] = ConstantUtils::$GAME_GOOD_TYPE_STRING[ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT];
            $rowUnit['credits'] = $userObj->getUserCredit(ConstantUtils::$USER_IDENTIFY_SYSTEM);
            $rowUnit['href'] = U('Home/AccountTrade/buy', array('id'=>$row['id']));
            $retValue[] = $rowUnit;

            $rowUnit = array();
        }

        return $retValue;

    }

    public function getMyAccount(){
        $uid = get_uid();

        $sql = "select id, title, game_id, platform, created_date, state, seller_user_id, buyer_user_id from $this->tableName as A
    	where seller_user_id='$uid' or buyer_user_id = '$uid'";
        $gameMgr = new GameMgrModel();
        $result = $this->query($sql);
        $retValue = array();
        foreach($result as $row){
            $rowUnit['id'] = $row['id'];
            $rowUnit['title'] = $row['title'];
            $rowUnit['platform'] = ConstantUtils::$PLATFORM_STRING[$row['platform']];
            $rowUnit['state'] = ConstantUtils::$ACCOUNT_TRADE_STATE_TEXT[$row['state']];
            $hrefInfo = $this->getHrefByState($row['state'], $row['id']);
            $rowUnit['href'] = $hrefInfo['url'];
            $rowUnit['href_text'] = $hrefInfo['text'];
            $rowUnit['game_name'] = $gameMgr->getGameName($row['game_id']);
            if($row['seller_user_id']){
                $rowUnit['role'] = ConstantUtils::$ROLE_SELLER;
            }
            else if($row['buyer_user_id']){
                $rowUnit['role'] = ConstantUtils::$ROLE_BUYER;
            }

            $retValue[] = $rowUnit;
            $rowUnit = array();
        }

        return $retValue;
    }
    
    public function getRecommendGoods($id){
        $game_id = $this->getGameId($id);
        $result = $this->getList($game_id);
        return empty($result) ? '' : $result;
    }

    private function getMyNotFullItem($gaId){
        $state = ConstantUtils::$ACCOUT_TRADE_UNPAID;
        $uid = get_uid();

        $sql = "select id from $this->tableName where game_account_id= '$gaId' and seller_user_id=$uid and state=$state";
        $result = $this->query($sql);

        return empty($result) ? '' : $result[0]['id'];
    }

    public function delNotFullItemIfNeed($gaId){
        $id = ConstantUtils::$ID_NONE;
        $id = $this->getMyNotFullItem($gaId);
        if($id){
            $sql = "delete from $this->tableName where id=$id";
            $this->execute($sql);
            return $id;
        }
    }

    private function getHrefByState($state, $itemId){
        $retHref = array('url'=>"", 'text'=>"");
        switch($state){
            case ConstantUtils::$ACCOUT_TRADE_UNPAID:
                $atoMgr = new AccountTradeOrderMgrModel();
                return $atoMgr->getSellerOrderHref($itemId);

            case ConstantUtils::$ACCOUNT_TRADE_SOLDING:
                $retHref['url'] = U('Home/AccountTrade/buy', array('id'=>$itemId));
                $retHref['text'] = "查看";
                break;

            case ConstantUtils::$ACCOUNT_TRADE_SOLD_OUT:
                $retHref['url'] = U('Home/AccountTrade/buy', array('id'=>$itemId));
                $retHref['text'] = "查看";
                break;

            case ConstantUtils::$ACCOUNT_TRADE_FINISH:
                $retHref['url'] = U('Home/AccountTrade/buy', array('id'=>$itemId));
                $retHref['text'] = "查看";
                break;
        }
        return $retHref;
    }
    
    public function getTitle($gameId){
        $result = $this->getList($gameId);
        return empty($result) ? '' : $result;
    }
    
    
} 