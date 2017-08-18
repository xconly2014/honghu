<?php
namespace Admin\Model;

use Utils\ConstantUtils;

class IdentifyMgrModel extends DataMgrBaseModel{
    private $tableName = 'identify_request';
    
    public function getList($name){
        $sql = "select id from $this->tableName where true_name like '%$name%'";
        $res = $this->query($sql);
        $count = count($res);
        
        $Page = new \Think\Page($count,15);//实例化分页类，传入总记录数和每页显示的记录数
        $sql = "select id,uid,true_name,idc_no,state,created_date from $this->tableName where true_name like '%$name%' order by id desc limit $Page->firstRow,$Page->listRows";
        
        $data = $this->query($sql);
        foreach($data as $rowCount=>$row){
            $data[$rowCount]['state_text'] = ConstantUtils::$AUTH_STATE_TEXT[$row['state']];
        }
        $show = $Page->show();//分页输出显示
        
        $result['data'] = $data;
        $result['show'] = $show;
        return $result;       
    }
    
    public function getIdentifyInfo($id){
        $sql = "select id,uid,true_name,idc_no,photo_face,photo_back,photo_body,state,created_date from $this->tableName where id='$id'";
        $result = $this->query($sql);
        return empty($result)?'':$result[0];
    }
    
    public function updateIdentify($id){
        $state = I('post.state');
        $result = I('post.result');
        $sql = "update $this->tableName set state='$state',result='$result' where id='$id'";
        return $this->execute($sql);
    }
}