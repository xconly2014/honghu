<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-11
 * Time: 上午11:58
 */

namespace Utils;


class VerifyUtil {
    function validate(){
        $config = array('fontSize'  => 30,
            'length'   =>4,
            'useNoise' => false,
        );
        $Verify = new \Think\Verify($config);
        $Verify->codeSet = 'abcdefghjkmnopqrstvwxyzABCDEFGHJKMNOPQRSTVWXYZ123456789';
        $Verify->entry();
    }

    function check($code){
        $Verify = new \Think\Verify();
        return $Verify->check($code);
    }
} 