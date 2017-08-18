<?php


namespace Admin\Model;

use Utils\ConstantUtils;

class ScAndroidOrderMgrModel extends ScOrderMgrModel{
    protected  $tableName = "sc_order_android";
    private $tableName2 = "android_operator";
    private $tableName3 = "sc_game_account_android";

    public function getList($title){
        $is_paid    = ConstantUtils::$IS_PAY['yes'];
        
        $sql = "select A.id from $this->tableName as A
        LEFT JOIN `sc_account_android` as C on A.sc_account_id = C.id
        where is_paid = '$is_paid' and (A.id like '%$title%' or C.details like '%$title%')";
   
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        $sql = "select A.id,A.id_no,A.pay_time,A.state,B.name,B.currency_name,C.details,C.price,C.discount from $this->tableName as A
                LEFT JOIN `game` as B on A.game_id = B.id 
                LEFT JOIN `sc_account_android` as C on A.sc_account_id = C.id
                where A.is_paid = '$is_paid' and (A.id like '%$title%' or C.details like '%$title%') order by A.id desc limit $Page->firstRow,$Page->listRows";
        
        $result = $this->query($sql);
        if(!empty($result)){
            foreach($result as $key=>$list){
                $result[$key]['state'] = ConstantUtils::$SCH_ORDER_STATE[$list['state']];
            }
        }
        
        $info['page'] = $Page->show();
        $info['list'] = empty($result) ? '':$result;
        return $info; 
    }
    
    public function getRow($id){
        $sql = "select game_id,sc_account_id,game_account_id,real_payment from $this->tableName where id = '$id'";
        $orderRes = $this->query($sql);
        
        $androidScMgr = new ScAndroidMgrModel();
        $AndroidScRes = $androidScMgr->getRow($orderRes[0]['sc_account_id']);  
        
        $info = $this->getGameAccountInfo($orderRes[0]['game_account_id']);
        
        $gameMgr = new GameMgrModel();
        $info['title']    = $AndroidScRes['details'];
        $info['price']    = $AndroidScRes['price'];
        $info['discount'] = $AndroidScRes['discount'];
        $info['operator'] = $this->getOperatorName($AndroidScRes['operator_id']);
        $info['game']     = $gameMgr->getGameName($orderRes[0]['game_id']);
        $info['payment'] = $orderRes[0]['real_payment'];
        
        return empty($info) ? '' : $info;
         
    }
    
    public function getOperatorName($id){
        $sql = "select name from $this->tableName2  where id = '$id'";
        $result = $this->query($sql);
        
        return empty($result) ? '' : $result[0]['name'];
    }
    
    public function getGameAccountInfo($id){
        $sql = "select account,password,qufu,role,contact_way from $this->tableName3 where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
        

} 