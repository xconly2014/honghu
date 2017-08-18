<?php
namespace Admin\Controller;

use Admin\Model\FamilyLogoMgrModel;
class FamilyLogoController extends AuthController{
    
    private static $family_logo_function = 'logo_list';
    
    public function logo_list(){
        
        $familyLogoMgr = new FamilyLogoMgrModel();
        $familyLogoList = $familyLogoMgr->getList();
        
        $this->assign('logo_list',$familyLogoList);
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$family_logo_function);
        $this->display();
    }
    
    public function upload(){
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     1024000 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->autoSub   =     false;
        $upload->rootPath  =     'Public';
        $upload->savePath  =      '/img/family/logo/'; // 设置附件上传目录
        // 上传单个文件
        $info   =   $upload->uploadOne($_FILES['pic_name']);
        if(!$info) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功 获取上传文件信息
            return $info['savename'];
        }
    }
    
    public function logo_add(){
        if(IS_POST){
            $pic_name = $this->upload();
            
            $familyLogo = new FamilyLogoMgrModel();
            $familyLogoRes = $familyLogo->addLogo($pic_name);
            if($familyLogoRes){
                return $this->success('添加成功',U('Admin/FamilyLogo/logo_list'));
            }else{
                return $this->error('添加失败',U('Admin/FamilyLogo/logo_add'));
            }
        }
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$family_logo_function);
        $this->assign('title','添加堂会logo');
        $this->display();
    }
    
    public function del_logo($id){
        $familyLogoMgr = new FamilyLogoMgrModel();
        $familyLogoMgr->deleteLogo($id);
        $this->success('删除成功',U('Admin/FamilyLogo/logo_list'));
    }
}