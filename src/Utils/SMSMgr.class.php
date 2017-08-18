<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-1-28
 * Time: 下午4:02
 */

namespace Utils;


class SMSMgr {
    function _post($curlPost,$url){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_NOBODY, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
        $return_str = curl_exec($curl);
        curl_close($curl);
        return $return_str;
    }
    function _xml_to_array($xml){
        $reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
        if(preg_match_all($reg, $xml, $matches)){
            $count = count($matches[0]);
            for($i = 0; $i < $count; $i++){
                $subxml= $matches[2][$i];
                $key = $matches[1][$i];
                if(preg_match( $reg, $subxml )){
                    $arr[$key] = $this->_xml_to_array( $subxml );
                }else{
                    $arr[$key] = $subxml;
                }
            }
        }
        return $arr;
    }

    public  function sendMsg($mobile, $type, $code){

        $target = C('sms_url');

        if(empty($code)){
            return array('status'=> false, 'msg'=>'验证码不能为空');
        }

        if(empty($type)){
            return array('status'=> false, 'msg'=>'短信类型不能为空');
        }

        if(empty($mobile)){
            return array('status'=> false, 'msg'=>'手机号码不能为空');
        }

        $msgKey = ConstantUtils::$CZ_ORDER_STATE_MSG_KEY[$type];
        $account = C('sms_account');
        $password = C('sms_password');
        $msgContent = ConstantUtils::$MSG_TXT[$msgKey];

        $base_data = "account=".$account."&password=".$password."&mobile=".$mobile."&content=";

        $post_data = $base_data.rawurlencode($msgContent);
        $gets =  $this->_xml_to_array($this->_post($post_data, $target));

        if($gets['SubmitResult']['code'] != 2){
            return array('status'=> false, 'msg'=>"短信发送失败：".$gets['SubmitResult']['msg']);
        }
        return array('status'=>true,
                     'msg'=>"");
    }

} 