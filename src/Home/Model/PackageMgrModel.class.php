<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-21
 * Time: 上午11:32
 */

namespace Home\Model;
use Utils\ConstantUtils;
use Home\Model\CZ\AndroidOperatorModel;



class PackageMgrModel extends DataMgrBaseModel{
    private $tableName = 'package';

    public function insertPackage($gameId){
        $publisher_id = get_uid();
        $game_id = $gameId;
        $title = I('post.title');
        $system = I('post.platform');//游戏平台

        if($system[1] != ''){
            $platform = ConstantUtils::$PLATFORM_ALL;
        }elseif($system[0] == ConstantUtils::$PLATFORM_IOS){
            $platform = ConstantUtils::$PLATFORM_IOS;
        }elseif($system[0] == ConstantUtils::$PLATFORM_ANDROID){
            $platform = ConstantUtils::$PLATFORM_ANDROID;
        }

        /*($platform == ConstantUtils::$PLATFORM_IOS) ? $operator_id = 0 : $operator_id = intval(I("post.operator_id")); //客户端*/
        $qufu = I('post.qufu');
        $details = I('post.details');
        $spend_day = I('post.spend_day');
        $cz_provided = I('post.cz_provided');
        $remarks = I('post.remarks');
        $security_price = I('post.security_price');
        $price = I('post.price');
        $contact_way = I('post.contact_way');
        $created_date = date('Y-m-d H:i:s',time());
        $active = ConstantUtils::$PACKAGE_UNACTIVE;
        $state = ConstantUtils::$PACKAGE_UNPAID;

        $sql = "insert into $this->tableName (state, active, publisher_id,game_id,title,platform,operator_id,qufu,details,spend_day,cz_provided,remarks,security_price,price,contact_way,created_date)
         value ($state, $active, '$publisher_id','$game_id','$title','$platform','0','$qufu','$details','$spend_day','$cz_provided','$remarks','$security_price','$price','$contact_way','$created_date')";

        return $this->insert($sql);
    }

    public function getList($gameId='', $where=''){
        $retValue = array();
        $state = ConstantUtils::$PACKAGE_PASS;
        if (empty($gameId)) {
            $sql = "select id, game_id,title, platform, price from $this->tableName where state>=$state";
        }else{
            $sql = "select id, game_id,title, platform, price from $this->tableName where state>=$state and game_id= $gameId";
        }   
                
        if($where != ""){
            $sql = $sql." and ".$where;
        }
        $sql .= " order by id desc";
        
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
            $rowUnit['type'] = ConstantUtils::$GAME_GOOD_TYPE_STRING[ConstantUtils::$GAME_GOOD_TYPE_PACKAGE];
            $rowUnit['credits'] = $userObj->getUserCredit(ConstantUtils::$USER_IDENTIFY_SYSTEM);
            $rowUnit['href'] = U('Home/Package/buy', array('id'=>$row['id']));
            $retValue[] = $rowUnit;

            $rowUnit = array();
        }
        return $retValue;
    }

    public function getMyPackage(){
        $uid = get_uid();
        $sql = "select id, game_id,title, platform, state,publisher_id,receiver_id,result from $this->tableName where publisher_id =$uid or receiver_id=$uid";
        $game = new GameMgrModel();
        $result = $this->query($sql);
        $retValue = array();
        foreach($result as $row){
            $rowUnit['id'] = $row['id'];
            $rowUnit['title'] = $row['title'];
            $rowUnit['platform'] = ConstantUtils::$PLATFORM_STRING[$row['platform']];
            $rowUnit['state'] = ConstantUtils::$PACKAGE_STATE_TEXT[$row['state']];
            $rowUnit['game_name'] = $game->getGameName($row['game_id']);
            $rowUnit['comment'] = $row['result'];
            if($row['publisher_id'] == $uid){
                $rowUnit['role'] = ConstantUtils::$ROLE_TRAINER;
                $hrefInfo = $this->getPublisherHref($row['state'], $row['id']);
                $rowUnit['href'] = $hrefInfo['url'];
                $rowUnit['href_text'] = $hrefInfo['text'];
            }
            else if($row['receiver_id'] == $uid){
                $rowUnit['role'] = ConstantUtils::$ROLE_PLAYER;
                $hrefInfo = $this->getReceiverHref($row['state'], $row['id']);
                $rowUnit['href'] = $hrefInfo['url'];
                $rowUnit['href_text'] = $hrefInfo['text'];
            }

            $retValue[] = $rowUnit;
            $rowUnit = array();
        }

        return $retValue;
    }

    public function getPublisherHref($state, $pId){
        switch($state){
            case ConstantUtils::$PACKAGE_UNPAID:
                $packageOrderMgr = new PackageOrderModel();
                return $packageOrderMgr->getSellerOrderHref($pId);
            case ConstantUtils::$PACKAGE_UNCHECK:
                return array('url'=>"", 'text'=>"");//TODO:引入新页面，催促客服审核
            case ConstantUtils::$PACKAGE_UNPASS:
                return array('url'=>U('Home/Package/buy', array('id'=>$pId)), 'text'=>"修改");
                //return array('url'=>U('Home/Package/edit', array('id'=>$pId)), 'text'=>"修改");//TODO:引入修改页面
            case ConstantUtils::$PACKAGE_PASS:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$PACKAGE_SOLD_OUT:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
                //return array('url'=>U('Home/Package/sold_out_publisher', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$PACKAGE_TRAINING:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
                //return array('url'=>U('Home/Package/training_publisher', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$PACKAGE_FINISH:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
                //return array('url'=>U('Home/Package/finish_publisher', array('id'=> $pId)), 'text'=>"详情");
        }
    }

    public function getReceiverHref($state, $pId){
        switch($state){
            case ConstantUtils::$PACKAGE_SOLD_OUT:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
                //return array('url'=>U('Home/Package/sold_out_receiver', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$PACKAGE_TRAINING:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
                //return array('url'=>U('Home/Package/training_receiver', array('id'=> $pId)), 'text'=>"详情");
            case ConstantUtils::$PACKAGE_FINISH:
                return array('url'=>U('Home/Package/buy', array('id'=> $pId)), 'text'=>"详情");
                //return array('url'=>U('Home/Package/finish_receiver', array('id'=> $pId)), 'text'=>"详情");
        }
    }

    public function getPackageInfo($id){
        $sql = "select id,qufu,price,security_price,spend_day,publisher_id,platform,game_id,title,price,contact_way,details, state, active, cz_provided, operator_id  from $this->tableName where id=$id";
        $result = $this->query($sql);
        if(empty($result)){
        	return '';
        }
        $retValue = $result[0];
        
        $game = new GameMgrModel();
        $gameRes = $game->getInfo($retValue['game_id']);
        $retValue['pic'] = $gameRes['pic'];
        $retValue['name'] = $gameRes['name'];
        $retValue['platform'] = ConstantUtils::$PLATFORM_STRING[$retValue['platform']];

        if($retValue['cz_provided'] == 1){
            $retValue['cz_provided'] = '是';
        }
        if($retValue['cz_provided'] == 0){
            $retValue['cz_provided'] = '否';
        }
        /*$androidOperatorMgr = new AndroidOperatorModel();
        $retValue['operator_name'] = $androidOperatorMgr->getName($retValue['operator_id']);*/
        return $retValue;
    }

    public function getPackageSecurityPrice($id){
        $sql = "select security_price from $this->tableName where id=$id";
        $result = $this->query($sql);
        return empty($result)?'':$result[0]['security_price'];
    }

    public function getPackagePrice($id){
        $sql = "select price from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)?'':$result[0]['price'];
    }
    
    //获取搜索时的标题
    public function getTitle($gameId){
        $result = $this->getList($gameId);
        return empty($result) ? '' : $result;
    }

    public function processAfterPlayerPay($id, $tradeOrderId, $cashOrderId, $receiverId){
        $active = ConstantUtils::$PACKAGE_UNACTIVE;
        $state = ConstantUtils::$PACKAGE_SOLD_OUT;

        $sql = "update $this->tableName set active=$active, state=$state, receiver_id=$receiverId, trade_order=$tradeOrderId, cash_order_player=$cashOrderId where id=$id";
        $this->execute($sql);
    }

    public function processAfterTrainerPay($id, $cashOrderId){
        $state = ConstantUtils::$PACKAGE_UNCHECK;

        $sql = "update $this->tableName set state=$state, cash_order_trainer=$cashOrderId where id=$id";
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
} 