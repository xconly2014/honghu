<?php
namespace Admin\Controller;

use Admin\Model\BannerMgrModel;
class BannerController extends AuthController{
    private static  $banner_function ='banner_list';
    
    public function banner_list(){
        
        $banner = new BannerMgrModel();
        $bannerList = $banner->getList();
        
        $this->assign('banner_list',$bannerList);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$banner_function);
        $this->display();
    }
    public function upload(){    
        $upload = new \Think\Upload();// 实例化上传类    
        $upload->maxSize   =     1024000 ;// 设置附件上传大小    
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
        $upload->autoSub   =     false;
        $upload->rootPath  =     'Public';
        $upload->savePath  =      '/upload/banner/'; // 设置附件上传目录    
        // 上传单个文件     
        $info   =   $upload->uploadOne($_FILES['img']);
        if(!$info) {// 上传错误提示错误信息        
            $this->error($upload->getError());
            }else{// 上传成功 获取上传文件信息         
                return $info['savename'];
            }
    }
    
    public function write_banner(){
        if(IS_POST){
            $pic_name = $this->upload();
            
            $banner = new BannerMgrModel();
            $bannerRes = $banner->addBanner($pic_name);
            if($bannerRes){
                $this->success('添加成功',U('Admin/Banner/banner_list'));
            }else{
                $this->error('添加失败',U('Admin/Banner/write_banner'));
            }
        }else{
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$banner_function);
            $this->assign('title','首页轮播图');
            $this->display();
        }
    }
    
    public function banner_edit($id){
        $banner = new BannerMgrModel();
        if(IS_POST){
            $bannerRes = $banner->editBanner($id);
            if($bannerRes){
                return $this->success('修改成功',U('Admin/Banner/banner_list'));
            }else{
                return $this->error('修改失败',U('Admin/Bannner/banner_edit'));
            }
        }
        $banner = new BannerMgrModel();
        $bannerInfo = $banner->getRow($id);
        
        $this->assign('banner_info',$bannerInfo);
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$banner_function);
        $this->assign('title','编辑首页轮播图');
        $this->display();
    }
    
    public function del_banner($id){
        $banner = new BannerMgrModel();
        $banner->deleteBanner($id);
        $this->success('删除成功',U('Admin/Banner/banner_list'));
    }
}