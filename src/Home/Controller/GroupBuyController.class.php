<?php
namespace Home\Controller;

use Think\Controller;
use Home\Model\GoodsMgrModel;
use Home\Model\IOSCZPackageModel;
use Home\Model\GroupBuyCzMgrModel;
use Utils\ConstantUtils;

class GroupBuyController extends DetectorController {
    
    private function decideNumByViewMode(){
        return $this->theme == "mb" ? 10 : 5;
    }

    public function index(){
        //获取积分兑换商品列表
        $goods = new GoodsMgrModel();
        $goodsList = $goods->getGoodsList(5,false);
        $this->assign('goods_list',$goodsList['data']);
        
        //获取充值团购列表
        $num = $this->decideNumByViewMode();
        $packageObj = new IOSCZPackageModel();
        $packageRes = $packageObj->getListLimit($num, array('name'=>I('post.name')));
        $this->assign('cz_package', $packageRes);

        //获取一元购列表
        $groupBuy = new GroupBuyCzMgrModel();
        $groupBuyRes = $groupBuy->getListLimit($num, array('name'=>I('post.name')));
        $this->assign('group_buy',$groupBuyRes);
        
        //获取一元购幸运用户
        $luckyList = $groupBuy->getLuckyList();
        $this->assign('lucky_list',$luckyList);
        $fakeList = $groupBuy->getFakeList();
        $this->assign('fake_list', $fakeList);
        
        $this->assign('activity_time',isActivityTime());
        
        $this->theme($this->theme)->display();
    }
    
    //一元购列表
    public function show_all(){
        $groupBuy = new GroupBuyCzMgrModel();

        if($this->theme == 'mb'){

            $groupBuyRes['going'] = $groupBuy->getListPager(array('active' => ConstantUtils::$ACTIVE));
            $groupBuyRes['end']   = $groupBuy->getListPager(array('active' => ConstantUtils::$UNACTIVE));

        }elseif($this->theme == ''){

            $groupBuyRes = $groupBuy->getListPager(array('name'=>I('post.name')));

            //推荐充值团购列表
            $packageObj = new IOSCZPackageModel();
            $packageRes = $packageObj->getListLimit(5, array('name'=>I('post.name')));
            $this->assign('cz_package', $packageRes);
        }

        $this->assign('group_buy',$groupBuyRes);
        $this->theme($this->theme)->display();
    }

    
    public function cz_package_all(){
        $packageObj = new IOSCZPackageModel();
        $packageRes = $packageObj->getListPager(array('name'=>I('post.name')));
        $this->assign('cz_package',$packageRes['data']);
        $this->assign('show',$packageRes['show']);
        
        //推荐一元购列表
        $groupBuy = new GroupBuyCzMgrModel();
        $groupBuyRes = $groupBuy->getListLimit(5, array('name'=>I('post.name')));
        $this->assign('group_buy',$groupBuyRes);
        $this->display();
    }

    public function introduce_gb(){
        $this->theme($this->theme)->display();
    }
} 