<?php


namespace Home\Controller;


use Home\Model\SEOMgrModel;
use Utils\ConstantUtils;

class DetectorController extends AuthController{
    protected $theme = "";

    public function _initialize(){
        parent::_initialize();
        $this->theme = "";
        $mobile = isMobile();
        if ($mobile || __APP__ === ConstantUtils::$MOBILE_DOMAIN) {
            $this->theme = "mb";
        }
    }

    protected function display($templateFile='',$seoInfo='') {
        if(!$seoInfo){
            $seoMgr = new SEOMgrModel();
            $seoInfo = $seoMgr->getSEOInfo(CONTROLLER_NAME.'/'.ACTION_NAME);
        }//if
        $this->assign(ConstantUtils::$SEO_TITLE_KEY, $seoInfo[ConstantUtils::$SEO_TITLE_KEY]);
        $this->assign(ConstantUtils::$SEO_KEYWORD_KEY, $seoInfo[ConstantUtils::$SEO_KEYWORD_KEY]);
        $this->assign(ConstantUtils::$SEO_DESC_KEY, $seoInfo[ConstantUtils::$SEO_DESC_KEY]);

        parent::display($templateFile);
    }

} 