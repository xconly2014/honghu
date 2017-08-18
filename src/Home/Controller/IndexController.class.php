<?php
namespace Home\Controller;

use Home\Model\BannerModel;
use Home\Model\GameMgrModel;
use Home\Model\SC\AndroidScMgrModel;
use Home\Model\UserMgrModel;
use Think\Controller;
use Utils\ConstantUtils;
use Home\Model\StrategyMgrModel;
use Home\Model\NewsMgrModel;
use Home\Model\EvoluationMgrModel;
use Home\Model\SC\IOSScMgrModel;
use Home\Model\FriendLinkMgrModel;
use Home\Model\IOSCZPackageModel;
use Home\Model\PackageMgrModel;
use Home\Model\RequirementMgrModel;
use Home\Model\AccountTradeMgrModel;
use Home\Model\SearchWordMgrModel;

class IndexController extends BaseIndexController {
    public function test(){
        $this->theme($this->theme)->display();
    }

    private function saveTag($operator){
        if(!get_uid()){
            $key = time();
            session('operator_tag', $operator);
            session($operator.'_time', $key);
            session($operator, md5($key.$operator));
        }
    }

    public function shouyou(){
        $this->saveTag(ACTION_NAME);
        $this->indexImp(ConstantUtils::$PARTNER."shouyou");
    }

    public function baidu(){
        $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$SITE_KEYWORD_CZ.'_百度',
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        $this->indexImp(ConstantUtils::$SEO_EXTRA."baidu",$seoInfo);
    }

    public function sougou(){
        
        $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$SITE_KEYWORD_CZ.'_搜狗',
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        
        $this->indexImp(ConstantUtils::$SEO_EXTRA."sougou",$seoInfo);
    }

    public function shenma(){
        
        $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$SITE_KEYWORD_CZ.'_神马',
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        
        $this->indexImp(ConstantUtils::$SEO_EXTRA."shenma",$seoInfo);
    }

    public function weixin(){
        
        $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$SITE_KEYWORD_CZ.'_微信',
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        
        $this->indexImp(ConstantUtils::$SEO_EXTRA."weixin",$seoInfo);
    }

    public function sanliuling(){
        
        $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$SITE_KEYWORD_CZ.'_360',
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        
        $this->indexImp(ConstantUtils::$SEO_EXTRA."sanliuling",$seoInfo);
    }

    public function huodong(){
        
        $seoInfo = array(
                ConstantUtils::$SEO_TITLE_KEY=>ConstantUtils::$SITE_KEYWORD_CZ.'_活动',
                ConstantUtils::$SEO_KEYWORD_KEY=>"",
        );
        
        $this->indexImp(ConstantUtils::$SEO_EXTRA."huodong",$seoInfo);
    }

    public function index(){
        $bannerMgr = new BannerModel();
        $this->assign("banners", $bannerMgr->getList());
        if($this->theme == ConstantUtils::$THEME_MOBILE){
            $this->assign('type','index');
            return $this->theme($this->theme)->display();
        }

        $gameMgr = new GameMgrModel();
        $letters = $gameMgr->getGameLetterBar();
        $this->assign("letter_bar", $letters);
        
        $suggest_list = $gameMgr->getSuggestGameList(14);
        $this->assign('suggest_list',$suggest_list); 

        $uId = is_login();
        if($uId){
            $userMgr = new UserMgrModel();
            $uInfo = $userMgr->getUserInfo($uId);
        }


        //获取公告列表
        $news = new NewsMgrModel();
        $newsList = $news->getList();
        $this->assign('news_list',$newsList);

        //获取友链列表
        $FriendLink = new FriendLinkMgrModel();
        $friendLinkList = $FriendLink->getList();
        $this->assign('friend_link_list',$friendLinkList);


        //获取代练套餐列表（最新发布）
        $package = new PackageMgrModel();
        $packageList = $package->getList();
        $this->assign('package_list',array_slice($packageList,0,8));

        //获取代练需求（最新发布）
        $requirement = new RequirementMgrModel();
        $requirementList = $requirement->getList();
        $this->assign('requirement_list',array_slice($requirementList,0,8));
        
        //账号交易
        $accountTrade = new AccountTradeMgrModel();
        $accountTradeList = $accountTrade->getList();
        $this->assign('account_trade_list',array_slice($accountTradeList,0,8));


        $this->assign('is_login', $uId);
        $this->assign('user_info', $uInfo);
        

        $this->theme($this->theme)->display();
    }

    public function search(){
        $name = '';
        if(IS_POST){
            $name = I('post.name');
        }//if

        $game = new GameMgrModel();
        $searchList = $game->getSearch($name);
        if(empty($searchList)){
            $searchMgr = new SearchWordMgrModel();
            $searchMgr->insertWord($name);
        }//if

        $this->assign('search_list',$searchList);
        $this->theme($this->theme)->display();
    }

    public function mb_search(){
        $name = '';
        if(IS_POST){
            $name = I('post.name');
        }
        
        $searchMgr = new SearchWordMgrModel();
        $searchMgr->insertWord($name);
        
        $game = new GameMgrModel();
        $searchList = $game->mbGetSearch($name);

        $this->assign('search_list',$searchList);
        $this->theme($this->theme)->display();
    }

    public function search_list($gameId){
        $game = new GameMgrModel();
        $searchInfo = $game->getSearchList($gameId);

        $this->assign('search_info',$searchInfo);
        $this->theme($this->theme)->display();
    }
    
    public function ajax_get_iossc_list(){
        $IOSScMgr = new IOSScMgrModel();
        $IOSScList = $IOSScMgr->getIOSScList();
        return $this->ajaxReturn($IOSScList);
    }
    
    public function ajax_get_androidsc_list(){
        $androidScMgr = new AndroidScMgrModel();
        $androidScList = $androidScMgr->getAndroidScList();
        return $this->ajaxReturn($androidScList);
    }
    
    public function ajax_get_strategy_list(){
        $strategy = new StrategyMgrModel();
        $strategyList = $strategy->getList(false);
        return $this->ajaxReturn($strategyList['data']);
    }
    
    public function ajax_get_evoluation_list(){
        $evoluation = new EvoluationMgrModel();
        $evoluationList = $evoluation->getList(false);
        return $this->ajaxReturn($evoluationList['data']);
    }
    
    public function ajax_get_czpackage_list(){
        $czPackage = new IOSCZPackageModel();
        $czPackageList = $czPackage->getListLimit(8);
        return $this->ajaxReturn($czPackageList);
    }
    
    public function ajax_get_czios_list(){
        $gameMgr = new GameMgrModel();
        $data = array();
        $data['gameList'] = $gameMgr->getGameLetter26(ConstantUtils::$PLATFORM_IOS, false);
        $this->ajaxReturn($data);  
    }
    
    public function web_map(){
        
        $gameMgr = new GameMgrModel();
        $suggest_list = $gameMgr->getSuggestGameList(28);
        $this->assign('suggest_list',$suggest_list);
        $this->display();
    }

    public function verify_nm(){
        $postParam = array(
            'merchantId'=>10507046,
            'merchantName'=>"鸿鹄网络科技",
            'code'=>895689562345
        );
        autoPost("http://y.nuomi.com/coupon/code/verify", $postParam);
    }
}