<?php


namespace Admin\Model;


use Utils\ConstantUtils;

class IOSCZPackageOrderMgrModel extends DataMgrBaseModel{
    protected  $tableName = "cz_package_order";
    private $tableName2 = "cz_package";
    private $tableName3 = "cz_package_game_account";

    public function getList($packageId){
        
        $sql = "select O.id from $this->tableName as O  
        left join cz_package as P on O.cz_package_id = P.id 
        where O.is_paid = ".ConstantUtils::$IS_PAY['yes']." and O.state > ".ConstantUtils::$CZ_PACKAGE_ORDER_STATE_INIT." and O.cz_package_id like '%$packageId%'";

        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        
        $sql = "select O.id,O.pay_way,O.bought_num,O.pay_time,O.state,P.option_text,P.price,G.name from $this->tableName as O 
        left join cz_package as P on O.cz_package_id = P.id 
        left join game as G on P.game_id = G.id
        where O.is_paid = ".ConstantUtils::$IS_PAY['yes']." and O.state > ".ConstantUtils::$CZ_PACKAGE_ORDER_STATE_INIT." and O.cz_package_id like '%$packageId%' order by O.id desc limit $Page->firstRow,$Page->listRows";
        
        $result = $this->query($sql);
        if(!empty($result)){
            foreach($result as $key=>$list){
                $result[$key]['state'] = ConstantUtils::$CZ_PACKAGE_ORDER_STATE[$list['state']];
            }
        }
        
        $info['page'] = $Page->show();
        $info['list'] = empty($result) ? '' : $result;
        return $info;
        
    }
    
    public function getInfo($id){
        $sql = "select cz_package_id,game_account_id,bought_num,pay_time,bought_num,real_payment from $this->tableName where id = '$id'";
        $orderRes = $this->query($sql);
        
        $packageRes = $this->getPackageInfo($orderRes[0]['cz_package_id']);
        
        $result = $this->getPackageGameAccountInfo($orderRes[0]['game_account_id']);
        
        $gameMgr = new GameMgrModel();
        $result['game'] = $gameMgr->getGameName($packageRes['game_id']);
        $result['option'] = $packageRes['option_text'];
        $result['price'] = $packageRes['price'];
        $result['sum_num'] = $packageRes['sum_number'];
        $result['buy_num'] = $orderRes[0]['bought_num'];
        $result['payment'] = $orderRes[0]['real_payment'];
        $result['pay_time'] = $orderRes[0]['pay_time'];
        
        return $result;
    }
    
    
    private function getPackageInfo($id){
        $sql = "select game_id,option_text,sum_number,price from $this->tableName2 where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
    
    private function getPackageGameAccountInfo($id){
        $sql = "select account,password,qufu,role,contact_way from $this->tableName3 where id = '$id'";
        $result  = $this->query($sql);
        return empty($result) ? '' : $result[0];
    }
    
    
    
    public function  updateState($oid,$state){
        $data = array('status'=>false,'stateText'=>'');
        $result = $this->changeOrderState($oid, $state);
        if($result){
            $stateText = ConstantUtils::$CZ_PACKAGE_ORDER_STATE[$state];
            $data = array('status'=>true,'stateText'=>$stateText);
        }
        return $data;
    }

} 