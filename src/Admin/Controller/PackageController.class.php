<?php

namespace Admin\Controller;

use Admin\Model\GameMgrModel;
use Admin\Model\PackageMgrModel;
use Home\Model\SecurityMgrModel;
use Utils\ConstantUtils;

class PackageController extends AuthController{
    private static  $package_function ='package_list';

    public function package_list(){
    	$title = '';
    	if(IS_POST){
    	    $title = I('post.title');
    	}
    	
        $package = new PackageMgrModel();
        $result = $package->getPackage($title);

        $packageRes = $result['data'];
        $show = $result['show'];

        $this->assign('packageRes',$packageRes);
        $this->assign('show',$show);
        $this->assign('title','代练套餐');
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$package_function);
        $this->display();
    }

    public function package_edit($id){
    	$package = new PackageMgrModel();
        if(IS_POST){
            $packageRes = $package->updatePackage($id);
            if($packageRes){
                $this->success('审核成功', U('Admin/Package/package_list'));
            }else{
                $this->error('审核失败');
            }

        }else{
            $packageOne = $package->getPackageInfo($id);

            $game = new GameMgrModel();
            $gameInfo = $game->getInfo($packageOne['game_id']);

            $this->assign('review_not_pass', ConstantUtils::$PACKAGE_UNPASS);
            $this->assign('review_pass', ConstantUtils::$PACKAGE_PASS);
            $this->assign('game_name',$gameInfo['name']);
            $this->assign('packageOne',$packageOne);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$package_function);
            $this->display();
        }
    }
    
    public function details($id){
        $package = new PackageMgrModel();
        $rowInfo = $package->getInfo($id);
        $this->assign('row',$rowInfo['packageInfo']);
        $this->display();
    }
} 