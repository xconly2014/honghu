<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-19
 * Time: 下午2:20
 */

namespace Admin\Model;


class CZOptionIOSMgrModel extends DataMgrBaseModel{
    private $tableName = 'cz_option_ios';

    public function getOptions($gameId){
        $sql = "select id, price, detail, priority, rate, hide from $this->tableName where game_id='$gameId' order by price";
        return $this->query($sql);
    }

    public function changeDisplay($id, $hide){
        $sql = "update $this->tableName set hide=$hide where id=$id";
        $this->execute($sql);
    }

    public function del($id){
        $sql = "delete from $this->tableName where id=$id";
        $this->execute($sql);
    }


} 