<?php

namespace Home\Model;
use Utils\ConstantUtils;

class GiftCodeMgrModel extends DataMgrBaseModel{
    private $tableName = "gift_code";


    public function getCode($gameId,$uId){

        $result = array('state'=>false,'data'=>'该游戏的礼包已被领完');


        if($this->isGetCode($gameId,$uId)){

            $result['data'] = '该游戏您已领过礼包';
        }else{

            $codeInfo = $this->getGiftCode($gameId);
            if($codeInfo){
                $result = array('state'=>true,'data'=>'游戏礼包码：'.$codeInfo['code']);
                $this->updateCodeActive($codeInfo['id'],$uId);
            }
        }
        return $result;
    }

    private function isGetCode($gameId,$uId){
        $sql = "select id from $this->tableName where game_id ='$gameId' and user_id = $uId";
        $res = $this->query($sql);
        return empty($res) ? false : true;
    }

    private function getGiftCode($gameId){
        $active = ConstantUtils::$GIFT_CODE_ACTIVE;
        $sql = "select id,code from $this->tableName where game_id = '$gameId' and active = '$active' limit 1 ";
        $res = $this->query($sql);
        return empty($res) ? '' : $res[0];
    }

    private function updateCodeActive($id,$uId){
        $active = ConstantUtils::$GIFT_CODE_UNACTIVE;
        $sql = "update $this->tableName set active = '$active' ,user_id = '$uId' where id = '$id'";
        return $this->execute($sql);
    }



} 