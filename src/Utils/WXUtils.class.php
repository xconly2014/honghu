<?php


namespace Utils;


class WXUtils {

    public function getLoginUrl(){
        $info = C('third_party_login.wx_login');
        $baseUrl = $info['login_base_url'];

        $param  = array(
            'appid'=>$info['appid'],
            'redirect_uri'=>"http://honghonghu.com".U('Home/Login/wx_login_back'),
            'response_type'=> 'code',
            'scope'=>$info['login_scope'],
            'state'=>$info['state']
        );
        $url = $baseUrl.http_build_query($param)."#wechat_redirect";
        return $url;
    }

    public function getTokenOpenId($code){
        $info = C('third_party_login.wx_login');
        $accessTokenUrl = $info['access_token_url'];

        $param  = array(
            'appid'=>$info['appid'],
            'secret'=>$info['secret'],
            'code'=>$code,
            'grant_type'=>$info['grant_type']
        );

        $url = $accessTokenUrl.http_build_query($param);

        $result = $this->curlGet($url);
        $arrResult = json_decode(trim($result,chr(239).chr(187).chr(191)), true);

        return is_array($arrResult)? array('token'=>$arrResult['access_token'],'openid'=>$arrResult['openid']):"";
    }

    private function getUserInfoImp($token, $openId){
        $info = C('third_party_login.wx_login');
        $baseUrl = $info['user_info_url'];
        $param = array(
            'access_token' => $token,
            'openid'       => $openId
        );
        $url = $baseUrl.http_build_query($param);
        $info = $this->curlGet($url);
        $arrInfo = json_decode(trim($info,chr(239).chr(187).chr(191)), true);
        return is_array($arrInfo)? $arrInfo['nickname']:"";
    }


    private function curlGet($url){
        $ch = curl_init();
        $timeout = 5;
        curl_setopt ($ch, CURLOPT_URL, $url);
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        $file_contents = curl_exec($ch);
        curl_close($ch);
        return $file_contents;
    }

    public function getUserInfo($code){
        $result = $this->getTokenOpenId($code);
        if(!$result){
            return array(
                'status'=>false,
                'data'=>"",
                'msg' =>"获取accessToken失败");
        }
        $userName = $this->getUserInfoImp($result['token'], $result['openid']);
        if(!$userName){
            return array(
                'status'=>false,
                'data'=>"",
                'msg' => "获取用户昵称失败");
        }
        return array(
            'status'=>true,
            'data'=>$userName,
            'msg' => "");
    }

} 