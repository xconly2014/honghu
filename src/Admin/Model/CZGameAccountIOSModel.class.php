<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-20
 * Time: 下午6:02
 */

namespace Admin\Model;


use Admin\Model\DataMgrBaseModel;
use Think\Log;

class CZGameAccountIOSModel extends DataMgrBaseModel{
    private $tableName = 'cz_game_account_ios';

    public function getInfo($id){
        $sql = "select * from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)? "":$result[0];
    }
} 