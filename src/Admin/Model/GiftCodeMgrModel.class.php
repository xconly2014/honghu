<?php
namespace Admin\Model;


use Utils\ConstantUtils;

class GiftCodeMgrModel extends DataMgrBaseModel{
	private $tableName = 'gift_code';
	
	public function getList($name=''){
		$sql = "select A.id from $this->tableName as A
                LEFT JOIN game as G on A.game_id = G.id
                where G.name like '%$name%'";
		$res = $this->query($sql);
		$count = count($res);
		$Page = new \Think\Page($count,40);
		$sql= "select A.id,A.code,A.active,A.game_id,G.name from $this->tableName as A
               LEFT JOIN game as G on A.game_id = G.id
               where G.name like '%$name%' order by A.id desc limit $Page->firstRow,$Page->listRows";
		$data = $this->query($sql);
			
		$result['data'] = $data;
		$result['show'] =$Page->show();
		return $result;				
	}
	
	public function addDate(){
		$codes = trim(I('post.code'),' ');
        $arr_code = explode(' ',$codes);
        $game = I('game_id');
        $active = ConstantUtils::$GIFT_CODE_ACTIVE;
        $insertId = array();
        foreach($arr_code as $code){
            if($code){
                $insertId[] = $this->insert_code($game,$code,$active);
            }
        }
        return $insertId;

	}
    private function insert_code($game,$code,$active){
        $sql = "insert into $this->tableName (code,game_id,active) value ('$code','$game','$active')";
        return $this->insert($sql);
    }

	public function deleteCode($id){
		$sql = "delete from $this->tableName where id='$id'";
		return $this->execute($sql);
	}
	
}
