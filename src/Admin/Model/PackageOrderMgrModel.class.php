<?php
namespace Admin\Model;

use Utils\ConstantUtils;

class PackageOrderMgrModel extends DataMgrBaseModel{
    private $tableName = 'package_order';
    
    public function getList($title){
        $player     = ConstantUtils::$ORDER_TYPE_DEPOSIT_PLAYER;
        $trainer    = ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER;
        $is_paid    = ConstantUtils::$IS_PAY['yes'];
        $state      = ConstantUtils::$PACKAGE_SOLD_OUT;
        $active     = ConstantUtils::$PACKAGE_UNACTIVE;
        
        $sql = "select A.id from package_order as A 
                join (select parent_order_id from $this->tableName where type in ($player,$trainer) and is_paid = '$is_paid' ) as B on A.id = B.parent_order_id 
                join package as C on A.package_id = C.id 
                where C.state = '$state' and C.active = '$active' and title like '%$title%' group by A.id ";
        
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        $sql = "select A.id,C.title,C.platform,C.price,C.spend_day,D.name from $this->tableName as A 
                join (select id, parent_order_id from $this->tableName where type in ($player,$trainer) and is_paid = '$is_paid' ) as B on A.id = B.parent_order_id 
                join package as C on A.package_id = C.id 
                join game as D on C.game_id = D.id 
                where C.state = '$state' and C.active = '$active' and title like '%$title%' group by A.id limit $Page->firstRow,$Page->listRows";
        $result = $this->query($sql);
        
        $info['page'] = $Page->show();
        $info['list'] = empty($result) ? '':$result;;
        return $info;
        
    }
    
    public function getInfo($id){
        
        $sql = "select package_id,game_account_id,pay_time,pay_way from $this->tableName where id = '$id'";
        $orderRes = $this->query($sql);
        
        $packageMgr = new PackageMgrModel();
        $packageRes = $packageMgr->getPackageInfo($orderRes[0]['package_id']);
        
        $AccountRes = $this->getGameAccountInfo($orderRes[0]['game_account_id']);

        $gameMgr = new GameMgrModel();
        $packageInfo['game'] = $gameMgr->getGameName($packageRes['game_id']);
        $packageInfo['title'] = $packageRes['title'];
        $packageInfo['price'] = $packageRes['price'];
        $packageInfo['security'] = $packageRes['security_price'];
        $packageInfo['price'] = $packageRes['price'];
        $packageInfo['time'] = $packageRes['spend_day'];
        $packageInfo['contact'] = $packageRes['contact_way'];
        $packageInfo['qufu'] = $packageRes['qufu'];
        $packageInfo['pay_time'] = $orderRes[0]['pay_time'];
        $packageInfo['pay_way'] = $orderRes[0]['pay_way'];
        $packageInfo['state'] = ConstantUtils::$PACKAGE_STATE_TEXT[$packageRes['state']];
        $packageInfo['platform'] = ConstantUtils::$PLATFORM_STRING[$packageRes['platform']];
        if($packageRes['platform'] == ConstantUtils::$PLATFORM_ANDROID){
            $scAndroidMgr = new ScAndroidOrderMgrModel();
            $packageInfo['operator'] = $scAndroidMgr->getOperatorName($packageRes['operator_id']);
        }
        
        $result['packageInfo'] = $packageInfo;
        $result['accountInfo'] = $AccountRes;
        return $result;
    }
    
    private function getGameAccountInfo($id){
        $sql = "select account,password,qufu,role,role_details,role_result,contact_way,platform,operator_id from package_game_account where id = '$id'";
        $result = $this->query($sql);
        
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
    
    public function getOrderId($Pid,$type){
        $sql = "select id from $this->tableName where package_id = '$Pid' and type = '$type'";
        $result = $this->query($sql);
        return empty($result) ? '' :$result[0]['id'];
    }
    

} 