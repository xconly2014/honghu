<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/9/25
 * Time: 20:37
 */

namespace Admin\Model;


class CoinsOrderModel extends DataMgrBaseModel
{
    private $tableName = "coins_order";

    public function getList($name=''){
        $sql = "select C.id from $this->tableName C,user U where C.is_paid=1 and U.id=C.customer_id";
        if($name){
            $sql .=" and (C.id_no='$name' or C.id='$name' or U.email like '%$name%' or U.tel like '%$name%')";
        }
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);

        $sql = "select C.id, C.modified_date, C.id_no, C.coins, C.pay_way, C.customer_id, U.email, U.tel from $this->tableName C,user U where C.is_paid=1 and U.id=C.customer_id";
        if($name){
            $sql .=" and (C.id_no='$name' or C.id='$name' or U.email like '%$name%' or U.tel like '%$name%')";
        }
        $sql .= " order by id desc limit $Page->firstRow,$Page->listRows";

        $data =  $this->query($sql);
        $show = $Page->show();
            
        $result['show'] = $show;
        $result['data'] = $data;
        return $result;
    }

    public function getInfo($id){
        $sql = "select id, pay_time, id_no, coins, pay_way from $this->tableName where id=$id";
        $result = $this->query($sql);
        return !empty($result)? $result[0]:"";

    }
}