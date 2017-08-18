<?php
namespace Admin\Model;
use Utils\ConstantUtils;

class NmTicketMgrModel extends DataMgrBaseModel{
    private $tableName = 'nm_ticket';

    public function insertData(){
        $code = I('post.nm_code');
        $payment = I('post.money');
        $used = ConstantUtils::$UNUSED;
        $sql = "insert into $this->tableName (code,payment,is_used) value ('$code','$payment','$used')";
        return $this->execute($sql);

    }
    
    public function getList($keyword = ""){
        $sql = "select id from $this->tableName where code like '%$keyword%'";

        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,40);

        $sql = "select id,code,payment,is_used from $this->tableName where code like '%$keyword%' order by id desc limit $Page->firstRow,$Page->listRows";

        $data = $this->query($sql);
        foreach($data as $key=>$list){
            $data[$key]['is_used'] = ConstantUtils::$IS_USED[$list['is_used']];
        }

        $resValue['data'] = $data;
        $resValue['show'] = $Page->show();
        return $resValue;

    }

    public function delDate($id){
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
}