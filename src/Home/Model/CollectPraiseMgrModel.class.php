<?php
namespace Home\Model;
use Utils\ConstantUtils;
use Utils\FileUtils;


class CollectPraiseMgrModel extends DataMgrBaseModel{
    private $tableName = "collect_praise";

    public function addData($uid){
        $config = C('collect_praise_pic');
        $config['saveName'] = time()."_".$uid;
        $fileUtil = new FileUtils($config);
        $fileUtil->formatPicData();
        $picInfo = $fileUtil->upload();

        $result =array();

        if($picInfo['data'] ==''){
            $result['status'] = false;
            $result['msg'] = $picInfo['msg'];
            return $result;
        }

        $contact_way = I('post.contact');
        $created_date = date('Y-m-d H:i:s',time());
        $game_id = intval(I('post.game'));
        $type = I('post.type');
        $img = $picInfo['data'];
        $active = ConstantUtils::$COLLECT_PRAISE_STATE_INIT;

        $sql = "insert into $this->tableName (created_date,game_id,user_id,contact_way,pic,type,active)
                value('$created_date',$game_id,'$uid','$contact_way','$img','$type',0)";
        $insertId = $this->execute($sql);
        if($insertId){
            $result['status'] = true;
        }
        return $result;

    }

    public function collectActivity(){
        $activity_time = strtotime(ConstantUtils::$COLLECT_PRAISE_TIME);
        $now_time = time();
        $is_activity = false;
        if($now_time < $activity_time){
            $is_activity = true;
        }
        return $is_activity;
    }

}