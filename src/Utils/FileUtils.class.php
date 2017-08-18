<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-3-10
 * Time: 下午12:03
 */

namespace Utils;


class FileUtils {
    private $uploadObj;
    public function __construct($config){
        $this->uploadObj = new \Think\Upload($config);// 实例化上传类
    }

    // 上传文件
    public function upload(){
        $info   =   $this->uploadObj->upload();
        if(empty($info)) {// 上传错误提示错误信息
            return array('status'=>1,
                         'msg'=> $this->uploadObj->getError(),
                         'data'=> "");
        }else{// 上传成功
            return array('status'=>0,
                         'msg'=>'上传成功',
                         'data'=> $info['photo']['savename']);
        }
    }
    
    
    
    public function formatPicData(){
    	$img = $_FILES;
    	$imgs = array();
    	$imgs['photo'] =array(
    			'name' => $img['photo']['name'][0],
    			'type' => $img['photo']['type'][0],
    			'tmp_name' => $img['photo']['tmp_name'][0],
    			'error' => $img['photo']['error'][0],
    			'size'=> $img['photo']['size'][0],
    	);
    	$_FILES = $imgs;
    }
} 