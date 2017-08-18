<?php
namespace Admin\Controller;
use Admin\Model\SysConfigModel;
class SysConfigController extends AuthController{
    private static  $sysConfig_function ='index';
    
    
    public function index(){
        $url = '';
        if(IS_GET){
            $url = I('get.url');
        }
        
        $model =  new SysConfigModel();
        $result = $model->getItemList($url);

        $this->assign("item_list", $result['data']);
        $this->assign("page", $result['show']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$sysConfig_function);
        $this->display();
    }

    public function add(){
        if(IS_POST){
            $model = new SysConfigModel();
            $model->addItem();
            return $this->success('添加成功', U('Admin/SysConfig/index'));
        }
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$sysConfig_function);
        $this->display("add_item");
    }

    
    public function del($itemId){

        $model = new SysConfigModel();
        $delId = $model->delItem($itemId);
        if($delId){
           return $this->success('删除数据成功！',U('Admin/SysConfig/index')); 
        }
        return $this->error('删除数据失败！',U('Admin/SysConfig/index'));
    }
    
    

    public function edit($itemId){
        $model = new SysConfigModel();
        
        if(IS_POST){
            $result = $model->updateItemInfo($itemId);
            if(is_int($result)){
                return $this->success("修改成功！", U('Admin/SysConfig/index'));
            }
        }
        
        $itemInfo = $model->getItemInfo($itemId);
        
        $this->assign('itemId', $itemId);
        $this->assign("item", $itemInfo);
        $this->assign('url',U('Admin/SysConfig/edit',array('itemId'=>$itemId)));
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$sysConfig_function);

        $this->display("edit_item");
    }
} 