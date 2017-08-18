<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-20
 * Time: 下午4:55
 */

namespace Home\Model;

use Utils\ConstantUtils;
use Home\Model\SC\IOSScMgrModel;
use Admin\Controller\AndroidSCController;
use Home\Model\SC\AndroidScMgrModel;

class GameMgrModel extends DataMgrBaseModel{
    private $tableName = "game";


    public function getAllGame(){
        $sql = "select id, name,pinyin_category from $this->tableName where ios_platform = ".ConstantUtils::$PLATFORM_IOS." order by pinyin_category asc";
        $result =  $this->query($sql);
        foreach($result as $key=>$list){
            $result[$key]['letter'] = $list['pinyin_category'];
        }
        return $result;

    }

    public function getInfo($id){
        $sql = "select id, name, currency_name, ios_platform, need_qufu, is_tx, thumbnail_path, ios_url, android_url from $this->tableName where id=".$id;

        $result = $this->query($sql);
        if(empty($result)){
            return "";
        }

        $row = $result[0];
        $retValue = array('id'=> $row['id'],
            'name'=> $row['name'],
            'currency'=> $row['currency_name'],
            'qufu_flag'=> $row['need_qufu'],
            'tx_flag'=> $row['is_tx'],
            'pic'=> $row['thumbnail_path'],
            'ios_url' => $row['ios_url'],
            'android_url' => $row['android_url'],
            'ios_platform' => $row['ios_platform']
        );

        return $retValue;
    }

    public function getCurrencyName($id){
        $sql = "select currency_name from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)? "":$result[0]['currency_name'];
    }

    public function getGameName($id){
        $sql = "select name from $this->tableName where id=".$id;
        $result = $this->query($sql);
        return empty($result)? "":$result[0]['name'];
    }


    public function getGameLetterSingle(){

    }

    private function getWhereConByPlatform($platform){
        $whereCondition = "";
        switch($platform){
            case ConstantUtils::$PLATFORM_BOTH:
                $whereCondition = " where ios_platform=1 or android_platform=1";
                break;
            case ConstantUtils::$PLATFORM_IOS:
                $whereCondition = " where ios_platform=1";
                break;
            case ConstantUtils::$PLATFORM_ANDROID:
                $whereCondition = " where android_platform=1";
                break;
        }
        return $whereCondition;
    }

    public function getGameLetterBar(){
        $sql = "select DISTINCT(pinyin_category) as letter from $this->tableName where ios_platform=1 order by letter";
        $result = $this->query($sql);
        $letterBar = array();
        foreach($result as $key =>$data){
            $letterBar[$key] = $data['letter'];
        }//foreach

        return $letterBar;
    }

    public function getGameLetter26($platform, $limit = false){
        $baseUrl = "select id,name,pinyin_category, thumbnail_path, ios_platform, android_platform from $this->tableName";
        $whereCondition = $this->getWhereConByPlatform($platform);
        $orderCondition = " order by pinyin_category,priority desc";
        $sql = $baseUrl.$whereCondition.$orderCondition;

        $data = $this->query($sql);

        $num = count($data);
        $zm = array();
        $rowInfo =  array();

        for($i =0;$i<26;$i++){
            for($k = 0;$k < $num;$k++){

                if(chr($i+65) == $data[$k]['pinyin_category']){
                    $rowInfo['id'] = $data[$k]['id'];
                    $rowInfo['name'] = $data[$k]['name'];
                    $rowInfo['android'] = $data[$k]['android_platform'];
                    $rowInfo['ios'] = $data[$k]['ios_platform'];
                    $rowInfo['pic'] = $data[$k]['thumbnail_path'];
                    $rowInfo['url'] = U('Home/CZIOS/chongzhi_info',array('gameId'=>$data[$k]['id']));

                    $zm[chr($i+65)][] = $rowInfo;
                    if($limit && count($zm[chr($i+65)]) == 14){
                        break;
                    }
                }
            }
        }
        return $zm;
    }

    public function getGameLetter(){
        $category = array();

        $sql = "select id, name, android_platform, ios_platform from $this->tableName where pinyin_category in ('A', 'B', 'C', 'D')";
        $result = $this->query($sql);
        $rowInfo =  array();
        foreach($result as $row){
            $rowInfo['id'] = $row['id'];
            $rowInfo['name'] = $row['name'];
            $rowInfo['android'] = $row['android_platform'];
            $rowInfo['ios'] = $row['ios_platform'];

            $category["ABCD"][] = $rowInfo;
        }//foreach

        $sql = "select name, android_platform, ios_platform from $this->tableName where pinyin_category in ('E', 'F', 'G', 'H')";
        $result = $this->query($sql);
        $rowInfo =  array();
        foreach($result as $row){
            $rowInfo['name'] = $row['name'];
            $rowInfo['android'] = $row['android_platform'];
            $rowInfo['ios'] = $row['ios_platform'];

            $category["EFGH"][] = $rowInfo;
        }

        //TODO:其它字母表
        //  dump($category);

        return $category;
    }

    public function getSearch($name){

        $sql = "select id,name,ios_platform,thumbnail_path from $this->tableName where name like '%$name%' or pinyin like '%$name%'";
        $result = $this->query($sql);
        $retValue = $result;

        $strategy = new StrategyMgrModel();
        $evoluation = new EvoluationMgrModel();
        $package = new PackageMgrModel();
        $requirement = new RequirementMgrModel();
        $accountTrade = new AccountTradeMgrModel(); 
        $scIos = new IOSScMgrModel();
        $scAndroid = new AndroidScMgrModel();
        
        foreach($result as $k=>$v){
            //攻略标题的获取
            $strategyId = $strategy->isExistByGameId($v['id']);
            $retValue[$k]['strategy'] = $strategyId;

            //评测标题的获取
            $evoluationId = $evoluation->isExistByGameId($v['id']);
            $retValue[$k]['evoluation'] = $evoluationId;


            //代练套餐标题的获取
//             $packageTitleList = $package->getTitle($v['id']);
//             $retValue[$k]['package'] = $packageTitleList;

            //代练需求标题的获取
//             $requirementTitleList = $requirement->getTitle($v['id']);
//             $retValue[$k]['requirement'] = $requirementTitleList;
            
           //账号交易标题的获取
//             $accountTradeTitleList = $accountTrade->getTitle($v['id']);
//             $retValue[$k]['accountTrade'] = $accountTradeTitleList;
            
            //获取苹果首充号标题
            $scIosId = $scIos->isExistByGameId($v['id']);
            $retValue[$k]['scIos'] = $scIosId;
            
            
            //获取安卓首冲号标题  
            $scAndroidId= $scAndroid->isExistByGameId($v['id']);
            $retValue[$k]['scAndroid'] = $scAndroidId;
            
            
        }
        
        
        foreach($retValue as $k=>$v){
            if($v['ios_platform'] or $v['strategy'] or $v['evoluation'] or $v['package'] or $v['requirement'] or $v['accountTrade'] or $v['scIos'] or $v['scAndroid']){
                $retValue[$k]['isShow'] = true;
            }else{
                $retValue[$k]['isShow'] = false;
            }
        }
        return $retValue;
        
    }

    public function mbGetSearch($name){
        $sql = "select id,name,ios_platform from $this->tableName where name like '%$name%' or pinyin like '%$name%'";

        $result = $this->query($sql);
        return empty($result)?'':$result;
    }

    public function getSearchList($gameId){
        $sql = "select id,name,ios_platform from $this->tableName where id='$gameId'";
        $result = $this->query($sql);
        if(empty($result)){
            return '';
        }
        $retValue = $result[0];

        //获取代练套餐标题
        $package = new PackageMgrModel();
        $packageTitleList = $package->getTitle($gameId);
        $retValue['package'] = $packageTitleList;

        //获取苹果首充号标题
        $scIos = new IOSScMgrModel();
        $scIosTitleList = $scIos->getTitle($gameId);
        $retValue['scIos'] = $scIosTitleList;
        
        //获取安卓首冲号标题
        $scAndroid = new AndroidScMgrModel();
        $scAndroidTitleList = $scAndroid->getTitle($gameId);
        $retValue['scAndroid'] = $scAndroidTitleList;

        $czPackage = new IOSCZPackageModel();
        $czPackageTitleList = $czPackage->getTitle($gameId);
        $retValue['czPackage'] = $czPackageTitleList;

        if($retValue['ios_platform'] or $retValue['package'] or $retValue['scIos'] or $retValue['scAndroid'] or $retValue['czPackage']){
            $retValue['isShow'] = true;
        }else{
            $retValue['isShow'] = false;
        }
        return $retValue;
    }

    public function getSuggestGameList($num = '10'){
        $sql = "select A.game_id,B.name,B.thumbnail_path from suggested_game_list as A
    	LEFT JOIN $this->tableName as B ON A.game_id = B.id
    	order by B.priority desc limit ".$num;
        return $this->query($sql);
    }

    public function getSearchGameList($num = '5'){
        $sql = "select A.game_id,B.name from search_game_list as A
    	LEFT JOIN $this->tableName as B ON A.game_id = B.id
    	order by A.id desc limit ".$num;
        return $this->query($sql);
    }
} 