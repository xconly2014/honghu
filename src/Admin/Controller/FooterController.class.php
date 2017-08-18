<?php
namespace Admin\Controller;

use Admin\Model\FooterMgrModel;
use Utils\FileUtils;

class FooterController extends AuthController{

    //底部栏列表
    public function index(){
        $model = new FooterMgrModel();
        $result = $model->getAllListItem();

        //TODO:对查询结果中的“图片路径”字段进行处理
        $colResult = $model->getAllListItemCol();
        $this -> assign('item_list',$result);
        $this->assign('item_col_list', $colResult);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.ACTION_NAME);
        $this -> display('list');
    }

    //底部栏添加处理
    public function add(){
        if(IS_POST){
            //上传图片
            $config = C('footer_pic_upload');
            $fileUtil = new FileUtils($config);
            $info = $fileUtil->upload();

            //TODO:上传图片后成功再更新数据库
            $model = new FooterMgrModel();
            $result = $model -> insertListItem($info['data']);
            if($result){
                $this->success('添加成功',U('Admin/Footer/index'));
            }else{
                $this->error('添加失败'.$info['msg']);
            }
        }

        $this->display();
    }

    //底部栏编辑
    public function edit($item_id){
        $model = new FooterMgrModel();

        if(IS_POST){
            //TODO:检查用户是否修改图片
            $model->updateListItem($item_id);
            return $this->success('修改成功', U('Admin/Footer/index'));
        }else{
            $item = $model->getListItem($item_id);

            $this->assign('itemId', $item_id);
            $this -> assign('footer', $item);
            $this -> display();
        }
    }

    //底部栏目删除
    function del($item_id){
        $model = new FooterMgrModel();
        $res = $model -> delListItem($item_id);
        if($res){
            $this -> success('删除成功');
        }else{
            $this -> error('删除失败');
        }
    }


    function add_col($item_id){
        if(IS_POST){
            $model = new FooterMgrModel();
            $model->insertItemCol($item_id);
            $this -> success('添加子项成功', U('Admin/Footer/index'));
        }

        $this->assign("itemId", $item_id);
        $this->display();
    }

    function edit_col($col_id){
        $model = new FooterMgrModel();

        if(IS_POST){
            $model->updateItemCol($col_id);
            $this -> success('修改子项成功', U('Admin/Footer/index'));
        }

        $colItem = $model->getItemCol($col_id);

        $this->assign("colId", $col_id);
        $this->assign("colItem", $colItem);
        $this->display();
    }

    function del_col(){

    }
} 