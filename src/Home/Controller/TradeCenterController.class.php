<?php
namespace Home\Controller;

use Home\Model\CZ\AndroidOperatorModel;
use Home\Model\GameMgrModel;
use Home\Model\TradeCenterMgrModel;
use Home\Model\AccountTradeGameAccountMgrModel;
use Home\Model\AccountTradeOrderMgrModel;
use Home\Model\AccountTradeMgrModel;
use Home\Model\SC\IOSScMgrModel;
use Utils\ConstantUtils;
use Home\Model\PackageMgrModel;
use Home\Model\RequirementMgrModel;
use Home\Model\UserMgrModel;
use Home\Model\MbTradeGameMgrModel;

class TradeCenterController extends  DetectorController{
    private function getSellTypes(){
        return array(ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT => ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT_STRING,
              ConstantUtils::$GAME_GOOD_TYPE_PACKAGE => ConstantUtils::$GAME_GOOD_TYPE_PACKAGE_STRING,
              ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT => ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT_STRING);
    }

    public function buy(){
        if(IS_POST){
            $gameId = I('post.form_name');
            $this->redirect('index', array('gameId'=>$gameId));
        }
        $type = I('get.type');
        $game = new GameMgrModel();
        $gameList = $game->getGameLetter26(ConstantUtils::$PLATFORM_BOTH);
        $this->assign('url',U('Home/TradeCenter/buy',array('type'=>$type)));
        $this->assign('game_list', $gameList);
        
        $suggest_list = $game->getSuggestGameList(28);
        $this->assign('suggest_list',$suggest_list);
        
        //获取代练套餐列表
        $package = new PackageMgrModel();
        $packageList = $package->getList();
        $this->assign('package_list',array_slice($packageList,0,4));
        
        //获取代练需求列表
        $requirement = new RequirementMgrModel();
        $requirementList = $requirement->getList();
        $this->assign('requirement_list',array_slice($requirementList,0,4));
        $this->assign('type',$type);
        $this->theme($this->theme)->display();
    }

    public function sell(){
        if(IS_POST){
            $gameId = I('post.form_name');
            $type = I('post.form_type');
            switch($type){
                case ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT:
                    $this->redirect('Home/AccountTrade/publish', array('gameId'=>$gameId));

                case ConstantUtils::$GAME_GOOD_TYPE_PACKAGE:
                    return $this->redirect('Home/Package/publish', array('gameId'=>$gameId));

                case ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT:
                    $this->redirect('Home/Requirement/publish', array('gameId'=>$gameId));

                default:
                    break;
            }
        }

        $gameMgr = new GameMgrModel();
        $gameList = $gameMgr->getGameLetter26(ConstantUtils::$PLATFORM_BOTH);
        $this->assign("game_list", $gameList);
        
        //获取游戏推荐列表
        $suggest_list = $gameMgr->getSuggestGameList(28);
        $this->assign('suggest_list',$suggest_list);
        
        //获取代练套餐列表
        $package = new PackageMgrModel();
        $packageList = $package->getList();
        $this->assign('package_list',array_slice($packageList,0,4));
        
        //获取代练需求列表
        $requirement = new RequirementMgrModel();
        $requirementList = $requirement->getList();
        $this->assign('requirement_list',array_slice($requirementList,0,4));
        
        $userMgr = new UserMgrModel();
        $this->assign('is_trainer',$userMgr->userIsTrainer(get_uid()));
        $this->assign('type', $this->getSellTypes());
        $this->display();
    }
    
    
    
    public function mb_sell(){
        if(IS_POST){
            $gameId = I('post.form_name');
            $type = I('post.form_type');
            switch($type){
                case ConstantUtils::$GAME_GOOD_TYPE_ACCOUNT:
                    $this->redirect('Home/AccountTrade/publish', array('gameId'=>$gameId));
        
                case ConstantUtils::$GAME_GOOD_TYPE_PACKAGE:
                    return $this->redirect('Home/Package/publish', array('gameId'=>$gameId));
        
                case ConstantUtils::$GAME_GOOD_TYPE_REQUIREMENT:
                    $this->redirect('Home/Requirement/publish', array('gameId'=>$gameId));
        
                default:
                    break;
            }
        }
        if(IS_GET){
            
            $userMgr = new UserMgrModel();
            $this->assign('is_trainer',$userMgr->userIsTrainer(get_uid()));
            $this->assign('type', $this->getSellTypes());
            
            $this->assign('title','选择游戏');
            $this->theme($this->theme)->display();
        }
    }
    
    public function ajax_get_mb_trade(){
        $trade = new MbTradeGameMgrModel();
        $result = $trade->getMbSearchSuggest(I('post.name'));
        $this->ajaxReturn($result);
    }

    public function index(){
    
        $getParams = I('get.');
        $searchCondition = $this->getSearchLine($getParams);
        $this->assign('search_line', $searchCondition);
    
    
        $typeFlag = array_key_exists('type', $getParams);
        $this->assign('type_flag', $typeFlag);
        $this->assign('type_url', $this->getUrl('type'));
        $this->assign('type_category', ConstantUtils::$PARAM_CATEGORY['type']);
    
        $type = ConstantUtils::$TYPE_MAP;
        $title = '游戏代练交易中心';
        if($this->theme == "mb"){
            $type = ConstantUtils::$TYPE_MAP_MOBILE;
    
            if($_GET['type'] == ConstantUtils::$SEARCH_BAR_ACCOUNT_TRADE){
                $this->assign('search_file',ConstantUtils::$SEARCH_BAR_ACCOUNT_TRADE);
                unset($searchCondition[0]);    //当前是手机端账号交易时，就删除“商品类型”的条件
                $this->assign('search_line', $searchCondition);
    
                $title = '游戏账号交易中心';
            }
        }
        $this->assign('type', $type);
        if(I('get.type')){
            $this->assign('type_href', ConstantUtils::$TYPE_HREF[I('get.type')]);
        }
    
        $this->assign('title',$title);
    
    
        $platformFlag = array_key_exists('platform', $getParams);
        $this->assign('platform_flag', $platformFlag);

        $this->assign('platform_url', $this->getUrl('platform'));
        $this->assign('platform_category', ConstantUtils::$PARAM_CATEGORY['platform']);
        $this->assign('platform', ConstantUtils::$PLATFORM_MAP);
    
        $priceFlag = array_key_exists('price', $getParams);
        $this->assign('price_flag', $priceFlag);
        $this->assign('price_url', $this->getUrl('price'));
        $this->assign('price_category', ConstantUtils::$PARAM_CATEGORY['price']);
        $this->assign('price', ConstantUtils::$PRICE_MAP);
    
        $where = $this->getWhereCondition($getParams);
        
        $tradeObj = new TradeCenterMgrModel();
        $result = $tradeObj->getGameGoods($this->theme, '', $where, I('get.type'));

        
        $gameSearch = $tradeObj->getGameCondition($result['gameids']);
        $gameFlag = array_key_exists('gameId', $getParams);
        
        $this->assign('game_flag', $gameFlag);
        $this->assign('game_url', $this->getUrl('gameId'));
        $this->assign('game_category', ConstantUtils::$PARAM_CATEGORY['gameId']);
        $this->assign('game', $gameSearch);
        
        $this->assign('result', $result['list']);
        $this->assign('ios',ConstantUtils::$PLATFORM_IOS);
        $this->assign('gameId',I('get.gameId'));
    
        $this->theme($this->theme)->display();
    }
    
    
    /**
     * 获取URL
     */
    private function getUrl($name){
        /*$urls = $_SERVER['REQUEST_URI'];
        $a = "/\\.html/";  									//这条是匹配http://localhost/hu/index.php/Home/GameToHelp/search.html的结尾的  “.html”
        $url = preg_replace($a,'',$urls);
        $patt = "/\/".$name."\/([a-zA-Z]|\\-|\\d)+/";		//这条是匹配 每个筛选条件
        $str = preg_replace($patt,'',$url);
        $p = '/\/p\/\d+\.html|\/p\/\d/';					//这条是匹配这条是匹配分页的  “/p/2.html”
        $strs = preg_replace($p,'',$str);
        return $strs;*/

        $str = trim(preg_replace("/".$name."=([a-zA-Z]|-|\d)+&?/",'',$_SERVER['QUERY_STRING']),'&');
        if(empty($str)){
            return '';
        }
        return $str.'&';
    }

    private function getWhereCondition(){
        $condition = array();

        $platform = I('get.platform');
        if($platform){
            $condition['platform'] = ConstantUtils::$PLATFORM_WHERE_CONDITION[$platform];
        }

        $price = I('get.price');
        if($price){
            $condition['price'] = ConstantUtils::$PRICE_WHERE_CONDITION[$price];
        }
        
        $gameId = I('get.gameId');
        if($gameId){
            $condition['gameId'] = "game_id =$gameId";
        }

        return $condition;
    }


    private function getSearchLine(&$getParams){
        $searchLine = array();
        $j = 0;
        foreach($getParams as $param=>$value){
            $searchLine[$j][0] = ConstantUtils::$PARAM_CATEGORY[$param];
            $url = trim(($this->getUrl($param)),'&');
            $searchLine[$j][1] = $url == '' ? $_SERVER['REDIRECT_URL'] : '?'.$url;
            if($param == 'gameId'){
                $gameMgr = new GameMgrModel();
                $searchLine[$j][2] = $gameMgr->getGameName($value);
            }
            else{
                $searchLine[$j][2] = $this->getParamText($param, $value);
            }
               $j++;
        }
        return $searchLine;
    }

    private function getParamText($param, $value){
        switch($param){
            case 'price':
                return ConstantUtils::$PRICE_STRING[$value];

            case 'platform':
                return ConstantUtils::$PLATFORM_STRING[$value];

            case 'type':
                return ConstantUtils::$TYPE_STRING[$value];
        }
    }
} 