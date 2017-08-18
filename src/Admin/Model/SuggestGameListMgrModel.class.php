<?php
namespace Admin\Model;

class SuggestGameListMgrModel extends DataMgrBaseModel{
    
    private $tableName = 'suggested_game_list';
    
    public function getList(){
        
        $sql = "select id,game_id from $this->tableName order by id desc";
        $result = $this->query($sql);
        $retValue = $result;
        
        $gameMgr = new GameMgrModel();
        foreach($result as $k=>$v){
            $retValue[$k]['game_name'] = $gameMgr->getGameName($v['game_id']);
        }
        
        return $retValue;
    }
    
    public function addItem(){
        $game_id = I('post.game_id');
        $sql = "insert into $this->tableName (game_id) value('$game_id')";
        return $this->execute($sql);
    }
    
    public function deleteItem($id){
        $sql = "delete from $this->tableName where id='$id'";
        return $this->execute($sql);
    }
}