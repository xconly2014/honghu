<?php
namespace Admin\Model;
use Utils\ConstantUtils;

class CollectPraiseMgrModel extends DataMgrBaseModel{
    private $tableName = 'collect_praise';

    
    public function getList($keyword = ""){
        $sql = "select id from $this->tableName where contact_way like '%$keyword%'";

        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,40);

        $sql = "select id,user_id,contact_way,type,active,created_date from $this->tableName where contact_way like '%$keyword%' order by id desc limit $Page->firstRow,$Page->listRows";

        $data = $this->query($sql);
        $userMgr = new UserMgrModel();
        $result = array();
        foreach($data as $key=>$list){
            $result[$key]['id'] = $list['id'];
            $result[$key]['username'] = $userMgr->getUserName($list['user_id']);
            $result[$key]['contact'] = $list['contact_way'];
            $result[$key]['type'] = ConstantUtils::$COLLECT_PRAISE_GIFT_TYPE[$list['type']];
            $result[$key]['active'] = ConstantUtils::$COLLECT_PRAISE_STATE[$list['active']];
            $result[$key]['time'] = $list['created_date'];
        }

        $resValue['data'] = $result;
        $resValue['show'] = $Page->show();
        return $resValue;

    }

    public function getRow($id){
        $sql = "select id,user_id,contact_way,type,active,created_date,pic,game_id from $this->tableName where id = '$id'";
        $row = $this->query($sql);

        $userMgr = new UserMgrModel();
        $gameMgr = new GameMgrModel();
        $res = array();

        $res['id'] = $row[0]['id'];
        $res['time'] = $row[0]['created_date'];
        $res['game_name'] = $gameMgr->getGameName($row[0]['game_id']);
        $res['username'] = $userMgr->getUserName($row[0]['user_id']);
        $res['contact'] = $row[0]['contact_way'];
        $res['type'] = ConstantUtils::$COLLECT_PRAISE_GIFT_TYPE[$row[0]['type']];
        $res['active'] = ConstantUtils::$COLLECT_PRAISE_STATE[$row[0]['active']];
        $res['img'] = $row[0]['pic'];

        return empty($res) ? '' : $res;
    }

    public function updateActive($id){
        $active = I('post.active');
        $sql = "update $this->tableName set active ='$active' where id = '$id'";
        return $this->execute($sql);
    }

}