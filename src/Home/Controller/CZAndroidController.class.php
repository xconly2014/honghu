<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-5-12
 * Time: 下午5:16
 */

namespace Home\Controller;


use Home\Model\CZ\CZOptionAndroidMgrModel;
use Home\Model\CZ\CZOrderAndroidModel;
use Home\Model\GameMgrModel;
use Think\Controller;
use Utils\ConstantUtils;

class CZAndroidController extends Controller{
    public function index(){
        $game = new GameMgrModel();
        $gameList = $game->getGameLetter26(ConstantUtils::$PLATFORM_ANDROID);
        $this->assign('game_list', $gameList);
        $this->display();
    }

    public function chongzhi_info($gameId){
        if(IS_POST){

            $option =new CZOptionAndroidMgrModel();


            $optionItem = $option->getOptionInfo($_POST['cz_option']);
            $price = $optionItem['price'];

            $order = new CZOrderAndroidModel();
            $orderId = $order->orderInsert($gameId, $price);
            if($orderId){
                $this->redirect('Home/CZAndroid/chongzhi_verify', array('orderId'=>$orderId));
            }
        }

        $option = new CZOptionAndroidMgrModel();
        $operator = $option->getOperator($gameId);
        $this->assign('operator',$operator);

        $game = new GameMgrModel();
        $info = $game->getInfo($gameId);
        $this->assign('game_name', $info['name']);
        $this->assign('game_id', $info['id']);

        $title = $info['name'] ."充值|".$info['name']."安卓充值_轰轰虎手游服务平台";
        $this->assign('title', $title);
        $this->assign('submit_url', U('Home/CZAndroid/chongzhi_info', array('gameId'=>$gameId)));

        $this->display();
    }

    public function chongzhi_verify($orderId){
        if(IS_POST){

            return $this->redirect('CZOrderAndroid/order_pay', array(orderId => $orderId));
                /*
            $payWayObj = new PaysetUtils();
            $payWay = $payWayObj->parsePayway($_POST['pay_way']);
            $model = new CZOrderAndroidModel();
            $model->setPayWay($payWay, $orderId);
            $orderInfo = $model->getInfo($orderId);

            //读取文件内容，把整个文件读入一个字符串中
            $content = file_get_contents("Templates/Home/Email/android_cz.html");
            foreach($orderInfo as $key => $value){
                $content = str_replace('{'.$key.'}',$value,$content);
            }

            $to = "164840173@qq.com";
            $title = "android充值";

            $info = sendMail($to,$title,$content);
            if($info){
                $this->redirect('chongzhi_doing');
            }else{
                $this->error('邮件发送失败');
            }
                */
        }

        $order = new CZOrderAndroidModel();
        $data = $order->getInfo($orderId);
        $this->assign("orderInfo", $data);
        $this->assign("submit_url", U('Home/CZAndroid/chongzhi_verify', array('orderId'=>$orderId)));
        $this->display();
    }

    /**
     * ajax生成面额的下拉菜单
     */
    public function createOption(){
        if(IS_AJAX){
            $option = new CZOptionAndroidMgrModel;
            $operator_id = I('post.operator_id');

            $game_id = I('post.game_id');
            $data = $option->getOption($operator_id, $game_id);
            $this->ajaxReturn($data);
        }
    }

    public function chongzhi_doing($orderId){
        $this->display();
    }

} 