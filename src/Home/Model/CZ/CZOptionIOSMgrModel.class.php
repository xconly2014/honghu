<?php

namespace Home\Model\CZ;

use Home\Model\DataMgrBaseModel;
use Utils\ConstantUtils;

class CZOptionIOSMgrModel extends DataMgrBaseModel{
    private $tableName = 'cz_option_ios';

    public function getOptionText($id, $currencyName){
        $sql = "select currency from $this->tableName where id=".$id;
        $result = $this->query($sql);
        if(empty($result)){
            return "";
        }

        $row = $result[0];
        return $row['currency'].$currencyName;
    }

    //通过option_id 获取面额信息
    public function getOptionSingle($id){
    	$sql = "select price,detail from $this->tableName where id=".$id;
    	$result = $this->query($sql);
    	if(empty($result)){
    		return "";
    	}
    	$row = $result[0];
		return $row['price']."元=".$row['detail'];
    }
    
    public function getOption($gameId, $currencyName){
        $retValue = array();
        $rowUnit = array();

        $sql = "select id, priority, currency, price, detail, multiple from $this->tableName where hide=0 and game_id=".$gameId ." ORDER BY priority DESC , price DESC";
        $result = $this -> query($sql);

        foreach($result as $row)
        {
            $rowUnit['id'] = $row['id'];
            $rowUnit['text'] = $row['price']."元 = ".$row['detail'];
            $rowUnit['price'] = $row['price'];
            $rowUnit['multiple'] = $row['multiple'];

            $retValue[] = $rowUnit;
        }
        return $retValue;
    }

    public function getPrice($id){
    	$id = join(',',$id);
    	$bought_num = I('post.cz_number');
        $sql = "select price from $this->tableName where id in ($id)";
        $result = $this->query($sql);
        if(empty($result)){
        	return '';
        }
        
        foreach($result as $v){
            $discount = $this->getCZOptionDiscount($v['price'],$bought_num);  //获取折扣
        	$price += $v['price']*$discount;
        }
        return empty($price)? "":$price;
    }

    public function getCurrency($id){
        $sql = "select currency from $this->tableName where id=$id";
        $result = $this->query($sql);
        return empty($result)? "":$result[0]['currency'];
    }
    
    public function getCredits($id){
        $sql = "select id, price, multiple from $this->tableName where id='$id'";
        $result = $this->query($sql);
        $credits = 0;
        if(!empty($result) && $result[0]['id']){
            $row = $result[0];
            $price = intval($row['price']);
            $multiple = intval($row['multiple']);
            $credits = $price * $multiple;// * getDoubleCredits();
        }
        return $credits;
    }
    
    public function getCZOptionDiscount($price,$number){
        $discount = 1;
        $result ='';
        if(isTime()){
            $sql = "select discount from cz_option_ios_discount where option_price='$price' and number<='$number' order by number desc";
            $result = $this->query($sql);
        }
           
        if(!empty($result) && $result[0]['discount']){
            $discount = $result[0]['discount'];
        }

        return $discount;
    }
} 