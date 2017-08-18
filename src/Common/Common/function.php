<?php
use Home\Model\PwdAuthKeyMgrModel;
use Utils\ConstantUtils;
/**
 * 邮件
 */

function uploadPicture($imgName,$id,$width,$height,$thumb_width,$thumb_height){
    
    Vendor('Imagine.lib.Image.ManipulatorInterface');            
    Vendor('Imagine.lib.Image.ImageInterface');                   
    Vendor('Imagine.lib.Image.ImagineInterface');
    Vendor('Imagine.lib.Image.BoxInterface');
    Vendor('Imagine.lib.Image.PointInterface');
    Vendor('Imagine.lib.Image.Point');
    Vendor('Imagine.lib.Image.Box');
    Vendor('Imagine.lib.Exception.RuntimeException');
    Vendor('Imagine.lib.Gd.Image');
    Vendor('Imagine.lib.Gd.Imagine');

    $imagine = new Imagine\Gd\Imagine();
    $size    = new Imagine\Image\Box($width, $height);
    $mode    = Imagine\Image\ImageInterface::THUMBNAIL_INSET;

    $srcBase = C('src_path');
    $destBase = C('dest_path');
    
    $obj = $imagine->open($srcBase.$id.'/'.$imgName);
    $thumbObj = $obj->thumbnail($size, $mode);
    $result= $thumbObj->save($destBase.$id.'/'.$imgName);

    
    $size    = new Imagine\Image\Box($thumb_width,$thumb_height);
    $thumbObj = $obj->thumbnail($size, $mode);
    $thumbName = 'thumb'.$imgName;
    $result= $thumbObj->save($destBase.$id.'/'.$thumbName);
    
    return $result;
}

function BackgroudTask($taskType, $to, $title, $content){
    if(C('OS') == 'Linux'){
        Vendor('phpResque.phpResqueAutoload');
        switch($taskType){
            case ConstantUtils::$TASK_CZ_ORDER:
                Resque::enqueue('default', 'Mail', array('sendCZOrderMail', $content, $title));
                break;
            case ConstantUtils::$TASK_MSG_CODE:
                Resque::enqueue('default', 'Mail', array('sendMsg', $to, $title, $content));
                break;
            case ConstantUtils::$TASK_EMAIL_CODE:
                Resque::enqueue('default', 'Mail', array('sendVcode', $to, $title, $content));
                break;
            case ConstantUtils::$TASK_TRAFFIC_SERVICE:
                Resque::enqueue('default', 'Mail', array('sendTrafficService', $content));
                break;
            case ConstantUtils::$TASK_GROUP_BUY_CZ_FINISH:
                Resque::enqueue('default', 'Mail', array('sendGroupBuyLucker', $content));
                break;
            case ConstantUtils::$TASK_IOS_CZ_PACKAGE:
                Resque::enqueue('default', 'Mail', array('sendCZPackageFinish', $content));
                break;
            case ConstantUtils::$TASK_GENERATE_QUEUE:
                Resque::enqueue('default', 'Mail', array('genQueue', $content));
                break;
            case ConstantUtils::$TASK_DISTRIBUTE_TICKET:
                Resque::enqueue('default', 'Mail', array('getQueue', $title, $content));
                break;
            case ConstantUtils::$TASK_SCH_EMAIL:
                Resque::enqueue('default', 'Mail', array('sendSCHOrderMail', $content));
                break;
            case ConstantUtils::$TASK_GROUP_BUY_CZ_TIMING:
                Resque::enqueue('default', 'Mail', array('sendGroupBuyCz', 'timing', $content));
                break;
            case ConstantUtils::$TASK_GROUP_BUY_CZ_CONFIRM:
                Resque::enqueue('default', 'Mail', array('sendGroupBuyCz', 'confirm', $content));
                break;
        }
    }
}

//获取四位随机数
function GetfourStr($len)
{
    $chars_array = array(
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
        "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
        "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
        "S", "T", "U", "V", "W", "X", "Y", "Z",
    );
    $charsLen = count($chars_array) - 1;

    $outputstr = "";
    for ($i=0; $i<$len; $i++)
    {
        $outputstr .= $chars_array[mt_rand(0, $charsLen)];
    }
    return $outputstr;
}

function data_auth_sign($data) {
    //数据类型检测
    if(!is_array($data)){
        $data = (array)$data;
    }
    ksort($data); //排序
    $code = http_build_query($data); //url编码并生成query字符串
    $sign = sha1($code); //生成签名
    return $sign;
}

function is_login(){
    $user = session('user_auth');
    if (empty($user)) {
        return 0;
    } else {
        return session('user_auth_sign') == data_auth_sign($user) ? $user['uid'] : 0;
    }
}

function get_uid(){
    $user = session('user_auth');
    return $user['uid'];
}

function get_uname($uid = 0){
    if($uid && is_numeric($uid)){ //获取当前登录用户名
        return session('user_auth.username');
    }
}

function get_ulevel($level){
    return \Utils\ConstantUtils::$USER_LEVEL_STRING[$level];
}

/**
 * 文件上传类
 * @param unknown $id
 * @return string
 */
function uploads($id,$path,$size='512000',$type=''){
    
    $upload = new \Think\Upload();
    $upload->maxSize   =     $size ;// 设置附件上传大小512K
    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
    $upload->rootPath  =     './Public/upload/'.$path.'/';
    $upload->autoSub   =	 true;
    $upload->subName   = 	 "$id";
    if(!$type == \Utils\ConstantUtils::$IMG_TYPE_HEAD){
        $curTime = date("Ymd",time());
        $upload->savePath  =     "$curTime".'/';
    }
    
    $info   =   $upload->upload();
    
    if($info) {
        $imagePath = '/upload/'.$path.'/'.$info['photo1']['savepath'];
        
        if($type == \Utils\ConstantUtils::$IMG_TYPE_HEAD){
            return $data = array($info['photo1']['savename'],$imagePath);
        }else{
            return $imagePath;
        }
        
    }else{
        return $upload->getError();
    }
}

function genOrderId($type, $orderId){
    $orderPrefix = C('order_prefix');
    return $orderPrefix[$type].$orderId;
}

function orderIsCustomer($table, $oid){
    $sql = "select customer_id from $table where id=$oid";
    $model = new \Think\Model();
    $row = $model->query($sql);

    return $row[0] && $row[0]['customer_id'] == $oid;
}

function formatPicData(){
	$img = $_FILES;
	$num = count($img['images']['name']) - 1;
	$imgs = array();
	for($i=0;$i < $num;$i++){
		$j = $i + 1;
		$imgs['photo'.$j] =array(
				'name' => $img['images']['name'][$i],
				'type' => $img['images']['type'][$i],
				'tmp_name' => $img['images']['tmp_name'][$i],
				'error' => $img['images']['error'][$i],
				'size'=> $img['images']['size'][$i],
		);
	}
	$_FILES = $imgs;
}

/* function getAdminGroupid($uid){    
	$sql = "SELECT auth_group_access.group_id,auth_group.title FROM admin_user 
	JOIN auth_group_access ON admin_user.`id`=auth_group_access.`uid` 
	JOIN auth_group ON auth_group.`id` = auth_group_access.`group_id` 
	WHERE admin_user.uid = '$uid'";
	$model = new \Think\Model();
	$data = $model->query($sql);
	$result = array('group_id'=>0,'group_desc'=>null);
    if($data && $data[0]){
        $result['group_id'] = $data[0]['group_id'];
        $result['group_desc'] = $data[0]['title'];
    }
	return $result;
} */

function getAdminUserId($uid){
    $sql = "select id from admin_user where uid = '$uid'";
    $model = new \Think\Model();
    $data = $model->query($sql);
    return empty($data) ? 0 : $data[0]['id'];
    
}

function isInFreePayGroup($uid){
    $adminUserId = getAdminUserId($uid);
    if(!$adminUserId){
        return false;
    }//if

    $sql = "select is_free_pay from auth_group_access aga join auth_group ag on aga.group_id=ag.id where aga.uid=$adminUserId";
    $model  = new \Think\Model();
    $data = $model->query($sql);
    return empty($data)? false: $data[0]['is_free_pay'];
}

function getMenu(){
	$menuMgr = new \Admin\Model\MenuMgrModel();
	return $menuMgr->getMenu();
}

function isMobile(){
    $detect = new Utils\MobileDetect();
    return $detect->isMobile() ? ($detect->isTablet() ? false : true) : false;
}


//热搜索
function getSearchGameList($num){
    $gameMgr = new \Home\Model\GameMgrModel();
    return $gameMgr->getSearchGameList($num);
}



//获取六位随机数
function GetSixNum($len = 6)
{
	$chars_array = array(
			"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
	);
	$charsLen = count($chars_array) - 1;

	$outputstr = "";
	for ($i=0; $i < $len; $i++)
	{
        $outputstr .= $chars_array[mt_rand(0, $charsLen)];
	}
	return $outputstr;
}

function creditsEnough($payment){
    $uid = get_uid();
    $userMgr = new Home\Model\UserMgrModel();
    $userCredits = $userMgr->getUserCredit($uid);
    $paymentCredits = $payment* Utils\ConstantUtils::$CREDITS_TO_CZ;
    if($userCredits>0 && $paymentCredits <= $userCredits){
        return array('status'=>true,
                     'reason'=>"支付积分：".$paymentCredits,
                     'data'=>"当前积分：".$userCredits,
                     'msg'=>"");
    }
    return array('status'=>false,
                 'reason'=>"支付积分：".$paymentCredits,
                 'data'=>"当前积分：".$userCredits,
                 'msg'=>"积分不足");
}

function hbEnough($payment){
    $uid = get_uid();
    $userMgr = new Home\Model\UserMgrModel();
    $userCoins = $userMgr->getUserCoin($uid);

    if($userCoins && $payment <= $userCoins){
        return array('status'=>true,
                     'reason'=>"支付虎币：".$payment,
                     'data'=>"当前虎币：".$userCoins,
                     'msg'=>"");
    }
    return array('status'=>false,
                 'reason'=>"支付虎币：".$payment,
                // 'data'=>"抱歉，虎币正在制造，请选择其它支付方式",
               //  'msg'=>"系统维护中");
                 'data'=>"当前虎币：".$userCoins,
                 'msg'=>"虎币不足");
}

function actionNeedAuth($controller, $action){
    $base = C('auth_action');
    $authActions = $base[strtolower($controller)];
    if(in_array($action, $authActions)){
        return true;
    }
    return false;
}

function actionNeedCheck($controller, $action){
    $base = C('privilege');
    $actionSet = $base[strtolower($controller)];

    if(array_key_exists($action, $actionSet)){
        $modelInfo = $actionSet[$action];

        return array('model'=> $modelInfo[0][0],
                     'field'=> $modelInfo[0][1],
                     'param'=> $modelInfo[1][0],
                     'expect' => $modelInfo[2],
                     'msg'  => $modelInfo[3]);
    }
    return false;
}

function checkAction($cls, $field, $paramKey, $flag){
    $rowId = I('get.'.$paramKey);
    $uid = get_uid();
    $model  = new Think\Model();
    $sql = "select $field from $cls where id=$rowId";

    $result = $model->query($sql);

    switch($flag){
        case \Utils\ConstantUtils::$NOT_EQUAL:
            return $result[0][$field] == $uid? true: false;

        case \Utils\ConstantUtils::$EQUAL:
            return $result[0][$field] == $uid? false: true;

        default:
            break;
    }

    return false;
}


function setAllow(){
    session('third_party', true);
}

function isAllow(){
    if(session('third_party')){
        return true;
    }
    return false;
}
function getUserLevel($level){
    
}


//时间格式精确是毫秒   2015-08-05 14:20:33:584 长度不到23自动补零
function microtime_format(){
    
    list($ms, $times) = explode(" ", microtime());
    $time = (number_format($ms, 3) + (float)$times);

    list($usec, $sec) = explode(".", $time);
    $date = date('Y-m-d H:i:s.x',$usec);
    $result = str_replace('x', $sec, $date);
    
    $len = \Utils\ConstantUtils::$MICRO_TIME_LENGTH;
    if(($len - strlen($result)) > 0){
       return str_pad($result,$len,'0',STR_PAD_RIGHT);
    }
    return $result;
}

function curlGet($url){
    $ch = curl_init();
    $timeout = 5;
    curl_setopt ($ch, CURLOPT_URL, $url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $file_contents = curl_exec($ch);
    curl_close($ch);
    return $file_contents;
}

function send_msg($tel, $type){
    $code = GetSixNum(6);
    $pakObj = new PwdAuthKeyMgrModel();
    $insert_id = $pakObj->insertKey($tel,strtolower($code));
    if($insert_id > 0){
        session('pass_auth_id',$insert_id);
        BackgroudTask(\Utils\ConstantUtils::$TASK_MSG_CODE, $tel, $type, $code);
        return true;
    }
}

function check_msg_code(){
    $id  = session('pass_auth_id');
    $pakObj = new PwdAuthKeyMgrModel();
    $info = $pakObj->checkEffectiveness($id);
    $time = time() - $info['time'];
    if($time > 300 || $info['active'] == ConstantUtils::$IS_AUTH['yes']){
        return  "false";
    }else{
        $code = strtolower(I('post.tel_vcode'));
         
        $data = $pakObj->checkAuthKey($id,$code);
        if($data){
            return "true";
        }else{
            return "false";
        }
    }
}

function getMobileInfo($mobile){
    $url = "http://test.dahanfc.com:3429/if/FCGetAttribution?mobile=".$mobile;
    $result = curlGet($url);
    $dataDecode = json_decode($result);
    $arrayData = get_object_vars($dataDecode);
    return array('yys_type'=>strval($arrayData['yysTypeID']),
                 'p_id'=> strval($arrayData['provinceID']));
}

function autoPost($postUrl, $params){
    echo '<form method="post" action="'.$postUrl.'">';
    foreach($params as $key=>$value){
        echo '<input type="hidden" name="'.$key.'" value="'.$value.'"/>';
    }//foreach
    echo '<input type="submit" name="submit" value="提交" id="dh">
				<script>var a=document.getElementById("dh");a.click();</script>
			</form>';
}

function actionSpecial($action){
    if($action == "order_wx_pay_notify"){
        return true;
    }
    if($action == "order_alipay_mobile_notify"){
        return true;
    }

    if($action == "order_shengpay_mobile_notify"){
        return true;
    }

    if($action == "order_alipay_notify"){
        return true;
    }

    if($action == "order_shengpay_notify"){
        return true;
    }

    return false;
}

define("PBKDF2_HASH_ALGORITHM", "sha1");
define("PBKDF2_ITERATIONS", 1000);
define("PBKDF2_SALT_BYTE_SIZE", 20);
define("PBKDF2_HASH_BYTE_SIZE", 20);

define("HASH_SECTIONS", 2);
define("HASH_ALGORITHM_INDEX", 0);
define("HASH_ITERATION_INDEX", 1);
define("HASH_SALT_INDEX", 2);
define("HASH_PBKDF2_INDEX", 3);

function get_rand_char($len){
    $chars_array = array(
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
        "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
        "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
        "S", "T", "U", "V", "W", "X", "Y", "Z",
    );
    $charsLen = count($chars_array) - 1;

    $outputstr = "";
    for ($i=0; $i<$len; $i++)
    {
        $outputstr .= $chars_array[mt_rand(0, $charsLen)];
    }
    return $outputstr;
}

function create_hash($password)
{
    // format: algorithm:iterations:salt:hash
    $salt = get_rand_char(8);
    return PBKDF2_HASH_ALGORITHM . ":" . PBKDF2_ITERATIONS . ":" .  $salt . ":" .
    bin2hex(pbkdf2(
        PBKDF2_HASH_ALGORITHM,
        $password,
        $salt,
        PBKDF2_ITERATIONS,
        PBKDF2_HASH_BYTE_SIZE,
        true
    ));
}

function validate_password($password, $correct_hash)
{
    $params = explode(":", $correct_hash);
    if(count($params) < HASH_SECTIONS)
        return false;
    $pbkdf2 = $params[HASH_PBKDF2_INDEX];
    $hash_password = bin2hex(pbkdf2(
        $params[HASH_ALGORITHM_INDEX],
        $password,
        $params[HASH_SALT_INDEX],
        (int)$params[HASH_ITERATION_INDEX],
        PBKDF2_HASH_BYTE_SIZE,
        true
    ));
    return slow_equals($hash_password, $pbkdf2)? true:false;
}

function slow_equals($a, $b)
{
    $diff = strlen($a) ^ strlen($b);
    for($i = 0; $i < strlen($a) && $i < strlen($b); $i++)
    {
        $diff |= ord($a[$i]) ^ ord($b[$i]);
    }
    return $diff === 0;
}

function pbkdf2($algorithm, $password, $salt, $count, $key_length, $raw_output = false)
{
    $algorithm = strtolower($algorithm);
    if(!in_array($algorithm, hash_algos(), true))
        trigger_error('PBKDF2 ERROR: Invalid hash algorithm.', E_USER_ERROR);
    if($count <= 0 || $key_length <= 0)
        trigger_error('PBKDF2 ERROR: Invalid parameters.', E_USER_ERROR);

    if (function_exists("hash_pbkdf2")) {
        // The output length is in NIBBLES (4-bits) if $raw_output is false!
        if (!$raw_output) {
            $key_length = $key_length * 2;
        }
        return hash_pbkdf2($algorithm, $password, $salt, $count, $key_length, $raw_output);
    }

    $hash_length = strlen(hash($algorithm, "", true));
    $block_count = ceil($key_length / $hash_length);

    $output = "";
    for($i = 1; $i <= $block_count; $i++) {
        // $i encoded as 4 bytes, big endian.
        $last = $salt . pack("N", $i);
        // first iteration
        $last = $xorsum = hash_hmac($algorithm, $last, $password, true);
        // perform the other $count - 1 iterations
        for ($j = 1; $j < $count; $j++) {
            $xorsum ^= ($last = hash_hmac($algorithm, $last, $password, true));
        }
        $output .= $xorsum;
    }

    if($raw_output)
        return substr($output, 0, $key_length);
    else
        return bin2hex(substr($output, 0, $key_length));
}

function isTime(){
//     return true;
   $difference = strtotime(ConstantUtils::$TIME) - time();
   if($difference > 0){
       return true;
   }else{
       return false;
   }
}

function isActivityTime(){
    return false;
    /*$activity_time = \Utils\ConstantUtils::$ACTIVITY_TIME;
    $difference = strtotime($activity_time)-time();
    if($difference > 0){
        return true;
    }else{
        return false;
    }*/
}

function isDoubleCreditsTime(){
    return false;
    /*$startTime = strtotime(\Utils\ConstantUtils::$DOUBLE_CREDITS_START_TIME);
    $curTime = time();
    $endTime = strtotime(\Utils\ConstantUtils::$DOUBLE_CREDITS_END_TIME);
    if($curTime > $startTime && $curTime < $endTime){
        return true;
    }else{
        return false;
    }*/
}

function getDoubleCredits(){
    if(isDoubleCreditsTime()){
        return ConstantUtils::$CZ_CREDITS_MULTIPLE;
    }

    return ConstantUtils::$CZ_CREDITS_NORMAL;
}

function String_Begins_With($needle, $haystack) {
    return (substr($haystack, 0, strlen($needle))==$needle);
}

function formatIsEmailOrTel($formatTxt){
    if(preg_match("/1[3458]{1}\d{9}$/",$formatTxt)){
        return ConstantUtils::$FORMAT_TEL;
    }
    return ConstantUtils::$FORMAT_EMAIL;
}

function getExtraUrl(){
    $urlBase = C('extra_op_url');
    $key = C('extra_op_key');
    $uid = get_uid();
    $userMgr = new \Home\Model\UserMgrModel();
    $info = $userMgr->getUserInfo($uid);
    $userName = $info['extra_name'];
    return $urlBase.$userName."/".md5($userName.$key);
}

//显示未读信息条数
function getMessageNoRead(){
    $message = new \Home\Model\MessageMgrModel();
    $messageRes = $message->messageNoRead(get_uid());
    $num = intval($messageRes);
    return $num;
}

function isUserJoinOrganizationEver($uId){
    $organizationMgr = new \Home\Model\OrganizationMgrModel();
    return $organizationMgr->isUserInOrganizationEver($uId);
}

function isUserOrganizationMgr($uId){
    return ConstantUtils::$IDENTITY_MANAGER==checkIdentity($uId)? true:false;
}

function checkIdentity($uId){
    $user_id = $uId;
    $ordinary = ConstantUtils::$IDENTITY_ORDINARY;
    $type = ConstantUtils::$MEMBER_TYPE_IN;
    if($user_id){
        $model  = new Think\Model();

        $sql = "select id from organization where mgr_id = '$user_id' ";
        $organizationInfo = $model->query($sql);

        $sql = "select id from member where user_id = '$user_id' and type='$type'";
        $memberInfo = $model->query($sql);

        if($organizationInfo[0]['id'] && $memberInfo[0]['id']){
            return ConstantUtils::$IDENTITY_MANAGER;
        }elseif($organizationInfo[0]['id'] == '' && $memberInfo[0]['id']){
            return ConstantUtils::$IDENTITY_MEMBER;
        }
        return $ordinary;
    }
    return $ordinary;
}

function getUserVipLevel(){
    $vipMgr = new \Home\Model\VipLevelMgrModel();
    $userMgr = new \Home\Model\UserMgrModel();
    $userInfo = $userMgr->getUserInfo(get_uid());
    $vipRes = $vipMgr->getVipInfo($userInfo['cz_sum']);
    if($vipRes){
        return $vipRes['name'];
    }
    return '';
}



