<?php


namespace Admin\Model;


use Utils\ConstantUtils;

class CZOrderAndroidModel extends DataMgrBaseModel{
    private $tableName = "cz_order_android";

    public function getList($id){
        $sql = "select id, game_id, bought_num, details, pay_way, state, receiver from $this->tableName";
        if($id != ConstantUtils::$ID_NONE){
            $sql = $sql." where id=$id";
        }

        $result = $this->query($sql);

        $gameMgr = new GameMgrModel();
        $userMgr = new UserMgrModel();

        $rowList = array();
        $rowUnit = array();

        foreach($result as $row){
            $rowUnit['oid'] = $row['id'];
            $rowUnit['game'] = $gameMgr->getGameName($row['game_id']);
            $rowUnit['re_user'] = $userMgr->getUserName($row['receiver']);
            $rowUnit['number'] = $row['bought_num'];
            $rowUnit['option'] = $row['details'];
            $rowUnit['pay_way'] = $row['pay_way'];
            $rowUnit['state'] = ConstantUtils::$CZ_ORDER_STATE[$row['state']];
            $rowList[] = $rowUnit;
        }
        return $rowList;
    }

} 