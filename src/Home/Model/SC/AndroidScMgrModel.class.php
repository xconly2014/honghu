<?php
namespace Home\Model\SC;

use Home\Model\DataMgrBaseModel;
use Home\Model\UserMgrModel;
use Home\Model\CZ\AndroidOperatorModel;
use Utils\ConstantUtils;
use Home\Model\GameMgrModel;

class AndroidScMgrModel extends DataMgrBaseModel{
	private $tableName = 'sc_account_android';
	private $gameTable = 'game';

	public function getAndroidOne($id){
		$sql = "select sc.*,g.name,g.currency_name
		from $this->tableName sc,$this->gameTable g
		where sc.game_id=g.id and sc.id=$id";
		$result = $this->query($sql);
		
		if(empty($result) || !is_array($result)){
		    return "";
		}
		$operatorObj = new AndroidOperatorModel();
		$result[0]['operator'] = $operatorObj->getName($result[0]['operator_id']);
		
		return $result[0];
	}

    public function getInfo($id){
        $sql = "select details,game_id, price, discount, amount, sell_amount,operator_id
        from $this->tableName where id=".$id;

        $result = $this->query($sql);
        if(empty($result) || !is_array($result)){
            return "";
        }
        
        $operatorObj = new AndroidOperatorModel();
        $operator = $operatorObj->getName($result[0]['operator_id']);
        
        $game = new GameMgrModel();
        $gameRes = $game->getInfo($result[0]['game_id']);
        return array('info'=>$result[0]['details'],
                     'price'=>$result[0]['price'],
                     'discount'=>$result[0]['discount'],
                     'amount'=>$result[0]['amount'],
                     'pic' =>$gameRes['pic'], 
                     'sell_amount'=>$result[0]['sell_amount'],
                     'operator'=>$operator,
                     'real_price'=>$result[0]['price']*$result[0]['discount']
        );

    }

    public function getAndroidScList($limit = 8){
        $sql = "select distinct(sc.game_id), sc.id,sc.details,sc.price,g.name
    	from $this->tableName sc,$this->gameTable g
    	where sc.is_on_sale=1 and sc.game_id = g.id group by g.id order by sc.id desc limit $limit";
        $result =  $this->query($sql);
        if(!empty($result)){
            foreach($result as $key=>$list){
                $result[$key]['url'] = U('Home/AndroidSc/addGameAccount',array('sc_id'=>$list['id']));
            }
            return 	$result;
        }
        return '';
    }
    

    public function getList($gameId, $where=""){
        $retValue = array();
        $sql = "select id, details,discount, price,operator_id,sell_amount from $this->tableName where game_id='$gameId' and is_on_sale=1 order by price asc";

        $result = $this->query($sql);

        $operatorObj = new AndroidOperatorModel();

        foreach($result as $row){
            $rowUnit['operator'] = $operatorObj->getName($row['operator_id']);
            $rowUnit['name'] = $row['details'];
            $rowUnit['price'] = $row['price'];
            $rowUnit['real_price'] = $row['price'] * $row['discount'];
            $rowUnit['sell_amount'] = $row['sell_amount'];
            $rowUnit['href'] = U('Home/AndroidSc/addGameAccount', array('sc_id'=>$row['id']));
            $retValue[] = $rowUnit;

            $rowUnit = array();
        }
        return $retValue;
    }
    

     public function getSCIosGameList(){
         $sql = "select distinct(sc.game_id),g.name,g.thumbnail_path from $this->tableName sc,$this->gameTable g
         where sc.game_id = g.id";
         
         $result =  $this->query($sql);
         return empty($result)?'':$result; 
     }
     
     //获取搜索时的标题
     public function getTitle($gameId){
     
         $sql = "select id,details,game_id from $this->tableName where game_id='$gameId' order by id desc";
         $result = $this->query($sql);
         return empty($result)?'':$result;
     }
     
     public function isExistByGameId($gameId){
        $result = $this->getTitle($gameId);
        return empty($result) ? '' : $result[0]['game_id']; 
     }
    
    
    
}