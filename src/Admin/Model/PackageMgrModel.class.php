<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-21
 * Time: 下午12:08
 */

namespace Admin\Model;

use Utils\ConstantUtils;
use Home\Model\GameMgrModel;
use Admin\Model\PackageOrderMgrModel;


class PackageMgrModel extends DataMgrBaseModel{
    private $tableName = 'package';

    public function getPackage($title){

        $sql = "select id from $this->tableName where title like '%$title%'";
        $res = $this->query($sql);
        $count = count($res);

        $Page = new \Think\Page($count,8);// 实例化分页类 传入总记录数和每页显示的记录数
        $sql = "select id,title,platform,game_id,price,spend_day,state from $this->tableName where title like '%$title%' order by id desc limit $Page->firstRow,$Page->listRows";
        
        $result = $this->query($sql);
        $show = $Page->show();//分页显示输出
        
        $retValue = $result;
        $game = new GameMgrModel();
        foreach($result as $k=>$v){
        	$gameInfo = $game->getInfo($v['game_id']);
        	$retValue[$k]['game_name'] = $gameInfo['name'];
            $retValue[$k]['state'] = ConstantUtils::$PACKAGE_STATE_TEXT[$v['state']];
        }
        $info['data'] = $retValue;
        $info['show'] = $show;
        return $info;
    }

    public function getPackageInfo($id){
        $sql = "select id,game_id,publisher_id,title,price,security_price,spend_day,contact_way,details,created_date,modified_date,state,platform,operator_id,qufu from $this->tableName where id=$id";
        $result = $this->query($sql);
        return empty($result)?'':$result[0];
    }

    public function updatePackage($id){
        $state = I('post.state');
        $active = ($state == ConstantUtils::$PACKAGE_PASS? ConstantUtils::$PACKAGE_ACTIVE:ConstantUtils::$PACKAGE_UNACTIVE);

        $result = I('post.result');
        $sql = "update $this->tableName set state='$state',active=$active, result='$result' where id=$id";
        return $this->execute($sql);
    }
    
    public function getInfo($id){
        $itemRes = $this->getPackageInfo($id);
        $type = ConstantUtils::$ORDER_TYPE_DEPOSIT_TRAINER;
         
        $orderMgr = new PackageOrderMgrModel();
        $oid = $orderMgr->getOrderId($id,$type);
         
        $orderInfo = $orderMgr->getInfo($oid);
        return $orderInfo;
    }
    

} 