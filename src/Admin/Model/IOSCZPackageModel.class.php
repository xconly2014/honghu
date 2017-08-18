<?php
namespace Admin\Model;
use Utils\ConstantUtils;


class IOSCZPackageModel extends DataMgrBaseModel{
    private $tableName = "cz_package";

    /**
     * 将数据添加到游戏代练需求表
     * @param unknown $id
     */
    public function addData(){
        $game_id = I('post.game_id');
        
        $mini_number = I('post.mini');
        $sum_number = I('post.sum');
        $price = I('post.price');
        $option = I('post.option');
        $real_price = I('post.real_price');
        $state = ConstantUtils::$CZ_PACKAGE_STATE_INIT;
        $active = ConstantUtils::$CZ_PACKAGE_ACTIVE;
        
        $gameMgr = new GameMgrModel();
        $gameInfo = $gameMgr->getInfo($game_id);
        $option_text = $gameInfo['name'].$option;

        $sql = "insert into $this->tableName (game_id,mini_number,sum_number,price,option_text, real_price, state, active) values($game_id, '$mini_number','$sum_number','$price','$option_text', $real_price, $state, $active)";
        return $this->insert($sql);
    }

    public function getList(){
        $sql = "select A.id,A.price,B.name, A.mini_number, A.sum_number, A.option_text,C.buy_num from $this->tableName AS A
		LEFT JOIN `game` AS B ON A.game_id = B.id 
		LEFT JOIN (select sum(bought_num) as buy_num ,cz_package_id from cz_package_order where is_paid = ".ConstantUtils::$IS_PAY['yes']. " and state <> ".ConstantUtils::$CZ_ORDER_STATE_INIT." group by cz_package_id)  
        as C on A.id = C.cz_package_id order by A.id desc";
        $result = $this->query($sql);
        
        $retValue = $result;
        foreach($result as $k=>$v){
            $retValue[$k]['sum_percent'] = round($v['buy_num']/$v['sum_number']*100,1).'%';
        }
        
       return $retValue;
    } 
    
    public function deleteItem($packageId){
        $sql = "delete from $this->tableName where id = '$packageId'";
        return $this->execute($sql);
    }


} 