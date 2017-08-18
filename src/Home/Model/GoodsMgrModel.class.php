<?php
namespace Home\Model;


use Utils\ConstantUtils;
class GoodsMgrModel extends DataMgrBaseModel{
    private $tableName = 'goods';
    
    public function getGoodsList($limit = 8,$isPage = false){
        $sql = "select id,name,credits,store_num,exchange_num,pic_name from $this->tableName order by id desc limit ".$limit;
        
        $listArr = array();
        if($isPage){
            $sql = "select id from $this->tableName";
            $res = $this->query($sql);
            $count = count($res);
            $Page = new \Think\Page($count,$limit);
            $sql = "select id from $this->tableName order by id desc limit $Page->firstRow,$Page->listRows";
            $listArr['page'] = $Page->show();
        }
        
        $data  = $this->query($sql);

        foreach($data as $key=> $list){
            $listArr['data'][$key] = $this->getRow($list['id']);
        }
        
        return $listArr;
    }
    
    public function getRow($id){
        $result = "";
    	$sql = "select id,name,credits,store_num,exchange_num,pic_name, details from $this->tableName where id = '$id'";
    	$row = $this->query($sql);

        if(is_array($row) && !empty($row[0])){
            $result = $row[0];
            $result['order_credits'] = $row[0]['credits'];
            $result['remaining'] =  $row[0]['store_num'] - $row[0]['exchange_num'];
        }
    	
    	//$row = $this->processDataAfter($row[0]);
    	return $result;
    }
    
    public function updateNum($gid){
    	$sql = "update $this->tableName set exchange_num = exchange_num + 1 where id = '$gid'";
    	return $this->execute($sql);
    }
    
    
    private function processDataAfter(&$data){
        if(isActivityTime()){
                $data['discount_credits'] = intval($data['credits'] * ConstantUtils::$ACTIVITY_DISCOUNT);
                $data['order_credits'] = $data['discount_credits'];
        }
        return $data;  
    }

} 