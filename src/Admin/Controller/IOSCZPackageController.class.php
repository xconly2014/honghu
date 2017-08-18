<?php
namespace Admin\Controller;

use Admin\Model\GameMgrModel;
use Admin\Model\IOSCZPackageModel;

class IOSCZPackageController extends AuthController {
    private static  $ios_cz_package_function ='index';

    public function index(){
        $this->assign('title', "充值套餐列表");
        $this->assign('cur_page', "ios_cz_package");
        $packageObj = new IOSCZPackageModel();
        $czPackageList =  $packageObj->getList();
        
        $this->assign('cz_package_list',$czPackageList);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$ios_cz_package_function);
        $this->display();
    }

    public function on_sale(){
        if(IS_POST){
            $packageObj = new IOSCZPackageModel();
            $insertId = $packageObj->addData();
            if($insertId > 0){
                $this->success('发布成功',U('Admin/IOSCZPackage/index'));
            }else{
                $this->error('发布失败',U('Admin/IOSCZPackage/index'));
            }
        }
        if(IS_GET){
            $game_id = intval(I('get.game_id'));
            
            $gameObj = new GameMgrModel();
            $gameList = $gameObj->getGameList();
            $this->assign('game_list', $gameList['data']);
            
            $this->assign('game_id',$game_id);
            $this->assign('url',U('Admin/CzPackage/on_sale'));
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$ios_cz_package_function);
            $this->display();
        }
        
    }
    
    public function del($packageId){
        $packageObj = new IOSCZPackageModel();
        $result = $packageObj->deleteItem($packageId);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$ios_cz_package_function);
        if($result > 0){
            return $this->success('删除成功',U('Admin/IOSCZPackage/index'));
        }
         $this->error('删除失败',U('Admin/IOSCZPackage/index'));
    }

} 