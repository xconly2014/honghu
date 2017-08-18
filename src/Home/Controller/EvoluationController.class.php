<?php
namespace Home\Controller;
use Think\Controller;
use Home\Model\EvoluationMgrModel;
use Home\Model\IOSCZPackageModel;
use Home\Model\GameMgrModel;
use Utils\ConstantUtils;

class EvoluationController extends DetectorController{
	
	public function index($evoluationId){
		
		$evoluation = new EvoluationMgrModel();
		$evoluation->updateScanNum($evoluationId);
		
		$evoluationRes = $evoluation->getInfo($evoluationId);
		$this->assign('evoluation_info',$evoluationRes);

        $current_game_evoluation = $evoluation->getList(false,'',$evoluationRes['game_id']);
        $this->assign('cg_evoluation',$current_game_evoluation['data']);

        $hot_evoluation = $evoluation->getHotList($evoluationRes['game_id']);
        $this->assign('hot_list',$hot_evoluation['data']);

		$seoInfo = array(
			ConstantUtils::$SEO_TITLE_KEY=>$evoluationRes['title']."_轰轰虎",
			ConstantUtils::$SEO_KEYWORD_KEY=>""
		);
		$this->display('', $seoInfo);
	}
	
	
	public function evoluation_list(){
	    $evoluation = new EvoluationMgrModel();
	    $list = $evoluation->getList(true);
	    
	    $packageObj = new IOSCZPackageModel();
	    $czPackageRes = $packageObj->getListLimit(12);
	    $this->assign('cz_package',$czPackageRes);
	    
	    $this->assign('type','手游资讯');
	    $this->assign('res_list',$list['data']);
	    $this->assign('page',$list['show']);
	    $this->display();
	}
	
	
	public function search_list($gameId){
	    $gameMgr = new GameMgrModel();
	    $gameInfo = $gameMgr->getInfo($gameId);
	     
	    $evoluation = new EvoluationMgrModel();
	    $result = $evoluation->getSearchList($gameId);
	     
	    $this->assign('gameInfo',$gameInfo);
	    $this->assign('searchList',$result);
	    $this->display();
	}
}