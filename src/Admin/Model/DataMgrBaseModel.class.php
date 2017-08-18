<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-15
 * Time: 下午3:55
 */

namespace Admin\Model;


use Think\Model;

class DataMgrBaseModel{
    

    protected function execute($sql) {
        $model = new Model();
        $result = $model->execute($sql);
        return $result;
    }

    protected function query($sql) {
        $model = new Model();
        $result = $model->query($sql);
        return $result;
    }

    protected function insert($sql){
        $model = new Model();
        $model->execute($sql);
        return $model->getLastInsID();
    }

    protected function getLastInsertId(){
        $model = new Model();
        return $model ->getLastInsID();
    }
    
    protected function changeOrderState($oid,$state){
       $sql = "update $this->tableName set state = '$state'where id = '$oid'";
       return $this->execute($sql);
    }

} 