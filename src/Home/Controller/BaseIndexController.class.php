<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/23
 * Time: 16:40
 */

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


class BaseIndexController extends DetectorController
{
    protected function indexImp($templateFile, $seoInfo)
    {
        $bannerMgr = new BannerModel();
        $this->assign("banners", $bannerMgr->getList());
        if($this->theme == ConstantUtils::$THEME_MOBILE){
            $this->assign('type','index');
            return $this->theme($this->theme)->display($templateFile,$seoInfo);
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


        //��ȡ�����б�
        $news = new NewsMgrModel();
        $newsList = $news->getList();
        $this->assign('news_list',$newsList);

        //��ȡ�����б�
        $FriendLink = new FriendLinkMgrModel();
        $friendLinkList = $FriendLink->getList();
        $this->assign('friend_link_list',$friendLinkList);


        //��ȡ�����ײ��б?���·�����
        $package = new PackageMgrModel();
        $packageList = $package->getList();
        $this->assign('package_list',array_slice($packageList,0,8));

        //��ȡ�����������·�����
        $requirement = new RequirementMgrModel();
        $requirementList = $requirement->getList();
        $this->assign('requirement_list',array_slice($requirementList,0,8));

        //�˺Ž���
        $accountTrade = new AccountTradeMgrModel();
        $accountTradeList = $accountTrade->getList();
        $this->assign('account_trade_list',array_slice($accountTradeList,0,8));


        $this->assign('is_login', $uId);
        $this->assign('user_info', $uInfo);
        $this->theme()->display($templateFile, $seoInfo);
    }
}