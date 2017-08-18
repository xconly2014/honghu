<?php
namespace Admin\Model;

use Utils\ConstantUtils;


class AccountTradeOrderMgrModel extends DataMgrBaseModel{
    private $tableName = 'account_trade_order';
    private $tableName2 = 'account_trade_game_account';
    private $tableName3 = 'account_trade';
    
    
    public function getList($title){
        $player     = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
        $trainer    = ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER;
        $is_paid    = ConstantUtils::$IS_PAY['yes'];
        $active     = ConstantUtils::$REQUIREMENT_UNACTIVE;
        
        $sql = "select A.* from $this->tableName as A 
                join (select parent_order_id from $this->tableName where type in ($player,$trainer) and is_paid = '$is_paid' ) as B on A.id = B.parent_order_id 
                join account_trade as C on A.account_trade_id = C.id 
                where C.active = '$active' and title like '%$title%' group by A.id";
        
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        $sql = "select A.id,C.title,E.platform,C.price,D.name from $this->tableName as A 
                join (select id, parent_order_id from $this->tableName where type in ($player,$trainer) and is_paid = '$is_paid' ) as B on A.id = B.parent_order_id 
                join account_trade as C on A.account_trade_id = C.id
                join game as D on C.game_id = D.id 
                join account_trade_game_account as E on C.game_account_id = E.id 
                where C.active = '$active' and title like '%$title%' group by A.id limit $Page->firstRow,$Page->listRows";

        $result = $this->query($sql);
        
        $info['page'] = $Page->show();
        $info['list'] = empty($result) ? '':$result;
        
        return $info;
        
    }
    
    
    
    public function getInfo($id){
        $sql = "select game_id,	account_trade_id from $this->tableName where id = '$id'";
        $orderRes = $this->query($sql);
        
        $accountTradeRes = $this->getAccountTradeInfo($orderRes[0]['account_trade_id']);
        
        $result  = $this->getGameAccountInfo($accountTradeRes['game_account_id']);
        
        $gameMgr = new GameMgrModel();
        $result['game'] = $gameMgr->getGameName($orderRes[0]['game_id']);
        $result['title'] = $accountTradeRes['title'];
        $result['price'] = $accountTradeRes['price'];
        $result['security'] = $accountTradeRes['security_money'];
        $result['details'] = $accountTradeRes['details'];
        $result['time'] =  intval($accountTradeRes['limit_hours']) / 24;

        return $result;
        
        
    }
    
    
    private  function getAccountTradeInfo($id){
        $sql = "select title,price,security_money,game_account_id,details,limit_hours from $this->tableName3 where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0]; 
        
    }
    

    private function getGameAccountInfo($id){
        $sql = "select account,password,qufu,role,level,contact_way,platform,operator_id,occupation,comment from $this->tableName2 where id = '$id'";
        $result  = $this->query($sql);
        if(!empty($result)){
            $result[0]['platform'] = ConstantUtils::$PLATFORM_STRING[$result[0]['platform']];
            if($result[0]['operator_id']){
                $scAndroidMgr = new ScAndroidOrderMgrModel();
                $result[0]['operator'] = $scAndroidMgr->getOperatorName($result[0]['operator_id']);
            }
            return $result[0];
        }
        return '';
        
    }
    
   

} 