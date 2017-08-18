<?php
namespace Admin\Controller;

use Admin\Model\GameMgrModel;
use Admin\Model\ScIosMgrModel;
use Admin\Model\SchRecordMgrModel;

class IOSScController extends AuthController{
    private static  $iossc_function ='index';

    public function index(){
        
        $keywords = I('get.keywords');
        $scIos = new ScIosMgrModel();
        $scIosRes = $scIos->getList($keywords);
        
        $this->assign('scIosRes',$scIosRes['data']);
        $this->assign('show',$scIosRes['show']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$iossc_function);
        $this->assign('keyword', $keywords);
        $this->display();
    }

    public function sc_insert(){
        if(IS_POST){
            $scIos = new ScIosMgrModel();
            $scIosRes = $scIos->add();
            if($scIosRes){
                return $this->success("添加成功！",U('Admin/IOSSc/index'));
            }else{
                return $this->error('添加失败');
            }
        }else{
            $game = new GameMgrModel();
            $gameRes = $game->getGameList();
            $this->assign('gameRes',$gameRes['data']);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$iossc_function);
            $this->display();
        }
    }

    public function sc_edit($id){
        if(IS_POST){
            $scIos = new ScIosMgrModel();
            $scIosRes = $scIos->update();
            if($scIosRes){
                return $this->success('修改成功');
            }else{
                return $this->error('修改失败');
            }
        }
        $scIos = new ScIosMgrModel();
        $scIosRes = $scIos->info($id);
        $this->assign('submit_url', U('Admin/IOSSc/sc_edit', array('id'=>$id)));
        $this->assign('scIosRes',$scIosRes);
        $this->display();
    }

    public function sc_del(){
        $scIos = new ScIosMgrModel();
        $scIosRes = $scIos->del();
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$iossc_function);
        if($scIosRes){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    
    public function sch_record_list(){
        
        $keywords = I('get.keywords');
        $schRecord = new SchRecordMgrModel();
        $schRecordList = $schRecord->getList($keywords);
        
        $this->assign('sch_record_list',$schRecordList['data']);
        $this->assign('show',$schRecordList['show']);
        $this->assign('cur_page',CONTROLLER_NAME.'/'.self::$iossc_function);
        $this->display();
    }
    
    public function sch_record_add(){
        if(IS_POST){
            $schRecord = new SchRecordMgrModel();
            $schRecordRes = $schRecord->schInsert();
            
            if($schRecordRes){
                return $this->success('添加成功',U('Admin/IOSSc/sch_record_list'));
            }else{
                return $this->error('添加失败');
            }
        }
        
        $game = new GameMgrModel();
        $gameRes = $game->getGameList();
        $this->assign('gameRes',$gameRes['data']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$iossc_function);
        $this->display();
        
        
        
    }
    
    public function sch_record_del($id){
        $schRecord = new SchRecordMgrModel();
        $schRecordRes = $schRecord->schDelete($id);
        
        if($schRecordRes){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }

} 