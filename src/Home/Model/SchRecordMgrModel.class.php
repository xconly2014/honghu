<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/9
 * Time: 16:03
 */

namespace Home\Model;


class SchRecordMgrModel extends OrderBaseModel {
    protected $tableName = 'sc_record_ios';

    public function isSCHAccount($gameId, $account){
        $sql = "select account from $this->tableName where game_id=$gameId and account='$account'";
        $result = $this->query($sql);
        return !empty($result) && is_array($result)? true:false;
    }
}