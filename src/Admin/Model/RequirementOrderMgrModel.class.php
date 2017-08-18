<?php
namespace Admin\Model;

use Utils\ConstantUtils;
use Admin\Model\RequirementGameAccountMgrModel;


class RequirementOrderMgrModel extends DataMgrBaseModel{
    private $tableName = 'requirement_order';
    
    
    public function getList($title){
        $player     = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
        $trainer    = ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER;
        $is_paid    = ConstantUtils::$IS_PAY['yes'];
        $state      = ConstantUtils::$REQUIREMENT_SOLD_OUT;
        $active     = ConstantUtils::$REQUIREMENT_UNACTIVE;
        
        $sql = "select A.id from $this->tableName as A 
                join (select parent_order_id from $this->tableName where type in ($player,$trainer) and is_paid = '$is_paid' ) as B on A.id = B.parent_order_id 
                join requirement as C on A.requirement_id = C.id 
                where C.state = '$state' and C.active = '$active' and title like '%$title%' group by A.id";
        
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        $sql = "select A.id,C.title,C.platform,C.price,C.spend_day,D.name from $this->tableName as A 
                join (select id, parent_order_id from requirement_order where type in ($player,$trainer) and is_paid = '$is_paid' ) as B on A.id = B.parent_order_id 
                join requirement as C on A.requirement_id = C.id 
                join game as D on C.game_id = D.id 
                where C.state = '$state' and C.active = '$active' and title like '%$title%' group by A.id limit $Page->firstRow,$Page->listRows";
        $result = $this->query($sql);
        
        $info['page'] = $Page->show();
        $info['list'] = empty($result) ? '':$result;
        return $info;
        
    }
    
    public function getInfo($id){
        $sql = "select id,requirement_id,trainer_tel,pay_time,pay_way from $this->tableName where id = '$id'";
        $orderRes = $this->query($sql);
        
        $requirementMgr = new RequirementMgrModel();
        $requirementRes = $requirementMgr->getRequirementInfo($orderRes[0]['requirement_id']);
        
        $gameAccountMgr = new RequirementGameAccountMgrModel();
        $result  = $gameAccountMgr->getRequirementGameAccountInfo($requirementRes['game_account_id']);
        
        $gameMgr = new GameMgrModel();
        
        $result['id'] = $orderRes[0]['id'];
        $result['game'] = $gameMgr->getGameName($requirementRes['game_id']);
        $result['trainer_tel'] = $orderRes[0]['trainer_tel'];
        $result['title'] = $requirementRes['title'];
        $result['price'] = $requirementRes['price'];
        $result['security'] = $requirementRes['security_price'];
        $result['time'] = $requirementRes['spend_day'];
        $result['state'] = ConstantUtils::$REQUIREMENT_STATE_TEXT[$requirementRes['state']];
        $result['remarks'] = $requirementRes['remarks'];
        $result['provided'] = ConstantUtils::$IS_PROVIDED[$requirementRes['cz_provided']];
        $result['pay_time'] = $orderRes[0]['pay_time'];
        $result['pay_way'] = $orderRes[0]['pay_way'];
        
        return $result;
    }
    
    public function getOrderId($rid,$type){
        $sql = "select id from $this->tableName where requirement_id = '$rid' and type = '$type'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0]['id'];
    }

} 