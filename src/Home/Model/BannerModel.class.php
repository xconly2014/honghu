<?php

namespace Home\Model;


class BannerModel extends DataMgrBaseModel{
    private $tableName = "banner";

    public function getList(){
        $sql = "select id, href, img, title from $this->tableName order by priority desc";
        return $this->query($sql);
    }

}