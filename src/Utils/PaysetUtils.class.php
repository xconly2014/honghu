<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-14
 * Time: 上午11:34
 */

namespace Utils;


class PaysetUtils {
    private $paySet = null;

    public function __construct(){
        $this->paySet = array('alipay'    => array('way'=>'alipay',
                                                   'callback'=>'',
                                                   'str'=> '支付宝'),
                              'yeepay'    => array('way'=>'yeepay',
                                                   'callback'=>'',
                                                   'str'=> '易宝支付'),
                              'mpbalance' => array('way'=> 'mpbalance',
                                                   'callback'=>'',
                                                   'str'=>'话费卡支付'),
                              'credits'   => array('way'=>'credits',
                                                   'callback'=>'',
                                                   'str' => '积分兑换')
                              );

    }

    public function getPaySet(){
        return $this->paySet;
    }

    public function parsePayway($payway){
        return $this->paySet[$payway]['way'];
    }
} 