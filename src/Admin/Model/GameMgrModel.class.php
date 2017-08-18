<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-15
 * Time: 下午3:52
 */

namespace Admin\Model;


use Utils\ConstantUtils;

class GameMgrModel extends DataMgrBaseModel{

    private $tableName = "game";

    public function getGameList($name="", $isPage=false){
        $sql = "select * from $this->tableName where name like '%$name%'";
        
        if($isPage){
            $sql = "select id from $this->tableName where name like '%$name%'";
            $res = $this->query($sql);
            $count = count($res);
            $Page = new \Think\Page($count,10);//实例化分页类 传入总记录数和每页显示的记录数
            $sql = "select * from $this->tableName where name like '%$name%' limit $Page->firstRow,$Page->listRows";
            $show = $Page->show();//分页输出显示
        }
        $data = $this->query($sql);
        
        
        $result['show'] = $show;
        $result['data'] = $data;
        
        return $result;
    }

    public function getInfo($id){
        $sql = "select id, name, priority, pinyin,thumbnail_path,card_name,currency_name,discount,android_platform,ios_platform,need_qufu, is_tx, card_name,ios_url, android_url
        from $this->tableName where id=".$id;

        $result = $this->query($sql);
        if(empty($result)){
            return "";
        }

        $row = $result[0];
        $retValue = array(
            'id'=> $row['id'],
            'name'=> $row['name'],
            'pinyin'=>$row['pinyin'],
            'img'=>$row['thumbnail_path'],
            'card_name'=>$row['card_name'],
            'currency'=> $row['currency_name'],
            'game_discount'=> $row['discount'],
            'android_platform'=>$row['android_platform'],
            'ios_platform'=>$row['ios_platform'],
            'need_qufu'=>$row['need_qufu'],
            'qufu_flag'=> $row['need_qufu'],
            'tx_flag'=> $row['is_tx'],
            'beizhu' => $row['card_name'],
            'url_ios'=>$row['ios_url'],
            'url_android'=>$row['android_url'],
            'priority'   =>$row['priority']
        );

        return $retValue;
    }

    public function addGame(&$postObj, $thumbPath){
        $priority = $_POST['game_priority'];
        $name = $_POST['game_name'];
        $pinyin = $_POST['game_pinyin'];
        $currency = $_POST['game_currency'];
        $card_name = $_POST['card_name'];
        $discount = $_POST['game_discount'];
        $ios = $_POST['platform_ios'] == 'on'? 1:0;
        $android = $_POST['platform_android'] == 'on'? 1:0;
        $need_qufu = $_POST['need_server'];
        $is_tx = $_POST['tx_game'];
        $pinyin_category = strtoupper($_POST['game_pinyin'][0]);
        $ios_url = $_POST['url_ios'];
        $android_url = $_POST['url_android'];

        $sql  = "insert into $this->tableName(priority, name, pinyin, thumbnail_path, card_name, currency_name, discount, android_platform, ios_platform, is_tx, need_qufu, pinyin_category,ios_url,android_url)
                 values($priority, '$name', '$pinyin', '$thumbPath', '$card_name', '$currency', $discount, $android, $ios, $is_tx, $need_qufu, '$pinyin_category','$ios_url','$android_url')";

        $this->execute($sql);
    }
    
    
    public function updateGame($game_id,$pic=''){
        $name = I('post.game_name');
        $pinyin = I('post.game_pinyin');
        $currency_name = I('post.game_currency');
        $card_name = I('post.card_name');
        $discount = I('post.game_discount');
        $ios = I('post.platform_ios') == 'on'? 1:0;
        $android = I('post.platform_android') == 'on'? 1:0;
        $is_tx = I('post.tx_game');
        $need_qufu = I('post.need_server');
        $ios_url = I('post.url_ios');
        $android_url = I('post.url_android');
        $priority = I('post.game_priority');
        
        $pinyin_category = strtoupper($_POST['game_pinyin'][0]);

        $sql = "update $this->tableName set priority=$priority, name='$name', pinyin='$pinyin',currency_name='$currency_name',card_name='$card_name',
        discount='$discount',ios_platform='$ios', android_platform='$android',is_tx='$is_tx',need_qufu='$need_qufu',ios_url='$ios_url',android_url='$android_url',pinyin_category='$pinyin_category' where id='$game_id'";
        
        if($pic){
            $sql = "update $this->tableName set thumbnail_path='$pic',priority=$priority, name='$name', pinyin='$pinyin',currency_name='$currency_name',card_name='$card_name',discount='$discount',ios_platform='$ios', android_platform='$android',is_tx='$is_tx',need_qufu='$need_qufu',ios_url='$ios_url',android_url='$android_url',pinyin_category='$pinyin_category' where id='$game_id'";
        }
        return $this->execute($sql);
    }

    public function addGameIosOption($gameId, &$postObj){
        $result = $this->getInfo($gameId);
        $currencyName = $result['currency'];

        $currency = $postObj['currency'];
        $price = $postObj['price'];
        $text = $postObj['option_text'];
        $priority = $postObj['priority'];
        $detail = $currency.$currencyName;
        if($text!=""){
            $detail = $detail."( ".$text." )";
        }
        $rate = $postObj['rate'];
        $multiple = 1;
        $hide = 1;

        $sql = "insert into cz_option_ios(priority, game_id, currency, price, detail, rate, hide, multiple, text)
                values($priority, $gameId, $currency, $price, '$detail', $rate, 0, $multiple, '$text')";
        $this->execute($sql);
    }

    public function addGameAndroidOption($gameId, &$postObj){
        //TODO
    }

    public function getGameAndroidOption($gameId){

    }



    public function shelves($id, $platform, $flag){
        $sql = "";
        switch($platform){
            case ConstantUtils::$PLATFORM_ANDROID:
                $sql = "update $this->tableName set android_platform='$flag' where id=$id";
                break;
            case ConstantUtils::$PLATFORM_IOS:
                $sql = "update $this->tableName set ios_platform='$flag' where id=$id";
                break;
            default:
                break;
        }

        $this->execute($sql);
    }
    
    
    public function getNameAndImg($gameId){
        $sql = "select name ,thumbnail_path from $this->tableName where id = '$gameId'";
        $result  = $this->query($sql);
        return empty($result)? "": $result[0];
    }
    
    public function getGameName($id){
        $sql = "select name from $this->tableName where id = '$id'";
        $result = $this->query($sql);
        return empty($result) ? '' : $result[0]['name'];
    }
    
    public function updateDownUrl($id){
        
        $ios_url = I('post.ios_url');
        $android_url = I('post.android_url');

        $sql = "update $this->tableName set ios_url='$ios_url',android_url='$android_url' where id='$id'";
        return $this->execute($sql);
    }
} 