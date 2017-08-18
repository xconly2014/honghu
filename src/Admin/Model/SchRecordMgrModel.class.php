<?php
namespace Admin\Model;

class SchRecordMgrModel extends DataMgrBaseModel{
    private $tableName = 'sc_record_ios';
    
    public function getList($keywords){
        $sql = "select S.id from $this->tableName S,game G where S.game_id=G.id and
        (G.name like '%$keywords%' or S.account like '%$keywords%')";
        
        $res = $this->query($sql);
        $count = count($res);
        $Page = new \Think\Page($count,20);
        
        $sql = "select S.id,S.account,G.name from $this->tableName S,game G where S.game_id=G.id and
                (G.name like '%$keywords%' or S.account like '%$keywords%') order by id desc limit $Page->firstRow,$Page->listRows";
        $data = $this->query($sql);
        $show = $Page->show();
        
        $result['show'] = $show;
        $result['data'] = $data;
        return $result;
    }
    
    public function schDelete($id){
        
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
    
    public function schInsert(){
        
        $game_id = I('post.game_id');
        $account = I('post.account');
        
        $sql = "insert into $this->tableName (game_id,account) value ('$game_id','$account')";
        return  $this->execute($sql);
        
    }
}
