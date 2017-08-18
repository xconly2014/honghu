<?php
namespace Admin\Controller;

use Admin\Model\CZOptionAndroidMgrModel;
use Admin\Model\CZOptionIOSMgrModel;
use Admin\Model\EvaluationMgrModel;
use Admin\Model\GameMgrModel;
use Admin\Model\StrategyMgrModel;
use Utils\FileUtils;
use Admin\Model\SuggestGameListMgrModel;


class GameController extends AuthController{
    private static  $game_function ='game_list';
    private static  $strategy_function ='strategy';
    private static  $evaluation_function ='evaluation';
    private  static $suggest_function = 'suggest_list';

    public function game_list(){

        $name = I('get.name');
        $this->assign('title', "游戏列表");
        $model = new GameMgrModel();
        $gameRes = $model->getGameList($name, true);
        $game_list = $gameRes['data'];
        $show = $gameRes['show'];
        $this->assign('game_list',$game_list);
        $this->assign('show',$show);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$game_function);
        $this->display("game_list");
    }

    public function on_sale(){
        if(IS_POST){
            //上传图片

            $config = C('game_pic_upload');
            $fileUtil = new FileUtils($config);

            $fileUtil->formatPicData();

            $picInfo = $fileUtil->upload();

            $model = new GameMgrModel();
            $model->addGame($_POST, $picInfo['data']);

            return $this->success('游戏添加成功！', U('Admin/Game/game_list'));
        }

        $this->assign('title', "游戏上架");
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$game_function);
        $this->display("game_on_sale");
    }


    public function add_option($game_id){
        $this->assign('title', "添加充值面额");
        if(IS_POST){
            $model = new GameMgrModel();
            $model->addGameIosOption($game_id, $_POST);

            $this->success("添加面额成功", U('Admin/Game/list_option', array('game_id'=>$game_id)));
        }
    }

    public function list_option($game_id){
        $title = "游戏面额";
        $this->assign('title', $title);
        $this->assign('game_id', $game_id);

        $optionIOSMgr = new CZOptionIOSMgrModel();
        $iosOption = $optionIOSMgr->getOptions($game_id);
        $optionAndroidMgr = new CZOptionAndroidMgrModel();
        $androidOption = $optionAndroidMgr->getOptions($game_id);

        $this->assign('ios_options', $iosOption);
        $this->assign('android_option', $androidOption);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$game_function);
        $this->display("list_cz_option");
    }

    public function ios_option_operate($game_id, $op_id, $hide){
        $optionIOSMgr = new CZOptionIOSMgrModel();
        $optionIOSMgr->changeDisplay($op_id, $hide);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$game_function);
        $this->success("修改成功", U('Admin/Game/list_option', array('game_id'=>$game_id)));
    }

    public function ios_option_del($game_id, $op_id){
        $optionIOSMgr = new CZOptionIOSMgrModel();
        $optionIOSMgr->del($op_id);

        $this->success("删除面额成功", U('Admin/Game/list_option', array('game_id'=>$game_id)));
    }

    public function shelves($game_id, $platform, $flag){
        $gameMgr = new GameMgrModel();
        $gameMgr->shelves($game_id, $platform, $flag);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$game_function);
        $this->success("操作成功", U('Admin/Game/game_list'));
    }

    public function game_edit($game_id){
        $gameMgr = new GameMgrModel();
            $title = "游戏编辑";
            $this->assign('title',$title);
            $row = $gameMgr->getInfo($game_id);
        if(IS_GET){
            $this->assign('game_info',$row);
            $this->assign('url',U('Admin/Game/game_edit',array('game_id'=>$game_id)));
            $this->display('game_edit');
        }
        if(IS_POST){
            $pic = I('post.thumbnail_path');
            if($pic){
                $file =  './Public/upload/game_pic/'.$row['img']; 
                unlink($file);
            }
            $result =  $gameMgr->updateGame($game_id,$pic);
            if(is_int($result)){
                return $this->success('修改成功',U('Admin/Game/game_list'));
            }else{
                return $this->error('修改失败');
            }
        }

    }
    
    public function upload_game_pic(){
        if (!empty($_FILES)) {
            //图片上传设置
            $config = C('game_pic_upload');
            $upload = new \Think\Upload($config);// 实例化上传类
            $images = $upload->upload();
    
            //判断是否有图
            if($images){
                $info['savepath']=$images['Filedata']['savepath'];
                $info['savename'] = $images['Filedata']['savename'];
                $this->ajaxReturn($info);//返回文件地址和名给JS作回调用
            }
            else{
                $this->error($upload->getError());//获取失败信息
            }
        }
    }

    /*
     *
     * 攻略与评测
     *
     *
     */
    public function strategy(){
        $title = "";
        if(IS_GET){
            $title = I('get.title');
        }

        $objMgr = new StrategyMgrModel();
        $strategyList = $objMgr->getItemList($title);
        $this->assign('strategies', $strategyList['data']);
        $this->assign('show',$strategyList['show']);

        $this->assign('title',"游戏攻略列表");
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$strategy_function);
        $this->display();
    }

    public function write_strategy(){
        if(IS_POST){
            $strModel = new StrategyMgrModel();
            $result = $strModel->addItem();

            if($result){
                return $this->success("添加成功！",U('Admin/Game/strategy'));
            }else{
                return $this->error("添加失败！",U('Admin/Game/game_list'));
            }
        }

        $this->assign('title',"游戏攻略");
        //获取游戏列表
        $gameModel = new GameMgrModel();
        $game = $gameModel->getGameList();

        $this->assign('game',$game['data']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$strategy_function);

        $this->display();
    }

    public function edit_strategy($id){
        if(IS_POST){
            $strModel = new StrategyMgrModel();
            $result = $strModel->updateItem($id);
            $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$strategy_function);

            if($result){
                return $this->success("修改成功！",U('Admin/Game/strategy'));
            }else{
                return $this->error("修改失败！",U('Admin/Game/strategy'));
            }
        }

        $gameModel = new GameMgrModel();
        $game = $gameModel->getGameList();

        $this->assign('title',"修改游戏攻略");
        $strModel = new StrategyMgrModel();
        $data = $strModel->getItemRow($id);

        $this->assign('data', $data);
        $this->assign('game',$game['data']);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$strategy_function);
        $this->display();
    }

    public function del_strategy($id){
        $strModel = new StrategyMgrModel();
        $strModel->deleteItem($id);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$strategy_function);
        $this->success("删除成功！",U('Admin/Game/strategy'));
    }

    public function evaluation(){
        $title = "";
        if(IS_GET){
            $title = I('get.title');
        }

        $objMgr = new EvaluationMgrModel();
        $strategyList = $objMgr->getItemList($title);

        $this->assign('strategies', $strategyList['data']);
        $this->assign('show',$strategyList['show']);
        $this->assign('title',"游戏评测列表");
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$evaluation_function);
        $this->display();
    }

    public function write_evaluation(){
        if(IS_POST){
            $strModel = new EvaluationMgrModel();
            $result = $strModel->addItem();

            if($result){
                return $this->success("添加成功！",U('Admin/Game/evaluation'));
            }else{
                return $this->error("添加失败！",U('Admin/Game/game_list'));
            }
        }
        //获取游戏列表
        $gameModel = new GameMgrModel();
        $game = $gameModel->getGameList();

        $this->assign('game',$game['data']);
        $this->assign('title',"游戏评测");
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$evaluation_function);
        $this->display();
    }

    public function edit_evaluation($id){
        if(IS_POST){
            $strModel = new EvaluationMgrModel();
            $result = $strModel->updateItem($id);

            if($result){
                return $this->success("修改成功！",U('Admin/Game/evaluation'));
            }else{
                return $this->error("修改失败！",U('Admin/Game/evaluation'));
            }
        }

        $gameModel = new GameMgrModel();
        $game = $gameModel->getGameList();

        $this->assign('title',"修改游戏评测");
        $strModel = new EvaluationMgrModel();
        $data = $strModel->getItemRow($id);
        $this->assign('game',$game['data']);
        $this->assign('data', $data);
        $this->assign('submit_url', U('Admin/Game/edit_evaluation', array('id'=>$id)));
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$evaluation_function);

        $this->display();
    }

    public function del_evaluation($id){
        $strModel = new EvaluationMgrModel();
        $data = $strModel->deleteItem($id);
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$evaluation_function);
        $this->success("删除成功！",U('Admin/Game/evaluation'));
    }

    public function suggest_list(){

        $suggestGameListMgr = new SuggestGameListMgrModel();
        $suggestList = $suggestGameListMgr->getList();

        $this->assign('title','推荐游戏列表');
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$suggest_function);
        $this->assign('suggest_list',$suggestList);
        $this->display();
    }

    public function suggest_add(){

        if(IS_POST){
            $suggestGameListMgr = new SuggestGameListMgrModel();
            $suggestRes = $suggestGameListMgr->addItem();
            if($suggestRes){
                return $this->success('添加成功',U('Admin/Game/suggest_list'));
            }else{
                return $this->error('添加失败',U('Admin/Game/suggest_add'));
            }
        }
        //获取游戏列表
        $gameModel = new GameMgrModel();
        $game = $gameModel->getGameList();

        $this->assign('game',$game['data']);
        $this->assign('title',"推荐游戏添加");
        $this->assign('cur_page', CONTROLLER_NAME.'/'.self::$suggest_function);
        $this->display();
    }

    public function suggest_del($id){
        $suggestGameListMgr = new SuggestGameListMgrModel();
        $suggestRes = $suggestGameListMgr->deleteItem($id);
        $this->success("删除成功！",U('Admin/Game/suggest_list'));
    }
} 