<?php
namespace Home\Controller;
use Think\Controller;
use Home\Model\StrategyMgrModel;
use Home\Model\IOSCZPackageModel;
use Home\Model\GameMgrModel;
use Utils\ConstantUtils;

class StrategyController extends DetectorController{
	
	public function index($strategyId){
		
		$strategy = new StrategyMgrModel();
		$strategy->updateScanNum($strategyId);

		$strategyRes = $strategy->getInfo($strategyId);
        $this->assign('strategy_info',$strategyRes);

        $current_game_strategy = $strategy->getList(false,'',$strategyRes['game_id']);
        $this->assign('cg_strategy',$current_game_strategy['data']);

        $hot_strategy = $strategy->getHotList($strategyRes['game_id'],true);
        $this->assign('hot_list',$hot_strategy['data']);

		$seoInfo = array(
			ConstantUtils::$SEO_TITLE_KEY=>$strategyRes['title']."_轰轰虎",
			ConstantUtils::$SEO_KEYWORD_KEY=>""
		);
		$this->display('', $seoInfo);
	}
	
	public function strategy_list(){
	    $strategy = new StrategyMgrModel();
	    $list = $strategy->getList(true);
	    
	    $packageObj = new IOSCZPackageModel();
	    $czPackageRes = $packageObj->getListLimit(12);
	    $this->assign('cz_package',$czPackageRes);
	    
	    $this->assign('type','手游攻略');
	    $this->assign('res_list',$list['data']);
	    $this->assign('page',$list['show']);
	    $this->display();
	}
	
	public function search_list($gameId){
	    $gameMgr = new GameMgrModel();
	    $gameInfo = $gameMgr->getInfo($gameId);
	    
	    $strategy = new StrategyMgrModel();
	    $result = $strategy->getSearchList($gameId);
	    
	    $this->assign('gameInfo',$gameInfo);
	    $this->assign('searchList',$result);
	    $this->display();  
	}
}
