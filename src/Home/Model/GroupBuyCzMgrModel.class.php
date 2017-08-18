<?php
namespace Home\Model;
use Utils\ConstantUtils;


class GroupBuyCzMgrModel extends DataMgrBaseModel{
    private $tableName = 'group_buy_cz';
    
    public function getRow($id){
        $sql = "select id,lucky_ticket_id,option_num,unit_num,max_time,price,option_text,game_id, dued_date,active,release_time,lucky_code,state, sep_line from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        if(empty($result)){
            return '';
        }
        $retValue = $result[0];
        
        $game = new GameMgrModel();
        $gameInfo = $game->getInfo($retValue['game_id']);
        $retValue['pic'] = $gameInfo['pic'];
        $retValue['lucky_code'] = $retValue['lucky_code'] + ConstantUtils::$FIXED_NUMBER_CODE -1;
        
        return $retValue;
    }

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
        $sql = "select id,game_id,option_num,price,option_text from $this->tableName";
        $limitCondition = "order by active desc,id desc limit ".$limitNum;
        $this->parseExtraParam($sql, $extraParams);
        return $this->getListImp(implode(" ", array($sql, $limitCondition)));
    }

    private function parseExtraParam(&$baseSql, $params){
        $paramsTxt = "";
        if(!empty($params)){
            $this->filterParam($params);
            $paramsTxt = $this->parseParams($params);
        }

        if($paramsTxt){
            $baseSql .= " where";
            $baseSql = implode(" ", array($baseSql, $paramsTxt));
        }
    }

    private function paraPager(&$countSQL, &$resultSQL, $extraParams){
        $this->parseExtraParam($countSQL, $extraParams);
        $this->parseExtraParam($resultSQL, $extraParams);
        $res = $this->query($countSQL);
        $count = count($res);
        $Page = new \Think\Page($count,15);
        $show = $Page->show();

        $resultSqlSuffix = "order by active desc,id desc limit $Page->firstRow,$Page->listRows";
        return array('show'=>$show, 'sql'=>implode(" ", array($resultSQL, $resultSqlSuffix)));
    }

    public function getListPager($extraParams){
        $countSQL = "select id from $this->tableName";
        $resultSQL = "select id,game_id,option_num,price,option_text from $this->tableName";

        $pager = $this->paraPager($countSQL, $resultSQL, $extraParams);

        return array('show'=>$pager['show'], 'data'=>$this->getListImp($pager['sql']));
    }

    private function getListImp($sql){
        $result = $this->query($sql);
        $retValue = $result;
        $groupOrder = new GroupBuyCzOrderMgrModel();
        $game = new GameMgrModel();
        foreach($result as $k=>$v){
            $gameInfo = $game->getInfo($v['game_id']);
            $retValue[$k]['pic'] = $gameInfo['pic'];
            $retValue[$k]['buy_number'] = $groupOrder->getItemPaidNum($v['id']);
            if(!$retValue[$k]['buy_number']){
                $retValue[$k]['buy_number'] = 0;
            }

            $retValue[$k]['left_number'] = $retValue[$k]['price']-$retValue[$k]['buy_number'];
            $retValue[$k]['precent'] = ($retValue[$k]['buy_number']/$retValue[$k]['price']*100).'%';
            $retValue[$k]['game_name'] = $game->getGameName($v['game_id']);
        }
        return $retValue;
    }

    private function calLuckyCode($orderRecTimeSum, $id){
        $GroupBuyCzInfo = $this->getRow($id);
        $lucky_code = $orderRecTimeSum % $GroupBuyCzInfo['price'] + 1;
        return $lucky_code;
    }
    
    public function createLuckyCode($id, $payTime, $orderRecTimeSum){
        $luckTicketId = ConstantUtils::$ID_NONE;
        $lucky_code = "";

    	$lucky_code = $this->calLuckyCode($orderRecTimeSum, $id);

        if($lucky_code){
            $ticketMgr = new GroupBuyCzTicketMgrModel();
            $luckTicketId = $ticketMgr->getLuckyerTicketId($id, $lucky_code);
            $release_time = date('Y-m-d H:i:s',strtotime($payTime) + 10*60).'.'.end(explode('.',$payTime));
            $sql = "update $this->tableName set lucky_ticket_id=$luckTicketId, active = ".ConstantUtils::$FULL.",release_time = '$release_time',lucky_code = '$lucky_code' where id = '$id'";
            return $this->execute($sql);
        }
        
        return false;
    }

    public function getLuckCodeSingle($id){
        $sql = "select lucky_code from $this->tableName where id=$id";
        $result = $this->query($sql);
        return !empty($result) && $result[0]['lucky_code']? $result[0]['lucky_code']:"";
    }
    
    
    public function getLuckCodeInfo($luckyTicketItemId){
        $ticketMgr = new GroupBuyCzTicketMgrModel();
        $data = $ticketMgr->getLuckyInfo($luckyTicketItemId);

        $userMgr = new UserMgrModel();
        $userInfo = $userMgr->getUserInfo($data['user_id']);
        $result['name'] = $userInfo['short_name']; 
        $result['img_path'] = $userInfo['thumb_img'];
        
        $orderMgr = new GroupBuyCzOrderMgrModel();
        $orderInfo = $orderMgr->getFields($data['order_id']);
        $result['pay_time'] = $orderInfo['pay_time'];
        $result['times'] = $orderInfo['real_payment'];
        
        
        $result['codes'] = $data['code'];
        return  empty($result) ? '':$result;
  
    }
    
    public function updateState($id,$state){
        $sql = "update $this->tableName set state = '$state' where id = $id";
        return $this->execute($sql);
    }
    
    public function getMaxBoughtNum($paidNum,$userPaidNum,$id){
        $gbczRes = $this->getRow($id);
        $result['end'] = $gbczRes['price'] - $paidNum; //剩下的
        
        $allowMax = $gbczRes['max_time'] - $userPaidNum;
        
        $result['max'] = min($gbczRes['max_time'], $result['end'],$allowMax);
        
        $result['bgwidth'] = ($paidNum / $gbczRes['price']) * 100 .'%';
        return $result;
    }
   
    public function getLuckyList(){
        $state = ConstantUtils::$GROUP_BUY_STATE_FINISH;
        $sql = "select id, lucky_ticket_id from $this->tableName where state='$state'";
        $result = $this->query($sql);
        foreach($result as $v){
            $retValute[] = $this->getLuckCodeInfo($v['lucky_ticket_id']);
        }
        return $retValute;
    }

    public function getFakeList(){
        $sql = "select account, num from fake_list";
        $result = $this->query($sql);
        foreach($result as $index=>$rowValue){
            $format = formatIsEmailOrTel($rowValue['account']);
            switch($format){
                case ConstantUtils::$FORMAT_TEL:
                    $result[$index]['account'] = substr_replace($rowValue['account'],'****',3,4);
                    break;
                case ConstantUtils::$FORMAT_EMAIL:
                    $result[$index]['account'] = substr_replace($rowValue['account'], '****', 3, 3);
                    break;
            }
        }
        return $result;
    }

    public function hasLuckerAnnounced($id){
        $flag = false;
        $sql = "select state from $this->tableName where id=$id";
        $result = $this->query($sql);
        if(!empty($result) && $result[0]['state'] == ConstantUtils::$GROUP_BUY_STATE_FINISH){
            $flag = true;
        }
        return $flag;
    }
} 