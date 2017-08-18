<?php
namespace Home\Model;

class MbTradeGameMgrModel extends DataMgrBaseModel{
    private $tableName = 'mb_trade_game';
    
    public function getMbSearchSuggest($name=''){
        
       $sql = "select A.id,A.game_id,TRIM(G.name) as name,G.thumbnail_path from $this->tableName as A
       LEFT JOIN game as G on A.game_id = G.id order by id desc limit 12 ";

       if($name){
           $sql = "select id as game_id,thumbnail_path,TRIM(name) as name from game
           where `name` like '%$name%' order by id desc";
       }
       
       $data = $this->query($sql);
       
       $result = array('status'=>false,'data'=>null);
       if($data){
           $result = array('status'=>true,'data'=>$data);
       }
       return $result;
    }
    
}