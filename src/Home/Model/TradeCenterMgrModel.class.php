<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-20
 * Time: 下午5:15
 */

namespace Home\Model;

use Utils\ConstantUtils;
use Home\Model\SC\IOSScMgrModel;

class TradeCenterMgrModel extends DataMgrBaseModel{

    public function getGameGoods($mobile, $gameId, $where, $type=""){
        $goodList = array();
        $retGoods = array();

        $typeArray = array($type);
        if(empty($type)){
            if($mobile){
                $typeArray = array(
                    ConstantUtils::$GAME_GOOD_TYPE_PACKAGE,
                    ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT);
            }
            else{
                $typeArray = array(
                    ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT,
                    ConstantUtils::$GAME_GOOD_TYPE_PACKAGE,
                    ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT);
            }

        }

        foreach($typeArray as $t){
            $result = $this->getGameGoodImp($gameId, $where, $t);
            if(!empty($result) && is_array($result)){
                $retGoods = array_merge($goodList, $result);
                $goodList = $retGoods;
            }
        }
        $data['gameids'] = $this->getGameIds($retGoods);
        $data['list'] = $retGoods;
        return $data;
    }

    public function getGameGoodImp($gameId, $where, $type){
        $result = "";
        switch($type){
            case ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT:
                $result = $this->getAccount($gameId, $this->genWhereToCondition($type, $where));
                break;
            case ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT:
                $result = $this->getRequirement($gameId, $this->genWhereToCondition($type, $where));
                break;
            case ConstantUtils::$GAME_GOOD_TYPE_PACKAGE:
                $result = $this->getPackage($gameId, $this->genWhereToCondition($type, $where));
                break;
            default:
                break;
        }
        return $result;
    }

    private function genWhereToCondition($type, $where){
        $conds = "";
        if(!empty($where)){
            $condition = array();
            switch($type){
                case ConstantUtils::$GAME_GOOD_TYPE_SC:
                {
                    foreach($where as $field=>$con){
                        if($field == "platform")
                            continue;
                        $condition[] = $con;
                    }
                }
                    break;

                case ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT:
                case ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT:
                case ConstantUtils::$GAME_GOOD_TYPE_PACKAGE:
               {
                    foreach($where as $field=>$con){
                        $condition[] = $con;
                    }
               }
                   break;

               default:
                   break;
            }

            $conds = implode(' and ', $condition);
        }
        return $conds;
    }

    private function getAccount($gameId, $where){
        $AccountMgr = new AccountTradeMgrModel();
        return $AccountMgr->getList($gameId, $where);//未实现
    }

    private function getRequirement($gameId, $where){
        $reqObjMgr = new RequirementMgrModel();
        return $reqObjMgr->getList($gameId, $where);
    }

    private function getPackage($gameId, $where){
        $packObjMgr = new PackageMgrModel();
        return $packObjMgr->getList($gameId, $where);
    }
    
    
    private function getGameIds($arrayDate){
        $gameIds = array();
        $gameMgr = new GameMgrModel();
        foreach($arrayDate as $key=>$list){
            $gameIds[] = $list['game_id'];
        }
        return array_unique($gameIds);
    }
    
    public function getGameCondition($arrIds){
        $gameMgr = new GameMgrModel();
        $result = array();
        foreach($arrIds as $key=>$id){
            $result["gameId=".$id] = $gameMgr->getGameName($id);
        }
        return $result;
    }
} 