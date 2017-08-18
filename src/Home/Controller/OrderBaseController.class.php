<?php


namespace Home\Controller;


use Home\Model\AccountTradeOrderMgrModel;
use Home\Model\CoinsOrderMgrModel;
use Home\Model\CoinsRecordMgrModel;
use Home\Model\CreditRecordsMgrModel;
use Home\Model\CZ\CZOrderIOSModel;
use Home\Model\GroupBuyCzOrderMgrModel;
use Home\Model\IOSCZPackageOrderModel;
use Home\Model\PackageOrderModel;
use Home\Model\RequirementOrderMgrModel;
use Home\Model\SC\AndroidScOrderMgrModel;
use Home\Model\SC\IOSScOrderMgrModel;
use Home\Model\TrafficOrderMgrModel;
use Home\Model\UserMgrModel;
use Think\Controller;
use Utils\ConstantUtils;

abstract class OrderBaseController extends DetectorController {

    public function _initialize() {
        vendor('Alipay.Corefunction');
        vendor('Alipay.Md5function');
        vendor('Alipay.Notify');
        vendor('Alipay.Submit');
        vendor('ShengPay.Core');
        vendor('WxPay.NativePay');
        vendor('WxPay.WxPayNotify');
        parent::_initialize();
    }

    public function prePay($payway, $callbackUrl, $orderId){
        $orderModelMgr = $this->getOrderModelByControllerName();
        $info = $orderModelMgr->setPayInfo($payway, $callbackUrl, $orderId);
        return $info;
    }

    public function order_gamecard_pay($type, $oid, $payment){
        $baseInfo = C('order_base_info');

        $mpbalance = new \Shengpay();

        $param = array(
            'Name'=>'B2CPayment',
            'Version'=>'V4.1.1.1.1',
            'Charset'=>'UTF-8',
            'SendTime'=>date('YmdHis'),
            'OrderTime'=>date('YmdHis'),
            'PayType' => '',
            'PayChannel' => '',
            'InstCode'=>'',
            'PageUrl'=>$baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_GAMECARD],
            'NotifyUrl'=>$baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_GAMECARD],
            'ProductName'=>$baseInfo[$type]['subject'],
            'BuyerContact'=>'',
            'BuyerIp'=>'',
            'Ext1'=>'',
            'Ext2'=>'',
            'SignType'=>'MD5',
        );

        $mpbalance->init($param);
        $mpbalance->updatePayHost();
        $mpbalance->setParam('PayType', 'PT030');
        $mpbalance->setParam('PayChannel','60');
        $mpbalance->setParam('PayChannel','61');
        $mpbalance->setParam('PayChannel','62');
        $mpbalance->setParam('PayChannel','63');
        $mpbalance->setParam('PayChannel','64');
        $mpbalance->setParam('PayChannel','65');
        $mpbalance->setParam('PayChannel','66');
        $mpbalance->setParam('PayChannel','67');
        $mpbalance->setParam('PayChannel','68');
        $mpbalance->setParam('PayChannel','73');
        $mpbalance->setParam('InstCode','CM');

        $mpbalance->takeOrder($oid, $payment, true);
    }

    public function order_mpbalance_pay($type, $oid, $payment){
        $baseInfo = C('order_base_info');

        $mpbalance = new \Shengpay();

        $param = array(
            'Name'=>'B2CPayment',
            'Version'=>'V4.1.1.1.1',
            'Charset'=>'UTF-8',
            'SendTime'=>date('YmdHis'),
            'OrderTime'=>date('YmdHis'),
            'PayType' => '',
            'PayChannel' => '',
            'InstCode'=>'',
            'PageUrl'=>$baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_MPBALANCE],
            'NotifyUrl'=>$baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_MPBALANCE],
            'ProductName'=>$baseInfo[$type]['subject'],
            'BuyerContact'=>'',
            'BuyerIp'=>'',
            'Ext1'=>'',
            'Ext2'=>'',
            'SignType'=>'MD5',
        );

        $mpbalance->init($param);
        $mpbalance->updatePayHost();
        $mpbalance->setParam('PayType', 'PT030');
        $mpbalance->setParam('PayChannel','75');
        $mpbalance->setParam('PayChannel','76');
        $mpbalance->setParam('PayChannel','77');
        $mpbalance->setParam('InstCode','CM');

        $mpbalance->takeOrder($oid, $payment, true);
    }

    public function order_wx_pay($type, $idNo, $payment){
        $baseInfo = C('order_base_info');
        $payTitle = $baseInfo[$type]['subject'];

        $wxPay = new \NativePay();
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($baseInfo[$type]['subject']);
        $input->SetAttach("test");
        $input->SetOut_trade_no($idNo);
        $input->SetTotal_fee($payment * 100);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag($payTitle);
        $input->SetNotify_url($baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_WX]);
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id("123456789");
        $result = $wxPay->GetPayUrl($input);
        $qrCodeUrl = $result["code_url"];
        $this->assign('qr_code_url', $qrCodeUrl);

        $this->assign('pay_title', $payTitle);
        $this->assign('pay_price', $payment);

        $oId = I('get.orderId');
        $orderReviewUrl = U(MODULE_NAME.'/'.CONTROLLER_NAME.'/'."review_order", array('orderId'=>$oId));
        $this->assign('review_order_url', $orderReviewUrl);
        $this->theme($this->theme)->display('Common/wx_qrcode_pay');
    }

    public function order_wx_pay_notify(){
        \Think\Log::write("-----------------");
        \Think\Log::write("wx notify start");
        $notify = new \PayNotifyCallBack();
        $result = $notify->Handle(false);
        if($result['status'] == true){
            \Think\Log::write("wx notify end");
            \Think\Log::write("-----------------");
            $idNo = $result['data'];
            $orderModelMgr = $this->getOrderModelByControllerName();

            if(!$orderModelMgr->checkOrderStatus($idNo)){
                $orderModelMgr->orderHandle($idNo);
            }
        }
        else{
            \Think\Log::write("wx pay error order".$result['msg']);
        }
    }

    public function order_shengpay($bankNo, $type, $oid, $payment){
        $baseInfo = C('order_base_info');
        $shengpay=new \Shengpay();

        $array=array(
            'Name'=>'B2CPayment',
            'Version'=>'V4.1.1.1.1',
            'Charset'=>'UTF-8',
            'SendTime'=>date('YmdHis'),
            'OrderTime'=>date('YmdHis'),
            'PayType'=>'PT001',
            'InstCode'=> $bankNo,
            'PageUrl'=>$baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_SHENGPAY],
            'NotifyUrl'=>$baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_SHENGPAY],
            'ProductName'=>'ʢ��֧ͨ��',
            'BuyerContact'=>'',
            'BuyerIp'=>'',
            'Ext1'=>'',
            'Ext2'=>'',
            'SignType'=>'MD5',
        );

        $shengpay->init($array);
        $shengpay->takeOrder($oid, $payment);
    }

    public function order_alipay($type, $oid, $payment){
        $alipay_config = C('alipay_config');
        $baseInfo = C('order_base_info');
        $url = $alipay_config['gateway_url'];

        $parameter = array(
            "service" => "create_direct_pay_by_user",
            "partner" => trim($alipay_config['partner']),
            "seller_email" => trim($alipay_config['seller_email']),
            "notify_url"	=> $baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_ALIPAY],
            "return_url"	=> $baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_ALIPAY],
            "subject"	=> $baseInfo[$type]['subject'],
            "out_trade_no"	=> $oid,
            "total_fee"	=> $payment,
            "payment_type"	=> "1",
            "body"	=> "",
            "show_url"	=> "",
            "anti_phishing_key"	=> "",
            "exter_invoke_ip"	=> "",
            "_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
        );

        $alipaySubmit = new \AlipaySubmit($url, $alipay_config);
        $html_text = $alipaySubmit->buildRequestForm($parameter,"get", "正在为您跳转到支付宝……");
        echo $html_text;
    }

    public function order_alipay_notify(){
        $alipay_config=C('alipay_config');
        $alipayNotify = new \AlipayNotify($alipay_config);
        $verify_result = $alipayNotify->verifyNotify();
        $out_trade_no   = $_POST['out_trade_no'];

        if($verify_result) {
            $trade_no       = $_POST['trade_no'];
            $trade_status   = $_POST['trade_status'];
            $total_fee      = $_POST['total_fee'];
            $notify_id      = $_POST['notify_id'];
            $notify_time    = $_POST['notify_time'];
            $buyer_email    = $_POST['buyer_email'];
            $parameter = array(
                "out_trade_no"     => $out_trade_no,
                "trade_no"     => $trade_no,
                "total_fee"     => $total_fee,
                "trade_status"     => $trade_status,
                "notify_id"     => $notify_id,
                "notify_time"   => $notify_time,
                "buyer_email"   => $buyer_email,
            );
            if($_POST['trade_status'] == 'TRADE_FINISHED') {
                //
            }
            else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
                $orderId = $out_trade_no;
                $orderModelMgr = $this->getOrderModelByControllerName();

                if(!$orderModelMgr->checkOrderStatus($orderId)){
                    $orderModelMgr->orderHandle($orderId);
                }//if
            }//else if
            \Think\Log::write('order_alipay_notify success'."----".$orderId);
            echo "success";
        }else {
            \Think\Log::write('order_alipay_notify fail'."----".$out_trade_no);
            echo "fail";
        }
    }

    public function order_alipay_return(){
        $alipay_config = C('alipay_config');
        $alipayNotify = new \AlipayNotify($alipay_config);
        $verify_result = $alipayNotify->verifyReturn();
        if($verify_result) {
            $out_trade_no   = $_GET['out_trade_no'];
            $trade_status   = $_GET['trade_status'];

            if( $trade_status == 'TRADE_FINISHED' || $trade_status == 'TRADE_SUCCESS') {
                $orderId = $out_trade_no;
                $orderModelMgr = $this->getOrderModelByControllerName();

                /*if(!$orderModelMgr->checkOrderStatus($orderId)){
                    $orderModelMgr->orderHandle($orderId);
                }*/
                $url = $orderModelMgr->getCallBackUrl($orderId);
                redirect($url);
            }
            else {
                $payFailedBaseInfo = C('pay_failed_page');
                echo "trade_status=".$trade_status;
                echo "֧��ʧ��ҳ�棬��ʵ��";

                //TODO:
                //$this->redirect($payFailedBaseInfo['alipay']);//��ת�������������õ�֧��ʧ��ҳ�棻
            }
        }else {
            //��֤ʧ��
            echo "֧��ʧ��!";
        }
    }

    public function order_alipay_mobile($type, $oid, $payment){
        $alipay_config = C('alipay_config');
        $baseInfo = C('order_base_info_mobile');

        $url = $alipay_config['mobile_gateway_url'];
        $notify_url = $baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_ALIPAY];
        $call_back_url =  $baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_ALIPAY];
        $seller_email = trim($alipay_config['seller_email']);
        $subject = $baseInfo[$type]['subject'];
        $req_id = date('Ymdhis');
        //�����жϷ��ص�ַ
        $merchant_url = "http://127.0.0.1:8800/WS_WAP_PAYWAP-PHP-UTF-8/xxxx.php";
        //�û�������;�˳������̻��ĵ�ַ����http://��ʽ������·�����������?id=123�����Զ������

        $req_data = "";
        $req_data = $req_data.'<direct_trade_create_req><notify_url>'.$notify_url.'</notify_url>';
        $req_data = $req_data.'<call_back_url>'.$call_back_url.'</call_back_url>';
        $req_data = $req_data.'<seller_account_name>'.$seller_email.'</seller_account_name>';
        $req_data = $req_data.'<out_trade_no>'.$oid.'</out_trade_no>';
        $req_data = $req_data.'<subject>'.$subject.'</subject>';
        $req_data = $req_data.'<total_fee>'.$payment.'</total_fee>';
        $req_data = $req_data.'<merchant_url>'.$merchant_url.'</merchant_url></direct_trade_create_req>';

        $para_token = array(
            "service"   => "alipay.wap.trade.create.direct",
            "partner"   => $alipay_config['partner'],
            "sec_id"    => $alipay_config['sign_type'],
            "format"	=> "xml",
            "v"	        => "2.0",
            "req_id"	=> $req_id,
            "req_data"	=> $req_data,
            "_input_charset"	=> $alipay_config['input_charset']
        );

        $alipaySubmit = new \AlipaySubmit($url, $alipay_config);
        $html_text = $alipaySubmit->buildRequestHttp($para_token);
        $html_text = urldecode($html_text);
        $para_html_text = $alipaySubmit->parseResponse($html_text);
        $request_token = $para_html_text['request_token'];
        $req_data = '<auth_and_execute_req><request_token>'.$request_token.'</request_token></auth_and_execute_req>';
        $parameter = array(
            "service"        => "alipay.wap.auth.authAndExecute",
            "partner"        => $alipay_config['partner'],
            "sec_id"         => $alipay_config['sign_type'],
            "format"	     => "xml",
            "v"	             => "2.0",
            "req_id"	     => $req_id,
            "req_data"	     => $req_data,
            "_input_charset" => $alipay_config['input_charset']
        );
        $html_text = $alipaySubmit->buildRequestForm($parameter, 'get', '正在为您跳转到支付宝……');
        echo $html_text;
    }

    public function order_alipay_mobile_notify(){
        \Think\Log::write('start');
        vendor('Alipay.Corefunction');
        vendor('Alipay.Md5function');
        vendor('Alipay.Notify');
        vendor('Alipay.Submit');

        $alipay_config = C('alipay_config');

        $alipayNotify = new \AlipayNotify($alipay_config);
        $verify_result = $alipayNotify->verifyNotifyMobile();

        if($verify_result) {
            $doc = new \DOMDocument();
            if ($alipay_config['sign_type'] == 'MD5') {
                $doc->loadXML($_POST['notify_data']);
            }

            if ($alipay_config['sign_type'] == '0001') {
                $doc->loadXML($alipayNotify->decrypt($_POST['notify_data']));
            }

            if( ! empty($doc->getElementsByTagName( "notify" )->item(0)->nodeValue) ) {
                $out_trade_no = $doc->getElementsByTagName( "out_trade_no" )->item(0)->nodeValue;
                $trade_no = $doc->getElementsByTagName( "trade_no" )->item(0)->nodeValue;
                $trade_status = $doc->getElementsByTagName( "trade_status" )->item(0)->nodeValue;
                if($trade_status == 'TRADE_FINISHED') {
                    echo "success";
                }
                else if ($trade_status == 'TRADE_SUCCESS') {
                    echo "success";
                }

                \Think\Log::write('order_alipay_mobile_notify start');
                $idNo = $out_trade_no;
                $orderModelMgr = $this->getOrderModelByControllerName();
                if(!$orderModelMgr->checkOrderStatus($idNo)){
                    $orderModelMgr->orderHandle($idNo);
                }
                \Think\Log::write('order_alipay_mobile_notify');
            }
        }
        else {
            \Think\Log::write('dfdfdfdfdfdfdfddf');
            echo "fail";
        }
    }

    public function order_alipay_mobile_return(){
        $alipayConfig = C('alipay_config');
        $alipayNotify = new \AlipayNotify($alipayConfig);
        $verify_result = $alipayNotify->verifyReturnMobile();
        if($verify_result) {
            $out_trade_no = $_GET['out_trade_no'];
            $result = $_GET['result'];
            $orderId = $out_trade_no;
            $orderModelMgr = $this->getOrderModelByControllerName();

            /*if(!$orderModelMgr->checkOrderStatus($orderId)){
                $orderModelMgr->orderHandle($orderId);
            }*/
            $url = $orderModelMgr->getCallBackUrl($orderId);
            redirect($url);
        }
        else {
            echo "��֤ʧ��";
        }
    }

    public function order_shengpay_page(){
        $shengpay=new \Shengpay();
        $spConfig = C('shengpay_config');
        $shengpay->setKey($spConfig['key']);

        if($shengpay->returnSign()){
            $oid=$_POST['OrderNo'];
            $fee=$_POST['TransAmount'];
            $orderModelMgr = $this->getOrderModelByControllerName();

            $orderId = $oid;
            /*if(!$orderModelMgr->checkOrderStatus($orderId)){
                $orderModelMgr->orderHandle($orderId);
            }*/

            $url = $orderModelMgr->getCallBackUrl($orderId);
            redirect($url);
        }
        else{
            echo 'Error';
        }
    }

    public function order_shengpay_notify(){
        $shengpay=new \Shengpay();
        $spConfig = C('shengpay_config');
        $shengpay->setKey($spConfig['key']);
        $oid=$_POST['OrderNo'];

        if($shengpay->returnSign()){
            $fee = $_POST['TransAmount'];

            $idNo = $oid;
            $orderModelMgr = $this->getOrderModelByControllerName();
            if(!$orderModelMgr->checkOrderStatus($idNo)){
                $orderModelMgr->orderHandle($idNo);
            }

            \Think\Log::write('order_shengpay_notify success'."---".$oid);
            echo 'OK';
        }else{
            \Think\Log::write('order_shengpay_notify error'."---".$oid);
            echo 'Error';
        }
    }

    public function order_vcoins_pay($type, $idNo, $payment){
        $baseInfo = C('order_base_info');
        $sprec = $baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_VCOINS];
        $vcoinsInfo = C('vcoins_config');
        $spreq=$vcoinsInfo['spreq'];
        $spversion=$vcoinsInfo['version'];
        $spid = $vcoinsInfo['spid'];
        $sppwd = $vcoinsInfo['sppwd'];
        $servadd= $vcoinsInfo['url'];
        $spname = $vcoinsInfo['spname'];
        $post_key=$idNo.$spreq.$sprec.$spid.$sppwd.$spversion.$payment;
        $md5password=strtoupper(md5($post_key));

        $params = array(
            'spid'     => $spid,
            'spname'   => urlencode($spname),
            'spoid'    => $idNo,
            'spreq'    => $spreq,
            'sprec'    => $sprec,
            'userid'   => '11',
            'userip'   => $_SERVER['REMOTE_ADDR'],
            'spmd5'    => $md5password,
            'spcustom' => urlencode("php����"),
            'spversion'=> $spversion,
            'money'    => $payment,
            'urlcode'  => "utf-8"
        );

        echo '<form method="post" action="'.$servadd.'">';
        foreach($params as $key=>$value){
            echo '<input type="hidden" name="'.$key.'" value="'.$value.'"/>';
        }
        echo '<input type="submit" name="submit" value="�ύ" id="dh">
				<script>var a=document.getElementById("dh");a.click();</script>
			</form>';
    }

    public function order_vcoins_receive(){
        $vcoinsInfo = C('vcoins_config');
        $spid = $vcoinsInfo['spid'];
        $sppwd = $vcoinsInfo['sppwd'];
        $rtmd5=$_GET['v1'];//'V�ҷ�����MD5
        $trka=$_GET['v2'];// 'V�Һ���15λ
        $rtmi=$_GET['v3'];//'V������6λ ������Ϊ�� ��V��û�����룩
        $rtmz=$_GET['v4'];//'��ֵ 1-999 ������ֵ
        $rtlx=$_GET['v5'];//'��������1��2��3 ��  1:��ʽ�� 2�����Կ� 3 ��������
        $rtoid=$_GET['v6'];//ӯ���������Ķ���
        $rtcoid=$_GET['v7'];//�ͻ��˶���
        $rtuserid=$_GET['v8'];//�û�ID
        $rtcustom=$_GET['v9'];//�̻��Զ����ֶ�
        $rtflag=$_GET['v10'];//'����״̬. 1Ϊ�������ͻ��� 2Ϊ�������ͻ���

        $get_key=strtoupper(md5($trka.$rtmi.$rtoid.$spid.$sppwd.$rtcoid.$rtflag.$rtmz));

        if($rtflag==1)
        {
            if($rtmd5==$get_key)
            {
                $idNo = $rtcoid;
                $orderModelMgr = new CoinsOrderMgrModel();
                $oId = $orderModelMgr->getRealId($idNo);

                if(!$orderModelMgr->checkOrderStatus($idNo))
                {
                    $orderModelMgr->orderHandle($idNo); //�޸Ķ���״̬
                    $coinsRecord = new CoinsRecordMgrModel();

                    if(!$coinsRecord->RecordExist($oId)){
                        $coinsOrderInfo = $orderModelMgr->getInfo($oId);
                        $coinsNum = $coinsOrderInfo['coins'];
                        //$coinsRecord->generateRecord($oId, $coinsNum, ConstantUtils::$HB_RECORD_TYPE_BUY);
                        $user = new UserMgrModel();
                        $user->addCoins(get_uid(), $coinsNum);
                        header("Data-Received:ok_vpay8");
                    }
                }
                else
                {
                    $idNo = $rtcoid;
                    $orderModelMgr = new CoinsOrderMgrModel();
                    $url = $orderModelMgr->getCallBackUrl($idNo);
                    redirect($url);
                }
            }
        }

        if($rtflag==2)
        {
            if($rtmd5==$get_key)
            {
                $idNo = $rtcoid;
                $orderModelMgr = new CoinsOrderMgrModel();

                if($orderModelMgr->checkOrderStatus($idNo))
                {
                    $orderModelMgr->orderHandle($idNo); //�޸Ķ���״̬
                    $coinsRecord = new CoinsRecordMgrModel();

                    $oId = $orderModelMgr->getRealId($idNo);
                    if(!$coinsRecord->RecordExist($oId)){
                        $coinsOrderInfo = $orderModelMgr->getInfo($oId);
                        $coinsNum = $coinsOrderInfo['coins'];
                        //$coinsRecord->generateRecord($oId, $coinsNum, ConstantUtils::$HB_RECORD_TYPE_BUY);
                        $user = new UserMgrModel();
                        $user->addCoins(get_uid(), $coinsNum);
                    }
                }
                $url = $orderModelMgr->getCallBackUrl($idNo);
                redirect($url);
            }
        }
    }

    public function order_fees_pay($type, $idNo, $payment){
        $baseInfo = C('order_base_info');
        /*
        $spreq = "http://www.honghonghu.com".U('Home/CoinsCenter/fees');
        $spsuc = $baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_FEES];
        */

        $spreq = "";
        $spsuc = "";

        $feesInfo = C('fees_config');
        $spid = $feesInfo['spid'];
        $sppwd = $feesInfo['sppwd'];
        $baseUrl = $feesInfo['url'];
        $mob = "13539480926";

        $getParamsString =$spid.$idNo.$sppwd.$payment.$spreq.$spsuc.$mob;
        $md5password=strtoupper(md5($getParamsString));

        $getParams = array(
            'sp'=>$spid,
            'od'=>$idNo,
            'mz'=>$payment,
            'md5'  => $md5password,
            'spreq'=>"",
            'spsuc'=>"",
            'spzdy'=> "honghu",
            'mob'=>$mob,
            'uid'=>11
        );

        $url = $baseUrl;
        foreach($getParams as $key=>$value){
            $url=$url."$key=$value&";
        }

        $result = curlGet($url);
        dump($result);

    }

    public function order_fees_receive(){

    }

    /*private function order_credits_pay($idNo, $payment){
        $orderModelMgr = new CZOrderIOSModel();
        if(!$orderModelMgr->checkOrderStatus($idNo)){
            $originalId = $orderModelMgr->getRealId($idNo);
            $type = ConstantUtils::$CREDITS_TYPE_CZ;
            $operation = ConstantUtils::$OPERATION_MINUS;
            $score = $payment * ConstantUtils::$CREDITS_TO_CZ;
            $creditsMgr = new CreditRecordsMgrModel();
            $creditsMgr->generateCZRecord($originalId, $type, $operation, $score);

            $userMgr = new UserMgrModel();
            $userMgr->minusCredits(get_uid(), $score);

            $orderModelMgr->orderHandle($idNo);
            $url = $orderModelMgr->getCallBackUrl($idNo);
            redirect($url);
        }
    }*/

    protected function order_hb_pay($idNo, $payment, $type){
        $orderModelMgr = $this->getOrderModelByControllerName();
        if(!$orderModelMgr->checkOrderStatus($idNo)){
            $userMgr = new UserMgrModel();
            $uId = $orderModelMgr->getCustomerId($idNo);
            $userCoins = $userMgr->getUserCoin($uId);
            if($userCoins < $payment){
                dump("虎币不足");
                exit;
            }

            $coinsMgr = new CoinsRecordMgrModel();
            $oId = $orderModelMgr->getRealId($idNo);
            $coinsNum = $payment;

            $coinsMgr->generateRecord($oId, $coinsNum, $uId, $type);
            $orderModelMgr->orderHandle($idNo);
            $url = $orderModelMgr->getCallBackUrl($idNo);
            redirect($url);
        }
    }

    protected function getOrderModelByControllerName(){
        $orderModelMgr = "";
        switch(CONTROLLER_NAME){
            case "CZOrderIOS":
                $orderModelMgr = new CZOrderIOSModel();
                break;
            case "IOSCZPackageOrder":
                $orderModelMgr = new IOSCZPackageOrderModel();
                break;
            case "PackageOrder":
                $orderModelMgr = new PackageOrderModel();
                break;
            case "RequirementOrder":
                $orderModelMgr = new RequirementOrderMgrModel();
                break;
            case "AccountTradeOrder":
                $orderModelMgr = new AccountTradeOrderMgrModel();
                break;
            case "IOSScOrder":
                $orderModelMgr = new IOSScOrderMgrModel();
                break;
            case "AndroidScOrder":
                $orderModelMgr = new AndroidScOrderMgrModel();
                break;
            case "CoinsCenterOrder":
                $orderModelMgr = new CoinsOrderMgrModel();
                break;
            case "GroupBuyCzOrder":
                $orderModelMgr = new GroupBuyCzOrderMgrModel();
                break;
            case "TrafficOrder":
                $orderModelMgr = new TrafficOrderMgrModel();
                break;

            default:
                $orderModelMgr = "";
                break;
        }

        if($orderModelMgr == ""){
            dump(CONTROLLER_NAME."û�ж�Ӧ��Model");
            exit;
        }

        return $orderModelMgr;
    }

    protected function adminPay($idNo){
        $orderModelMgr = $this->getOrderModelByControllerName();
        if(!$orderModelMgr->checkOrderStatus($idNo)){
            $orderModelMgr->orderHandle($idNo);
        }
        $url = $orderModelMgr->getCallBackUrl($idNo);
        redirect($url);
    }

    public function order_shengpay_mobile_notify(){
        $Name = $_REQUEST["Name"];
        $Version = $_REQUEST["Version"];
        $Charset = $_REQUEST["Charset"];
        $TraceNo = $_REQUEST["TraceNo"];
        $MsgSender = $_REQUEST["MsgSender"];
        $SendTime = $_REQUEST["SendTime"];
        $MerchantNo = $_REQUEST["MerchantNo"];
        $InstCode = $_REQUEST["InstCode"];
        $orderId = $_REQUEST["OrderNo"];
        $OrderAmount = $_REQUEST["OrderAmount"];
        $TransNo = $_REQUEST["TransNo"];
        $TransAmount = $_REQUEST["TransAmount"];
        $TransStatus = $_REQUEST["TransStatus"];
        $TransType = $_REQUEST["TransType"];
        $TransTime = $_REQUEST["TransTime"];
        $ErrorCode = $_REQUEST["ErrorCode"];
        $ErrorMsg = $_REQUEST["ErrorMsg"];
        $Ext1 = $_REQUEST["Ext1"];
        $Ext2 = $_REQUEST["Ext2"];
        $SignType = $_REQUEST["SignType"];
        $SignMsg = $_REQUEST["SignMsg"];

        $signTxt =  $Name.$Version.$Charset.$TraceNo.$MsgSender;
        $signTxt = $signTxt.$SendTime.$InstCode.$orderId.$OrderAmount.$TransNo;
        $signTxt = $signTxt.$TransAmount.$TransStatus.$TransType.$TransTime;
        $signTxt = $signTxt.$MerchantNo.$ErrorCode.$ErrorMsg.$Ext1.$Ext2.$SignType;
        $spConfig = C('shengpay_config');
        $signMd5Msg = md5($signTxt.$spConfig['key']);

        if(isset($SignMsg)&&strcasecmp($SignMsg, $signMd5Msg)===0){
            $orderModelMgr = $this->getOrderModelByControllerName();
            if(!$orderModelMgr->checkOrderStatus($orderId)){
                $orderModelMgr->orderHandle($orderId);
            }
            print("OK");
        }
    }

    public function order_shengpay_mobile_page(){
        $backMsgTxt = $_POST['backMessage'];
        $jsonTxt = json_decode($backMsgTxt);
        $jsonArray = get_object_vars($jsonTxt);
        $payStatus = $jsonArray['transStatus'];
        if($payStatus == ConstantUtils::$PAY_STATUS_SUCCESS){
            $orderId = $jsonArray['orderNo'];
            $orderModelMgr = $this->getOrderModelByControllerName();

            /*if(!$orderModelMgr->checkOrderStatus($orderId)){
                $orderModelMgr->orderHandle($orderId);
            }*/
            $url = $orderModelMgr->getCallBackUrl($orderId);
            redirect($url);
        }
        else  {
            $msg = $jsonArray['msg'];
            echo $msg;
        }
    }

    private function order_shengpay_mobile($type, $oid, $payment){

        /*$curTime = "20150827151111";
        $url = "https://api.shengpay.com/html5-gateway/pay.htm?page=mobile";
        $param = array(
            'serviceCode' =>"B2CPayment",
            'version'     =>"V4.1.1.1.1",
            'charSet'     =>"UTF-8",
            'traceNo'     =>$curTime,
            'senderId'    =>"245888",
            'sendTime'    =>$curTime,
            'orderNo'     =>$curTime,
            'orderAmount' =>"0.01",
            'orderTime'   =>$curTime,
            'pageUrl'     =>"http://localhost:80/smc_html5_demo/index.php",
            'notifyUrl'   =>"http://localhost:80/smc_html5_demo/merchantNotify.php",
            'productName' =>"IPhone 4S",
            'depositId'   =>"",
            'depositIdType'=>"",
            'buyerIp'     =>"127.0.0.1",
            'payType'     =>"",
            'payChannel'  =>"",
            'payerMobileNo' =>"13917519289",
            'payerAuthTicket' =>"",
            'InstCode'    =>"",
            'Ext1'        =>"",
            'signType'    =>"MD5",
            'sessionId'   =>"",
            'tokenId'     =>"",
            'jsCallback'  =>"",
            'backUrl'     =>"http://localhost:80/smc_html5_demo/index.php",
            'merchantMemberId' =>"",
            'signMsg'     =>""
        );
        $signTxt = $param['serviceCode'].$param['version'].$param['charSet'];
        $signTxt = $signTxt.$param['traceNo'].$param['senderId'].$param['sendTime'];
        $signTxt = $signTxt.$param['orderNo'].$param['orderAmount'].$param['ordreTime'];
        $signTxt = $signTxt.$param['pageUrl'].$param['notifyUrl'].$param['productName'];
        $signTxt = $signTxt.$param['depositId'].$param['buyerIp'].$param['depositId'];
        $signTxt = $signTxt.$param['depositIdType'].$param['payerMobileNo'].$param['merchantMemberId'];
        $signTxt = $signTxt.$param['payerAuthTicket'].$param['ext1'].$param['signType'];
        $signTxt = "B2CPaymentV4.1.1.1.1UTF-82015082715111124588820150827151111201508271511110.0120150827151111http://localhost:80/smc_html5_demo/index.phphttp://localhost:80/smc_html5_demo/merchantNotify.phpIPhone 4S127.0.0.113917519289MD5";
        $signMsg = "7df1b38190ef8edb17bfa0fb0df46131";

        $param['signMsg'] = $signMsg;

        autoPost($url, $param);*/

        $baseInfo = C('order_base_info_mobile');
        $spConfig = C('shengpay_config');

        $curTime = date('YmdHis',time());
        $url = "https://api.shengpay.com/html5-gateway/pay.htm?page=mobile";
        $param = array(
            'serviceCode'     =>"B2CPayment",
            'version'         =>"V4.1.1.1.1",
            'charSet'         =>"UTF-8",
            'traceNo'         =>$curTime,
            'senderId'        =>$spConfig['MsgSender'],
            'sendTime'        =>$curTime,
            'orderNo'         =>$oid,
            'orderAmount'     =>$payment,
            'orderTime'       =>$curTime,
            'pageUrl'         =>$baseInfo[$type]['return_url'][ConstantUtils::$PAGE_TYPE_SHENGPAY],
            'notifyUrl'       =>$baseInfo[$type]['notify_url'][ConstantUtils::$PAGE_TYPE_SHENGPAY],
            'productName'     => $baseInfo[$type]['subject'],
            'depositId'       =>"",
            'depositIdType'   =>"",
            'buyerIp'         =>"127.0.0.1",
            'payType'         =>"",
            'payChannel'      =>"",
            'payerMobileNo'   =>"",
            'payerAuthTicket' =>"",
            'InstCode'        =>"",
            'Ext1'            =>"",
            'signType'        =>"MD5",
            'sessionId'       =>"",
            'tokenId'         =>"",
            'jsCallback'      =>"",
            'backUrl'         =>"",
            'merchantMemberId'=>"",
            'signMsg'         =>""
        );

        $signTxt = $param['serviceCode'].$param['version'].$param['charSet'];
        $signTxt = $signTxt.$param['traceNo'].$param['senderId'].$param['sendTime'];
        $signTxt = $signTxt.$param['orderNo'].$param['orderAmount'].$param['orderTime'];
        $signTxt = $signTxt.$param['pageUrl'].$param['notifyUrl'].$param['productName'];
        $signTxt = $signTxt.$param['depositId'].$param['buyerIp'].$param['depositId'];
        $signTxt = $signTxt.$param['depositIdType'].$param['payerMobileNo'].$param['merchantMemberId'];
        $signTxt = $signTxt.$param['payerAuthTicket'].$param['ext1'].$param['signType'];
        $signMsg = md5($signTxt.$spConfig['key']);
        $param['signMsg'] = $signMsg;
        autoPost($url, $param);
    }

    protected function pay($payway, $type, $idNo, $payment){
        if(isInFreePayGroup(get_uid())){
            return $this->adminPay($idNo);
        }
        $orderModelMgr = $this->getOrderModelByControllerName();
        if($orderModelMgr->checkOrderStatus($idNo)){
            $url = $orderModelMgr->getCallBackUrl($idNo);
            redirect($url);
        }

        $pos = strpos($payway, "shengpay");
        if($pos !== false){
            $offset = strlen("shengpay");
            $bankNo = substr($payway, $pos + $offset);
            $payway = "shengpay";
        }
        switch($payway){
            case "alipay":
                return $this->order_alipay($type, $idNo, $payment);

            case "mobile_alipay":
                return $this->order_alipay_mobile($type, $idNo, $payment);

            case "shengpay":
                return $this->order_shengpay($bankNo, $type, $idNo, $payment);

            case "sp_mobile":
                return $this->order_shengpay_mobile($type, $idNo, $payment);

            case "mp_banlance":
                return $this->order_mpbalance_pay($type, $idNo, $payment);

            case "mobile_wx":
                return $this->order_wx_pay($type, $idNo, $payment);

            case "wx":
                return $this->order_wx_pay($type, $idNo, $payment);

            case "vcoins":
                return $this->order_vcoins_pay($type, $idNo, $payment);

            case "fees":
                return $this->order_fees_pay($type, $idNo, $payment);

            case "credits":
                return $this->order_credits_pay($idNo, $payment);

            case "hb":
                return $this->order_hb_pay($idNo, $payment);

            case "mobile_hb":
                return $this->order_hb_pay($idNo, $payment);

            default:
                break;
        }
    }

    private function orderHandleImp(){
        //TODO:��������ʵ��
    }

    public function review_order($orderId){
        if(IS_AJAX){
            $data = array('status'=>true, 'url'=>"");
            $modelMgr = $this->getOrderModelByControllerName();
            if($modelMgr->orderIsPaid($orderId)){
                $data['url'] =  $modelMgr->getCallBackUrl($modelMgr->getIdNoByOid($orderId));
            }
            $this->ajaxReturn($data);
        }
    }

    abstract public function customer_paid_finish($orderId);
    abstract public function paid_finish($orderId);
} 