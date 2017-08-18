<?php


namespace Home\Model;


use Utils\ConstantUtils;

class IOSCZPackageModel extends DataMgrBaseModel{
    private $tableName = "cz_package";

    private function parseParamsImp($param, $value){
        $condition = "";
        switch($param){
            case ConstantUtils::$LIST_PARAM_NAME:
                $condition = "option_text like '%$value%'";
                break;
            case ConstantUtils::$LIST_PARAM_ACTIVE:
                $condition = "active=$value";
                break;
        }
        return $condition;
    }

    private function filterParam(&$params){
        if(!$params[ConstantUtils::$LIST_PARAM_NAME]){
            unset($params[ConstantUtils::$LIST_PARAM_NAME]);
        }
    }

    private function parseParams($params){
        $index = 0;
        foreach($params as $paramKey=>$paramVal){
                $paramsArray[$index] = $this->parseParamsImp($paramKey, $paramVal);
                $index++;
        }//foreach
        return implode(" and ", $paramsArray);
    }

    public function getListLimit($limitNum, $extraParams){
        $sql = "select A.id,A.price,A.real_price,B.name,B.thumbnail_path,A.option_text,A.sum_number from $this->tableName AS A
    	    LEFT JOIN `game` AS B ON A.game_id = B.id";
        $limitCondition = " order by A.active desc,A.id desc limit ".$limitNum;
        $this->parseExtraParam($sql, $extraParams);
        return $this->getListImp(implode(" ", array($sql, $limitCondition)));
    }

    private function parseExtraParam(&$baseSql, $params){
        $paramsTxt = "";
        if(!empty($params)){
            $this->filterParam($params);
            $paramsTxt = $this->parseParams($params);
        }//if

        if($paramsTxt){
            $baseSql .= " where";
            $baseSql = implode(" ", array($baseSql, $paramsTxt));
        }//if
    }

    private function paraPager(&$countSQL, &$resultSQL, $extraParams){
        $this->parseExtraParam($countSQL, $extraParams);
        $this->parseExtraParam($resultSQL, $extraParams);
        $res = $this->query($countSQL);
        $count = count($res);
        $Page = new \Think\Page($count,15);//实例化分页类，传入总记录数和每页显示的记录数
        $show = $Page->show();//分页输出显示

        $resultSqlSuffix = "order by A.active desc,A.id desc limit $Page->firstRow,$Page->listRows";
        return array('show'=>$show, 'sql'=>implode(" ", array($resultSQL, $resultSqlSuffix)));
    }

    public function getListPager($extraParams){
        $countSQL = "select id from $this->tableName";
        $resultSQL = "select A.id,A.price,A.real_price,B.name,B.thumbnail_path,A.option_text,A.sum_number from $this->tableName AS A
    	    LEFT JOIN `game` AS B ON A.game_id = B.id";

        $pager = $this->paraPager($countSQL, $resultSQL, $extraParams);

        return array('show'=>$pager['show'], 'data'=>$this->getListImp($pager['sql']));
    }

    private function getListImp($sql){
        $result =  $this->query($sql);

        $retValue = $result;

        $czPackageOrder = new IOSCZPackageOrderModel();
        foreach($result as $k=>$v){
            $retValue[$k]['buy_number'] = $czPackageOrder->getSum($v['id']);
            if(!$retValue[$k]['buy_number']){
                $retValue[$k]['buy_number'] = 0;
            }
            $retValue[$k]['left_number'] = $retValue[$k]['sum_number']-$retValue[$k]['buy_number'];
            $retValue[$k]['precent'] = ($retValue[$k]['buy_number']/$retValue[$k]['sum_number']*100).'%';
            $retValue[$k]['url'] = U('Home/IOSCZPackage/buy',array('id'=>$retValue[$k]['id']));
        }
        return $retValue;
    }

    /**
     * 通过id获取数据
     */
    public function getRow($id){
        $sql ="select id,game_id,mini_number,sum_number,option_text,price,real_price,state,active from $this->tableName where id = '$id'";
        $info = $this->query($sql);

        $gameObj = new GameMgrModel();
        $gameInfo = $gameObj->getInfo($info[0]['game_id']);
        
        $data['is_tx'] = $gameInfo['tx_flag'];
        $data['game'] = $gameInfo['name'];
        $data['pic'] = $gameInfo['pic'];
        $data['id'] = $info[0]['id'];
        $data['game_id'] = $info[0]['game_id'];
        $data['mini'] = $info[0]['mini_number'];
        $data['sum'] = $info[0]['sum_number'];
        $data['option'] = $info[0]['option_text'];
        $data['price'] = $info[0]['price'];
        $data['real_price'] = $info[0]['real_price'];
        $data['state'] = $info[0]['state'];
        $data['active'] = $info[0]['active'];

        $orderObj = new IOSCZPackageOrderModel();
        $data['buyNum'] = $orderObj->getSum($id);
        $data['result'] = $data['sum'] - $data['buyNum'];
        $data['miniNum'] = min($data['result'],$data['mini']);
        $data['percentage'] = sprintf("%.1f", ($data['buyNum'] / $data['sum']) * 100);

        return $data;
    }


    /**
     * 通过id获取Price
     */
    public function getPrice($id){
        $sql = "select price from $this->tableName where id = '$id'";
        $data = $this->query($sql);
        return $data[0]['price'];
    }

    //获取搜索时的标题
    public function getTitle($gameId){
    
    	$sql = "select id,option_text from $this->tableName where game_id='$gameId'";
    	$result = $this->query($sql);
    	return empty($result)?'':$result;
    }

    public function changeActive($id, $active){
        $sql = "update $this->tableName set active=$active where id=$id";
        $this->execute($sql);
    }

    public function changeState($id, $state){
        $sql = "update $this->tableName set state=$state where id=$id";
        $this->execute($sql);
    }


    public function isNumAllow($resultNum, $buyNum){
        if($buyNum == 0 ||  $resultNum <= 0){
            return false;
        }elseif($resultNum < $buyNum){
            return false;
        }
        return true;
    }

} 