<?php
namespace Home\Model\SC;

use Home\Model\DataMgrBaseModel;
use Home\Model\UserMgrModel;
use Utils\ConstantUtils;
use Home\Model\GameMgrModel;

class IOSScMgrModel extends DataMgrBaseModel{
	private $tableName = 'sc_account_ios';
	private $tableName2 = 'game';

	public function getIosOne($id){
		$sql = "select sc.*,g.name,g.currency_name
		from $this->tableName sc,$this->tableName2 g
		where sc.game_id=g.id and sc.id=$id";
		$result = $this->query($sql);
		return empty($result)?'':$result[0];
	}

    public function getInfo($id){
        $sql = "select game_id,details, price, discount, amount, sell_amount
        from $this->tableName where id=".$id;

        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }
        
        $game = new GameMgrModel();
        $gameRes = $game->getInfo($result[0]['game_id']);
        $result[0]['pic'] = $gameRes['pic'];

        return array('info'=>$result[0]['details'],
                     'price'=>$result[0]['price'],
                     'discount'=>$result[0]['discount'],
                     'amount'=>$result[0]['amount'],
                     'pic' => $result[0][pic],
                     'sell_amount'=>$result[0]['sell_amount'],
                     'real_price' =>$result[0]['price']*$result[0]['discount']);

    }
    
    public function getIOSScList($limit = 8){
    	$sql = "select distinct(sc.game_id), sc.id,sc.details,sc.price,g.name
    	from $this->tableName sc,$this->tableName2 g
    	where sc.is_on_sale=1 and sc.game_id = g.id GROUP BY g.id order by sc.id desc limit $limit";
    	$result =  $this->query($sql);
    	if(!empty($result)){
    	    foreach($result as $key=>$list){
    	        $result[$key]['url'] = U('IOSSc/addGameAccount',array('sc_id'=>$list['id']));
    	    }
    	    return 	$result;
    	}
    	return "";
    }
    

    public function getList($gameId, $where=""){
        $retValue = array();
        $sql = "select id, details, price, discount, sell_amount from $this->tableName where game_id='$gameId' and is_on_sale=1 order by price asc";
        if($where!= ""){
            $sql = $sql." and ".$where;
        }

        $result = $this->query($sql);

        foreach($result as $row){
            $rowUnit['name'] = $row['details'];
            $rowUnit['platform'] = ConstantUtils::$PLATFORM_IOS;
            $rowUnit['price'] = $row['price'];
            $rowUnit['real_price'] = $row['price'] * $row['discount'];
            $rowUnit['type'] = ConstantUtils::$GAME_GOOD_TYPE_STRING[ConstantUtils::$GAME_GOOD_TYPE_SC];
            $rowUnit['sell_amount'] = $row['sell_amount'];
            $rowUnit['href'] = U('Home/IOSSc/addGameAccount', array('sc_id'=>$row['id']));
            $retValue[] = $rowUnit;

            $rowUnit = array();
        }
        return $retValue;
    }
    
    //获取搜索时的标题
    public function getTitle($gameId){
    
    	$sql = "select id,details,game_id from $this->tableName where game_id = '$gameId' order by id desc";
    	$result = $this->query($sql);
    	return empty($result)?'':$result;
    }
    
    
    
     public function getSCIosGameList(){
         $sql = "select distinct(sc.game_id),g.name,g.thumbnail_path,g.ios_url from $this->tableName sc,$this->tableName2 g
         where sc.game_id = g.id";
         
         $result =  $this->query($sql);
         return empty($result)?'':$result; 
     }
     
     public function isExistByGameId($gameId){
         $result = $this->getTitle($gameId);
         return empty($result) ? '' : $result[0]['game_id'];  
     }
    
    
    
}