<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-25
 * Time: 下午2:53
 */
namespace Utils;


class CharUtils {

    public function __construct(){
        for($i=ord("A");$i <= ord("Z");$i++){
            echo chr($i)."<br />";
        }

    }
}