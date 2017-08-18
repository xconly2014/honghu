<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-13
 * Time: 下午4:48
 */

namespace Home\Model\CZ;


use Home\Model\DataMgrBaseModel;
use Home\Model\GameMgrModel;

class CZOptionAndroidMgrModel extends DataMgrBaseModel{
    private $table_name = "cz_option_android";

    /**
     * 获取指定游戏充值的客户端
     * @param unknown $gameid
     * @return \Think\mixed
     */
    public function getOperator($gameid){
        $sql = "select distinct operator_id from $this->table_name where `game_id` = '$gameid'";
        $operator_id = $this->query($sql);
        if($operator_id){
            $id = array();
            foreach ($operator_id as $op_id){
                $id[] = $op_id['operator_id'];
            }
            $id = implode(',', $id);
            $operator = new AndroidOperatorModel();
            $operatorname = $operator->getOperatorName($id);
            return $operatorname;
        }
    }

    /**
     * 通过客户端的id和游戏id来获取所属的面额
     * @return multitype:
     */
    public function getOption($operatorId, $gameId){
        $game = new GameMgrModel();
        $currency_name = $game->getCurrencyName($gameId);

        $sql = "select id,currency,price,detail from $this->table_name where operator_id = '$operatorId' and game_id = '$gameId'";
        $info = $this->query($sql);

        $num = count($info);
        $data =array();
        for($i = 0;$i < $num;$i++){
            $data[$i]['name'] = $info[$i]['currency'].$currency_name." = ".$info[$i]['price']."元".$info[$i]['detail'];
            $data[$i]['id'] = $info[$i]['id'];
        }
        return $data;
    }

    public function getOptionInfo($id){
        $sql = "select id, price, currency, detail from $this->table_name where id=".$id;
        $result = $this->query($sql);
        if(empty($result) && !is_array($result)){
            return "";
        }
        $row = $result[0];
        return array('id'=>$row['id'],
                     'price'=>$row['price'],
                     'detail'=>$row['detail'],
                     'currency' => $row['currency']);
    }

} 