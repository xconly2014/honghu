<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-20
 * Time: 下午6:29
 */

namespace Home\Model\CZ;


use Home\Model\DataMgrBaseModel;
use Home\Model\GameMgrModel;
use Utils\ConstantUtils;

class CZOrderAndroidModel extends DataMgrBaseModel{
    private $tableName = 'cz_order_android';

    public function orderInsert($gameId, $price){
        $customer_id = get_uid();

        $account = new CZGameAccountAndroidModel();
        $game_account_id = $account->accountInsert();  //游戏账号id

        $option_id = $_POST['cz_option'];       //面额id
        $bought_num = $_POST['cz_number'];    //购买数量
        $created_date = date('Y-m-d H:i:s',time());
        $real_payment = $bought_num*$price;
        $state = ConstantUtils::$CZ_ORDER_STATE_INIT;

        $sql = "insert into $this->tableName
        (game_id,customer_id,game_account_id,option_id,bought_num,created_date,real_payment, is_paid, state, can_modify)
        value($gameId, $customer_id, '$game_account_id','$option_id','$bought_num','$created_date','$real_payment', 0, $state, 0)";
        return $this->insert($sql);
    }

    public function setPayInfo($payway, $callbackUrl, $id){
        $sql = "update $this->tableName set pay_way='$payway', callback_url='$callbackUrl' where id=".$id;
        $this->execute($sql);
        return $this->getPayInfo($id);
    }

    public function getPayInfo($id){
        $sql = "select real_payment, pay_way from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }
        return array(
            'way'=> $result[0]['pay_way'],
            'payment'=> $result[0]['real_payment']
        );
    }

    public function getInfo($id){
        if($id){
            $sql = "select id, bought_num, real_payment, pay_way,
                           game_id, option_id, game_account_id
                    from $this->tableName where id = '$id'";
            $data = $this->query($sql);

            $gaInfoObj = new CZGameAccountAndroidModel();
            $gaInfo = $gaInfoObj->getInfo($data[0]['game_account_id']);

            $game = new GameMgrModel();
            $gameInfo =$game->getInfo($data[0]['game_id']);

            $option = new CZOptionAndroidMgrModel();
            $optionInfo = $option->getOptionInfo($data[0]['option_id']);

            //组装数据
            $info['order_game_name'] = $gameInfo['name'];
            $info['order_cz_details'] = $optionInfo['currency'].$gameInfo['currency']."=".$optionInfo['price']."元";
            $info['order_price'] = $optionInfo['price'];
            $info['order_ga'] = $gaInfo['ga_account'];
            $info['order_ga_password'] = $gaInfo['ga_password'];
            $info['order_ga_qufu'] = $gaInfo['ga_qufu'];
            $info['order_ga_role'] = $gaInfo['ga_role'];
            $info['order_ga_contact_way'] = $gaInfo['ga_contactway'];
            $info['order_payway'] = $data[0]['pay_way'];
            $info['order_bought_num'] = $data[0]['bought_num'];
            $info['order_id'] = $data[0]['id'];
            $info['order_payment'] = $data[0]['real_payment'];
            return $info;
        }
    }

    public function checkOrderStatus($id){
        $sql = "select is_paid from $this->tableName where id=$id";
        $result = $this->query($sql);
        return $result[0]['is_paid'];
    }

    public function orderHandle($id){
        $modifyTime = date('Y-m-d H:i:s',time());
        $isPaid = 1;
        $state = ConstantUtils::$CZ_ORDER_STATE_IS_PAID;

        $sql = "update $this->tableName set modified_date='$modifyTime', is_paid=$isPaid, pay_time='$modifyTime', state='$state' where id=$id";
        $this->execute($sql);
    }

    public function getCallBackUrl($id){
        $sql = "select callback_url from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }

        return $result[0]['callback_url'];
    }




} 