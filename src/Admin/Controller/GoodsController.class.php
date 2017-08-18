<?php


namespace Admin\Controller;
use Utils\FileUtils;

use Think\Controller;
use Admin\Model\GoodsMgrModel;

class GoodsController extends AuthController{
    private static  $goods_function ='goods_list';

    public function goods_list(){
    	$name = I('get.name');
    	$this->assign('title','商品列表');
    	
    	$goods = new GoodsMgrModel();
    	$goodsRes = $goods->getGoodsList($name,true);
    	$goods_list = $goodsRes['data'];
    	$show = $goodsRes['show'];
    	
    	$this->assign('goods_list',$goods_list);
    	$this->assign('show',$show);
    	$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$goods_function);
        $this->display();
    }

    public function on_sale(){
    	if(IS_POST){
    		
    		$config = C('goods_pic');
    		$fileUtil = new FileUtils($config);
    		
    		$fileUtil->formatPicData();
    		
    		$picInfo = $fileUtil->upload();
    		
    		$goods = new GoodsMgrModel();
    		$goods->addGoods($picInfo['data']);
    		return $this->success('商品添加成功！', U('Admin/Goods/goods_list'));
    	}
    	$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$goods_function);
    	$this->display();
    }
    
    public function edit_goods($id){
        $goods = new GoodsMgrModel();
        if(IS_POST){
            $goodsRes = $goods->updateGoods($id);
            if($goodsRes){
                $this->success('修改成功',U('Admin/Goods/goods_list'));
            }else{
                $this->error('修改失败');
            }
        }else{
            $goodsInfo = $goods->getInfo($id);
            $this->assign('goods_info',$goodsInfo);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$goods_function);
            $this->display();
        }
    }
    
    public function del_goods($id){
    	$goods = new GoodsMgrModel();
    	$goods->deleteGoods($id);
    	$this->assign('cur_page', CONTROLLER_NAME.'/'.self::$goods_function);
    	$this->success('删除成功',U('Admin/Goods/goods_list'));
    }



} 