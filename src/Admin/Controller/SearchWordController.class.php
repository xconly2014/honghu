<?php
namespace Admin\Controller;
use Admin\Model\SearchWordMgrModel;

class SearchWordController extends AuthController{
    private static  $word_function ='word_list';
	
	public function word_list(){
		$word = "";
		if(IS_GET){
			$word = I('get.word');
		}
		
		$searchMgr = new SearchWordMgrModel();
		$searchList = $searchMgr->getList($word);
		$this->assign('search_list',$searchList['data']);
		$this->assign('show',$searchList['show']);
		
		$this->assign('title','搜索关键字列表');
		$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$word_function);
		$this->display();
	}
	
}