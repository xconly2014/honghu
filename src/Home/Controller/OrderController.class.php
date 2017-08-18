<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-23
 * Time: 上午9:50
 */

namespace Home\Controller;


use Think\Controller;

class OrderController extends Controller{

    public function _initialize() {
        vendor('Alipay.Corefunction');
        vendor('Alipay.Md5function');
        vendor('Alipay.Notify');
        vendor('Alipay.Submit');

        vendor('Yeepay.Corefunction');
    }

    public function generateOrder($type, $orderData){
        switch($type){
            case ORDER_TYPE_CZ:
                break;
            case ORDER_TYPE_SC:
                break;
            case ORDER_TYPE_REQUIREMENT:
                break;
            case ORDER_TYPE_PACKAGE:
                break;
            case ORDER_TYPE_ACCOUNT:
                break;
        }
    }

    public function notify_url(){
        $alipay_config = C('alipay_config');
        dump($alipay_config);
        $this->show("错误");
    }

    public function doPay(){

        $str = "轰轰虎充值";
        $payment_type = "1";
        $notify_url = "http://honghonghu.com/Home/Order/notify_url.html";
        $return_url = "http://honghonghu.com/Home/Order/return_url.php";
        $out_trade_no = "12536986315";
        $subject = mb_convert_encoding($str, "GBK", "UTF8");

        $total_fee = 25;
        $body = "";
        $show_url = "";
        $anti_phishing_key = "";
        $exter_invoke_ip = "";

        $alipay_config = C('alipay_config');

        $parameter = array(
            "service" => "create_direct_pay_by_user",
            "partner" => trim($alipay_config['partner']),
            "seller_email" => trim($alipay_config['seller_email']),
            "payment_type"	=> $payment_type,
            "notify_url"	=> $notify_url,
            "return_url"	=> $return_url,
            "out_trade_no"	=> $out_trade_no,
            "subject"	=> $subject,
            "total_fee"	=> $total_fee,
            "body"	=> $body,
            "show_url"	=> $show_url,
            "anti_phishing_key"	=> $anti_phishing_key,
            "exter_invoke_ip"	=> $exter_invoke_ip,
            "_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
        );

        //建立请求
        $alipaySubmit = new \AlipaySubmit($alipay_config);
        $html_text = $alipaySubmit->buildRequestForm($parameter,"get", "确认");
        echo $html_text;


        //return $this->display('yeepay_english');
       // return $this->display('yeepay_chinese');
       // return $this->display('yeepay_test');
/*
        $yeePay_config = C('yeepay_config');

        $p2_Order					= "97831";
        $p3_Amt						= 0.01;
        $p4_Cur						= "CNY";
        $str						= "kdfdf";

        $p5_Pid                     = "productname";    //mb_convert_encoding(urldecode(urlencode($str)), "GBK", "UTF8");
        $p6_Pcat					= "producttype";
        $p7_Pdesc					= "productdesc";
        $p8_Url						= "http://localhost/HTMLcommon/callback.php";
        $p9_SAF                     = "0";
        $pa_MP						= "userId or other";
        $pd_FrpId					= "";
        $pr_NeedResponse	        = "1";
        $hmac = getReqHmacString($p2_Order,$p3_Amt,$p4_Cur,$p5_Pid,$p6_Pcat,$p7_Pdesc,$p8_Url, $pa_MP,$pd_FrpId,$pr_NeedResponse);

        $parameter = array(
            'p0_Cmd'=>"Buy",
            'p1_MerId' => $yeePay_config['p1_MerId'],
            'p2_Order'=> $p2_Order,
            '$p3_Amt'=> $p3_Amt,
            'p4_Cur' => $p4_Cur,
            'p5_Pid' => $p5_Pid,
            'p6_Pcat'=> $p6_Pcat,
            'p7_Pdesc' => $p7_Pdesc,
            'p8_Url' => $p8_Url,
            'p9_SAF' => $p9_SAF,
            'pa_MP'=> $pa_MP,
            'pd_FrpId' => $pd_FrpId,
            'pr_NeedResponse'=> $pr_NeedResponse,
            'hmac'=> $hmac
        );

        $sHtml = '<html><head><title>To YeePay Page</title></head><body onLoad="document.yeepay.submit();">';
        $sHtml = $sHtml."<form id='yeepay' name='yeepay' action='".$yeePay_config['reqURL']."' method='post'>";
		while (list ($key, $val) = each ($parameter)) {
            $sHtml.= "<input name='".$key."' value='".$val."'/>";
        }

		//submit按钮控件请不要含有name属性
        $sHtml = $sHtml."</form></body></html>";
        echo $sHtml;
*/
    }

} 