<?php
namespace Home\Controller;
use Think\Controller;
use Home\Model\NewsMgrModel;
use Utils\ConstantUtils;

class NewsController extends DetectorController{
	
	public function index($newsId){
		
		$news = new NewsMgrModel();
		$newsInfo = $news->getInfo($newsId);
		
		$this->assign('news_info',$newsInfo);

		$seoInfo = array(
			ConstantUtils::$SEO_TITLE_KEY=>$newsInfo['title'].ConstantUtils::$SITE_KEYWORD
		);
		return $this->theme($this->theme)->display('', $seoInfo);
	}
}