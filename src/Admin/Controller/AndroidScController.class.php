<?php
namespace Admin\Controller;

use Admin\Model\GameMgrModel;
use Admin\Model\ScAndroidMgrModel;

class AndroidScController extends AuthController{
    private static  $androidsc_function ='index';

    public function index(){
        $keywords = I('get.keywords');
        $scAndroid = new ScAndroidMgrModel();
        $scAndroidRes = $scAndroid->getList($keywords);
        
        $this->assign('scAndroidRes',$scAndroidRes['data']);
        $this->assign('show',$scAndroidRes['show']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$androidsc_function);
        $this->assign('keyword', $keywords);
        $this->display();
    }

    public function sc_insert(){
        if(IS_POST){
            $scIos = new ScAndroidMgrModel();
            $scIosRes = $scIos->insert();
            if($scIosRes){
                $this->success("添加成功！",U('Admin/AndroidSc/index'));
            }else{
                $this->error('添加失败');
            }
        }else{
            $game = new GameMgrModel();
            $gameRes = $game->getGameList();
            
            $scAndroid = new ScAndroidMgrModel();
            $operatorList = $scAndroid->getOperator();
            
            $this->assign('operator',$operatorList);
            $this->assign('gameRes',$gameRes['data']);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$androidsc_function);
            $this->display();
        }
    }
    
    public function sc_edit($id){
        if(IS_POST){
            $scAndroid = new ScAndroidMgrModel();
            $scAndroidRes = $scAndroid->update($id);
            if($scAndroidRes){
                return $this->success('修改成功');
            }else{
                return $this->error('修改失败');
            }
        }
        $scAndroid = new ScAndroidMgrModel();
        $scAndroidRes = $scAndroid->info($id);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$androidsc_function);
        $this->assign('submit_url',U('Admin/AndroidSc/sc_edit',array('id'=>$id)));
        $this->assign('scAndroidRes',$scAndroidRes);
        $this->display();
    }

    public function sc_del(){
        $scAndroid = new ScAndroidMgrModel();
        $scAndroidRes = $scAndroid->delete();
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$androidsc_function);
        if($scAndroidRes){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }

} 