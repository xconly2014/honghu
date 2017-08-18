<?php

class Shengpay{
    private $payHost;
    private $debug=false;
    private $key='';
    private $params=array(
        'Name'=>'B2CPayment',
        'Version'=>'V4.1.1.1.1',
        'Charset'=>'UTF-8',
        'MsgSender'=> '',
        'SendTime'=>'',
        'OrderNo'=>'',
        'OrderAmount'=>'',
        'OrderTime'=>'',
        'PayType'=>'PT001',
        'PayChannel'=>'19', /*（19 储蓄卡，20 信用卡）做直连时，储蓄卡和信用卡需要分开*/
        'InstCode'=>'CMB',  /*银行编码，参看接口文档*/
        'PageUrl'=>'',
        'NotifyUrl'=>'',
        'ProductName'=>'',
        'BuyerContact'=>'',
        'BuyerIp'=>'',
        'Ext1'=>'',
        'Ext2'=>'',
        'SignType'=>'MD5',
        'SignMsg'=>'',
    );

    function init($array=array()){
        if($this->debug)
            $this->payHost='https://mer.mas.sdo.com/web-acquire-channel/cashier.htm';
        else
            $this->payHost='https://mas.sdo.com/web-acquire-channel/cashier.htm';
        foreach($array as $key=>$value){
            $this->params[$key]=$value;
        }
    }


    function updatePayHost(){
        $this->payHost='https://cardpay.shengpay.com/web-acquire-channel/cashier.htm';
    }

    function setKey($key){
        $this->key=$key;
    }
    function setParam($key,$value){
        $this->params[$key]=$value;
    }

    function takeOrder($oid,$fee, $payChannel=false){
        $spConfig = C('shengpay_config');
        $this->key = $spConfig['key'];
        $this->params['MsgSender'] = $spConfig['MsgSender'];
        $this->params['OrderNo']=$oid;
        $this->params['OrderAmount']=$fee;
        $origin='';

        foreach($this->params as $key=>$value){
            if(!$payChannel){
                if($key == "PayChannel")
                    continue;
            }
            if(!empty($value))
                $origin.=$value;
        }
        $SignMsg=strtoupper(md5($origin.$this->key));
        $this->params['SignMsg']=$SignMsg;
        echo '<meta http-equiv = "content-Type" content = "text/html; charset = '.$this->params['Charset'].'"/>
			<form  method="post" action="'.$this->payHost.'">';
        foreach($this->params as $key=>$value){
            if(!$payChannel){
                if($key == "PayChannel")
                    continue;
            }
            echo '<input type="hidden" name="'.$key.'" value="'.$value.'"/>';
        }
        echo '<input type="submit" name="submit" value="请求付款中" id="dh">
				<script>var a=document.getElementById("dh");a.click();</script>
			</form>';
    }

    function returnSign(){
        $params=array(
            'Name'=>'',
            'Version'=>'',
            'Charset'=>'',
            'TraceNo'=>'',
            'MsgSender'=>'',
            'SendTime'=>'',
            'InstCode'=>'',
            'OrderNo'=>'',
            'OrderAmount'=>'',
            'TransNo'=>'',
            'TransAmount'=>'',
            'TransStatus'=>'',
            'TransType'=>'',
            'TransTime'=>'',
            'MerchantNo'=>'',
            'ErrorCode'=>'',
            'ErrorMsg'=>'',
            'Ext1'=>'',
            'Ext2'=>'',
            'SignType'=>'MD5',
        );
        foreach($_POST as $key=>$value){
            if(isset($params[$key])){
                $params[$key]=$value;
            }
        }
        $TransStatus=(int)$_POST['TransStatus'];
        $origin='';
        foreach($params as $key=>$value){
            if(!empty($value))
                $origin.=$value;
        }
        $SignMsg=strtoupper(md5($origin.$this->key));
        if($SignMsg==$_POST['SignMsg'] and $TransStatus==1){
            return true;
        }else{
            return false;
        }
    }

}