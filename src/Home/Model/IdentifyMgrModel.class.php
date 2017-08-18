<?php
namespace Home\Model;

class IdentifyMgrModel extends DataMgrBaseModel{
    private $tableName = 'identify_request';
    
    public function insertIdentify(){
        $true_name = I('post.true_name');
        $idc_no = I('post.idc_no');
        $photo_face = I('post.photo_face');
        $photo_back = I('post.photo_back');
        $photo_body = I('post.photo_body');
        $uid = get_uid();
        $created_date = date('Y-m-d H:i:s',time());
        
        $sql = "insert into $this->tableName (created_date, true_name,idc_no,photo_face,photo_back,photo_body,uid) value ('$created_date', '$true_name','$idc_no','$photo_face','$photo_back','$photo_body','$uid')";
        return $this->execute($sql);
    }
}