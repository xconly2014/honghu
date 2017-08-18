<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/11/18
 * Time: 15:55
 */

namespace Home\Model;


class SEOMgrModel extends DataMgrBaseModel
{
    private $tableName = 'seo';

    public function getSEOInfo($url){
        $sql = "select html_title as seo_title, html_keyword as seo_keyword, html_description as seo_description from $this->tableName where url='$url'";
        $result = $this->query($sql);
        return $result[0];
    }
}