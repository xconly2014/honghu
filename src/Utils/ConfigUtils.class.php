<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-4-1
 * Time: 上午11:03
 */

namespace Utils;


class ConfigUtils {
    private $auth_key = "HIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@#$%^&*";

    public function set($key, $value){
        //TODO:对$value进行加密处理
        C($key, $value);
    }

} 