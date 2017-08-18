<?php
namespace Utils;
class ConstantUtils
{
    public static $USER_LOGIN_KEY = 'cur_user_id';

    public static $DEFAULT_HEAD_IMAGE = '/img/header.png';
    public static $DEFAULT_THUMB_HEAD_IMAGE = '/img/thumbheader.png';

    public static $USER_LEVEL_STRING = array('0' => "普通会员",
        '1' => "铜牌会员");

    public static $GAME_GOOD_TYPE_SC = 1;
    public static $GAME_GOOD_TYPE_ACCOUNT = 2;
    public static $GAME_GOOD_TYPE_PACKAGE = 3;
    public static $GAME_GOOD_TYPE_REQUIREMENT = 4;
    public static $GAME_GOOD_TYPE_SC_STRING = "首充号";
    public static $GAME_GOOD_TYPE_ACCOUNT_STRING = "成品号";
    public static $GAME_GOOD_TYPE_PACKAGE_STRING = "套餐";
    public static $GAME_GOOD_TYPE_REQUIREMENT_STRING = "需求";


    //　套餐状态
    public static $PACKAGE_UNPAID = 0;//未付款(active=0)
    public static $PACKAGE_UNCHECK = 1;//未审核(active=0)
    public static $PACKAGE_UNPASS = 2;//未通过(active=0)
    public static $PACKAGE_PASS = 3;//通过(active=1)
    public static $PACKAGE_SOLD_OUT = 4;//已被购买(active=0)
    public static $PACKAGE_TRAINING = 5;//代练中(active=0)
    public static $PACKAGE_FINISH = 6;//完成(active=0)
    public static $PACKAGE_STATE_TEXT = array(
        '0' => "未付款",
        '1' => "未审核",
        '2' => "未通过",
        '3' => "出售中",
        '4' => "已被购买",
        '5' => "代练中",
        '6' => "已完成"
    );
    public static $PACKAGE_UNACTIVE = 0;//不可用
    public static $PACKAGE_ACTIVE = 1;//可用

    //需求状态
    public static $REQUIREMENT_INFO_UNCOMPLETED = 0;//未完整(active = 0)
    public static $REQUIREMENT_UNPAID = 1;//未付款(active = 0)
    public static $REQUIREMENT_SOLDING = 2;//销售中(active = 1)
    public static $REQUIREMENT_SOLD_OUT = 3;//已售出（active=0）
    public static $REQUIREMENT_TRAINING = 4;//代练中(active = 0)
    public static $REQUIREMENT_FINISH = 5;//完成(active = 0)
    public static $REQUIREMENT_STATE_TEXT = array(
        '0' => "信息未完整",
        '1' => "未付款",
        '2' => "销售中",
        '3' => "已售出",
        '4' => "代练中",
        '5' => "已完成"
    );
    public static $REQUIREMENT_UNACTIVE = 0;//不可用
    public static $REQUIREMENT_ACTIVE = 1;//可用
    public static $REQUIREMENT_STATE_MAP = array(
        'receive' => 1,
        'verify_requirement' => 2,
    );

    //账号交易状态
    public static $ACCOUT_TRADE_UNPAID = 0;//未付款（active=0）
    public static $ACCOUNT_TRADE_SOLDING = 1;//销售中(active=1)
    public static $ACCOUNT_TRADE_SOLD_OUT = 2;//已售出（active=0）
    public static $ACCOUNT_TRADE_FINISH = 3;//交易完成（active=0）

    public static $ACCOUNT_TRADE_STATE_TEXT = array(
        '0' => "未付款",
        '1' => "销售中",
        '2' => "已售出",
    );
    public static $ACCOUNT_TRADE_UNACTIVE = 0;//不可用
    public static $ACCOUNT_TRADE_ACTIVE = 1;//可用

    public static $PLATFORM_BOTH = "0";
    public static $PLATFORM_IOS = "1";
    public static $PLATFORM_ANDROID = "2";
    public static $PLATFORM_ALL = "3";

    public static $PLATFORM_IOS_STRING = "苹果系统";
    public static $PLATFORM_ANDROID_STRING = "安卓系统";
    public static $PLATFORM_ALL_STRING = "苹果/安卓系统";

    /*－－－－－　交易中心　－－－－－*/
    public static $PARAM_CATEGORY = array(
        'platform' => '商品平台',
        'price' => '商品价格',
        'type' => '商品类型',
        'gameId' => '游戏名称',
    );

    public static $PLATFORM_MAP = array(
        'platform=1' => '苹果系统',
        'platform=2' => '安卓系统'
    );
    public static $PLATFORM_STRING = array(
        '1' => '苹果系统',
        '2' => '安卓系统',
        '3' => '苹果/安卓系统'
    );
    public static $PLATFORM_WHERE_CONDITION = array(
        '1' => 'platform = 1 or platform = 3',
        '2' => 'platform = 2 or platform = 3',
    );

    public static $PRICE_MAP = array(
        'price=0-100' => '0-100元',
        'price=101-200' => '101-200元',
        'price=201-300' => '201-300元',
        'price=301-400' => '301-400元',
        'price=401-500' => '401-500元',
        'price=600' => '600或以上',
    );
    public static $PRICE_STRING = array(
        '0-100' => '0-100元',
        '101-200' => '101-200元',
        '201-300' => '201-3000元',
        '301-400' => '301-400元',
        '401-500' => '401-500元',
        '600' => '600或以上',
    );

    public static $PRICE_WHERE_CONDITION = array(
        '0-100' => 'price between 0 and 100',
        '101-200' => 'price between 101 and 200',
        '201-300' => 'price between 201 and 300',
        '301-400' => 'price between 301 and 400',
        '401-500' => 'price between 401 and 500',
        '600' => 'price > 600',
    );

    public static $TYPE_MAP = array(
        /*'/type/1'=>'首充号',*/
        'type=2' => '成品号',
        'type=3' => "代练套餐",
        'type=4' => "代练需求"
    );

    public static $TYPE_MAP_MOBILE = array(
        'type=3' => "代练套餐",
        'type=4' => "代练需求"
    );
    public static $TYPE_STRING = array(
        /*'1' => "首充号",*/
        '2' => "成品号",
        '3' => "代练套餐",
        '4' => "代练需求"
    );

    public static $TYPE_HREF = array(
        /*'1' => "首充号",*/
        '2' => array("发布账号", "Home/AccountTrade/publish"),
        '3' => array("发布套餐", "Home/Package/publish"),
        '4' => array("发布需求", "Home/Requirement/publish")
    );
    /*　－－－－－　交易中心　－－－－－－*/
    /*　套餐与需求*/
    public static $ORDER_TYPE_DEPOSIT_PLAYER = 1;
    public static $ORDER_TYPE_DEPOSIT_TRAINER = 2;
    public static $ORDER_TYPE_TRADE = 3;

    public static $CASH_ORDER_PLAYER = "cash_order_player";
    public static $CASH_ORDER_TRAINER = "cash_order_trainer";
    public static $CASH_ORDER_SELLER = "cash_order_seller";
    public static $CASH_ORDER_BUYER = "cash_order_buyer";

    public static $ORDER_STATE_UNPAID = 0;
    public static $ORDER_STATE_PAID = 1;

    public static $GAME_GOOD_TYPE_STRING = array(
        '1' => "首充号",
        '2' => "成品号",
        '3' => "代练套餐",
        '4' => "代练需求"
    );


    /*
     * 充值订单状态
     *
     * 产生　-->  付款　--> 处理　--> 完成
     * 　0　 -->  1   -->  2   -->  3　
     */
    public static $CZ_ORDER_STATE_INIT = 0;
    public static $CZ_ORDER_STATE_IS_PAID = 1;
    public static $CZ_ORDER_STATE_DOING = 2;
    public static $CZ_ORDER_STATE_FINISH = 3;
    public static $CZ_ORDER_STATE_ERROR = 4;
    public static $CZ_ORDER_STATE_BACK = 5;
    public static $CZ_ORDER_STATE_FAILED = 6;
    public static $CZ_ORDER_STATE_ACCOUNT_EXCEPTION = 7;

    public static $CZ_ORDER_STATE_MSG_KEY = array(
        '0' => "unpaid",
        '1' => "wait",
        '2' => "doing",
        '3' => "finish",
        '4' => "error",
        '5' => "back",
        '6' => "failed",
        '7' => "exception"
    );

    public static $MSG_TXT = array(
        'unpaid'=>"",
        'wait'=>"",
        "doing"=>"您好，您的充值订单正在处理中，请不要登陆游戏，可能会造成游戏币不到账，游戏异常等问题，感谢您的配合，请稍等",
        'finish'=>"节日快乐，您的充值已成功到账，请登录验收，可添加微信公众号查询订单状态，节日活动现已开启，详情关注轰轰虎官网！",
        "back"=>"您好，您的订单已退款，退款金额将在3个工作日之内到账，有问题随时咨询4008062400，继续支持轰轰虎哦！",
        'error'=>"尊敬的用户，您的充值订单信息填写有误，请登录个人中心点击“修改订单”核对正确后提交",
        'failed'=>"尊敬的用户，您的订单充值失败，请联系轰轰虎客服解决，联系方式详情见轰轰虎官网",
        'exception'=>"关于您充值的腾讯游戏涉及异地登陆导致QQ暂时被腾讯保护，您只需登陆手机的QQ安全中心或者https://aq.qq.com解除您的账号保护并在轰轰虎个人中心点击“修改订单”把新的密码提交即可成功充值"
    );

    public static $CZ_ORDER_STATE = array(
        '0' => "未付款",
        '1' => "待处理",
        '2' => "处理中",
        '3' => "已完成",
        '5' => "退款",
        '6' => "处理失败",
        '4' => "账号密码错误",
        '7'=> "账号异常"
    );

    public static $ORDER_BG_COLOR_FINISH = "#a1a1a1";
    public static $ORDER_BG_COLOR_UNFINISH = "#fff";
    
    public static $CZ_PACKAGE_ORDER_STATE_INIT = 0;
    public static $CZ_PACKAGE_ORDER_STATE_IS_PAID = 1;
    public static $CZ_PACKAGE_ORDER_STATE_DOING = 2;
    public static $CZ_PACKAGE_ORDER_STATE_FINISH = 3;
    public static $CZ_PACKAGE_ORDER_STATE_ERROR = 4;
    public static $CZ_PACKAGE_ORDER_STATE_BACK = 5;
    public static $CZ_PACKAGE_ORDER_STATE_CHANGE = 6;
    
    public static $CZ_PACKAGE_ORDER_STATE = array(
            '0' => "未付款",
            '1' => "待处理",
            '2' => "处理中",
            '3' => "已完成",
            '4' => "账号密码错误",
            '5' => "退款完成",
            '6' => "转为充值订单"
    );

    //请修改链接
    //TODO:请修改链接
    public static $CZ_ORDER_OPEARTION = array(
        '0' => array('去付款' => "CZIOS/chongzhi_verify"),
        '1' => array('再充一次' => "Home/CZIOS/chongzhi_again"),
        '2' => array('再充一次' => "Home/CZIOS/chongzhi_again"),
        '3' => array('再充一次' => "Home/CZIOS/chongzhi_again"),
        '4' => array('修改订单' => "Home/CZIOS/chongzhi_modify"),
        '7' => array('修改订单' => "Home/CZIOS/chongzhi_modify")
    );

    /*
     *
     */

    public static $ID_NONE = 0;


    /*  积分相关　*/
    public static $CREDITS_TYPE_CZ = 1;
    public static $CREDITS_TYPE_MOBILE_BIND = 2;
    public static $CREDITS_TYPE_CREDITS_EXCHANGE = 3;
    public static $CREDITS_TYPE_SIGN_DAY = 4;
    public static $CREDITS_TYPE_BUY_GIFT = 5;
    public static $CREDITS_TYPE_GET_REWARD_TWO = 6;
    public static $CREDITS_TYPE_GET_REWARD_HUNDRED = 7;
    public static $CREDITS_TYPE_GET_REWARD_THOUSAND = 8;
    public static $CREDITS_RECOMMAND_CZ = 9;
    public static $CREDITS_SEND = 10;
    public static $CREDITS_TYPE_GET_REWARD_FIFTY = 11;
    public static $CREDITS_TYPE_GET_REWARD_TWO_HUNDRED = 12;
    public static $CREDITS_TYPE_CLICK_COPPER_EGGS = 13;
    public static $CREDITS_TYPE_CLICK_SILVER_EGGS = 14;
    public static $CREDITS_TYPE_CLICK_GOLD_EGGS = 15;
    public static $CREDITS_TYPE_GET_SPRING_COUPLETS = 16;
    public static $CREDITS_TYPE_GOODS_EXCHANGE = 17;

    public static $CREDIT_TYPE_TEXT = array(
        "1" => '充值',
        "2" => '绑定手机',
        "3" => '积分兑换',
        "4" => '签到',
        "5" => '抽奖兑换',
        "6" => '抽奖奖品',
        "7" => '抽奖奖品',
        "8" => '抽奖奖品',
        "9" => '推荐充值',
        "10" => '轰轰虎赠送',
        "11" => '抽奖奖品',
        "12" => '抽奖奖品',
        "13" => '砸铜蛋兑换',
        "14" => '砸银蛋兑换',
        "15" => '砸金蛋兑换',
        "16" => '凑对联兑换',
        "17" => '商品兑换'
    );

    //分值
    public static $CREDITS_SCORE_SIGN_DAY = 10;
    public static $CREDITS_TO_CZ = 100;


    //操作
    public static $OPERATION_ADD = '+';
    public static $OPERATION_MINUS = '-';


    public static $USER_IDENTIFY_SYSTEM = 0;
    public static $UPLOAD_PATH_REQUIREMENT = "requirement";
    public static $UPLOAD_PATH_PACKAGE = "package";
    public static $UPLOAD_PATH_ACCOUNT_TRADE = "account_trade";
    public static $UPOLAD_PATH_USER_ACCOUNT_SRC = 'user_account/src';
    public static $UPOLAD_PATH_USER_ACCOUNT_DEST = 'user_account/dest';
    /*
     * 用户找回密码
    * 邮箱验证码或者手机验证码是否验证过
    * yes = 验证过
    * no = 还没验证过
    */
    public static $IS_AUTH = array(
        'yes' => 1,
        'no' => 0
    );

    /*个人中心-->我买的宝贝*/
    public static $IS_PAY = array(
        'yes' => 1,
        'no' => 0
    );
    public static $ACCOUNT_TRADE_ORDER_TYPE = array(
        'SELLER' => 1,
        'BUYER' => 2,
        'TRADE' => 3
    );
    public static $UNACTIVE = 0;
    public static $ACTIVE = 1;

    //订单类型    
    public static $ORDER_TYPE_STRING = array(
        'TYPE_GOODS' => '兑换商品',
        'TYPE_CZPACKAGE' => '充值套餐'
    );

    //未扣除积分
    public static $CREDIT_RECORD_NON_ID = 0;

    //GOODS状态
    public static $GOODS_ORDER_STATE_INIT = 0;
    public static $GOODS_ORDER_STATE_IS_PAID = 1;
    public static $GOODS_ORDER_STATE_DOING = 2;
    public static $GOODS_ORDER_STATE_FINISH = 3;

    public static $GOODS_ORDER_STATE = array(
        '0' => "未付款",
        '1' => "新订单",
        '2' => "处理中",
        '3' => "已完成",
    );

    /*
     * 虎币
     */
    public static $COINS_PAY_WAY = array('m_card', 'm_fees');
    public static $PAYMENT_TO_COINS = 1;
    public static $FEES_TO_COINS = 0.4;
    public static $CARD_TO_COINS = 0.95;
    public static $GAME_CARD_TO_COINS = 0.8;
    public static $COINS_TYPE_TEXT = array(
        'm_fees' => 0,
        'm_card' => 1
    );
    public static $COINS_TYPES_TEXT = array(
        '0' => "话费购买",
        '1' => "话费卡购买",
        '2' => "充值支付"
    );
    public static $COINS_BUY_WAY_CZ = 2;

    //
    public static $PAGE_TYPE_ALIPAY = 0;
    public static $PAGE_TYPE_SHENGPAY = 1;
    public static $PAGE_TYPE_WX = 2;
    public static $PAGE_TYPE_MPBALANCE = 3;
    public static $PAGE_TYPE_GAMECARD = 4;
    public static $PAGE_TYPE_VCOINS = -1;
    public static $PAGE_TYPE_FEES = -1;

    public static $TASK_CZ_ORDER = "0";
    public static $TASK_MSG_CODE = "1";
    public static $TASK_EMAIL_CODE = "2";
    public static $TASK_TRAFFIC_SERVICE = "3";
    public static $TASK_GROUP_BUY_CZ_FINISH = "4";
    public static $TASK_IOS_CZ_PACKAGE = "5";
    public static $TASK_GENERATE_QUEUE = "6";
    public static $TASK_DISTRIBUTE_TICKET = "7";
    public static $TASK_SCH_EMAIL = "8";
    public static $TASK_GROUP_BUY_CZ_TIMING = "9";
    public static $TASK_GROUP_BUY_CZ_CONFIRM = "10";

    //短信类型
    public static $MSG_TYPE_REGISTER = "1";//手机注册
    public static $MSG_TYPE_FORGET_PWD = "2";// 忘记密码，手机找回
    public static $MSG_TYPE_PWD_MODIFY = "3";// 密码修改
    public static $MSG_TYPE_MOBILE_BIND = "4";// 手机绑定
    public static $MSG_TYPE_CZ_ORDER_ERROR = "5";//账号密码错误
    public static $MSG_TYPE_CZ_SUCCESS = "6";//成功
    public static $MSG_TYPE_CZ_FAILED = "7";//订单错误
    public static $MSG_TYPE_SECURITY_EMAIL_AUTH = "8";//手机用户验证邮箱
    public static $MSG_TYPE_SECURITY_PWD_SET = "9";//手机用户设置密保问题


    //上传图片
    public static $IMG_TYPE_HEAD = "headImg";


    public static $DEFAULT_ARTICLE_ID = 2;

    //第三方登录
    public static $THIRD_LOGIN_ALI = 1;
    public static $THIRD_LOGIN_WX = 2;


    //列表筛选条件：当前用户
    public static $ROLE_TRAINER = "代练师";
    public static $ROLE_PLAYER = "玩家";
    public static $ROLE_SELLER = "卖家";
    public static $ROLE_BUYER = "买家";


    //提供充值
    public static $IS_PROVIDED = array(
        '1' => '是',
        '0' => '否'
    );


    public static $NOT_EQUAL = "!=";
    public static $EQUAL = "==";
    //精确到毫秒的时间长度
    public static $MICRO_TIME_LENGTH = 23;

    //云购码的固定数字
    public static $FIXED_NUMBER_CODE = 10000001;

    public static $HR_RECORD_TYPE_NONE = -1;
    public static $HB_RECORD_TYPE_BUY = 0; //付款买入 +
    public static $HB_RECORD_TYPE_GIFT = 1; //官网赠送 +
    public static $HB_RECORD_TYPE_CZ = 2;//充值付款　-
    public static $HB_RECORD_TYPE_GROUP_BUY = 3;// 一元云购付款　-
    public static $HB_RECORD_TYPE_CZ_PACKAGE = 4;//　充值套餐付款　-
    public static $HB_RECORD_TYPE_PACKAGE = 5;// 代练套餐付款 -
    public static $HB_RECORD_TYPE_REQUIREMENT = 6;// 代练需求付款 -
    public static $HB_RECORD_TYPE_ACCOUNT_TRADE = 7;// 账号交易付款 -
    public static $HB_RECORD_TYPE_IOS_SC = 8;// IOS首充号付款 -
    public static $HB_RECORD_TYPE_ANDROID_SC = 9;// Android首充号付款 -
    public static $HB_RECORD_TYPE_SC_BACK = 10;//首充号返点
    public static $HB_RECORD_YC_SEND = 11;//注册银承派 +
    public static $HB_RECORD_TYPE_TRAFFIC = 12;//流量充值 -
    public static $HB_RECORD_TYPE_CZ_BACK = 13;//充值退款
    public static $HB_RECORD_TYPE_PACKAGE_PLAYER_BACK = 14;//套餐，玩家退款
    public static $HB_RECORD_TYPE_PACKAGE_TRAINER_BACK = 15;//套餐，玩家退款
    public static $HB_RECORD_TYPE_CONTRIBUTION_VALUE = 16;//堂会贡献值兑换

    public static $HB_RECORD_TYPE_TEXT = array(
        "虎币充值",
        "官网赠送",
        "游戏充值",
        "一元云购",
        "充值套餐付款",
        "代练套餐付款",
        "代练需求付款",
        "账号交易付款",
        "IOS首充号付款",
        "Android首充号付款",
        "首充号返点",
        "银承派赠送",
        "流量充值",
        "充值退款",
        "代练套餐玩家退款",
        "代练套餐代练师退款",
        "堂会贡献值兑换"
    );

    //云购状态  state
    public static $GROUP_BUY_STATE_SOLDING = 0;  //购买中
    public static $GROUP_BUY_STATE_TIMING = 1;  //开奖倒计时中
    public static $GROUP_BUY_STATE_FINISH = 2;  //公布幸运者
    public static $GROUP_BUY_STATE_END = 3;  //处理完成
    public static $GROUP_BUY_STATE_TEXT = array(
        "0" => "销售中",
        "1" => "倒计时",
        "2" => "已公布",
        "3" => "结束"
    );

    //active
    public static $USUAL = 1;   //平时状态
    public static $FULL = 0;   //满员状态


    //充值套餐状态
    public static $CZ_PACKAGE_STATE_INIT = 0;//初始化（active=1）
    public static $CZ_PACKAGE_STATE_FULL = 1;//满员（active=0）
    public static $CZ_PACKAGE_STATE_ORDER = 2;//订单处理中（active=0）
    public static $CZ_PACKAGE_STATE_FINISH = 2; //处理完成（active=1）
    public static $CZ_PACKAGE_STATE_TEXT = array(
        "0" => "出售中",
        "1" => "满员",
        "2" => "订单处理中",
        "3" => "处理完成"
    );
    public static $CZ_PACKAGE_ACTIVE = 1;
    public static $CZ_PACKAGE_UNACTIVE = 0;


    //手机端交易中心的条件筛选条
    public static $SEARCH_BAR_ACCOUNT_TRADE = 2;


    public static $PAY_STATUS_WAITING = "00";//等待付款中
    public static $PAY_STATUS_SUCCESS = "01";//成功
    public static $PAY_STATUS_FAILED = "02";//失败
    public static $PAY_STATUS_OUT_OF_DATE = "03";//过期


    //先这样定义 群哥记得修改  (首充号)
    public static $SCH_ORDER_STATE_INIT = 0;
    public static $SCH_ORDER_STATE_IS_PAID = 1;
    public static $SCH_ORDER_STATE_IS_DOING = 2;
    public static $SCH_ORDER_STATE_FINISH = 3;

    public static $SCH_ORDER_STATE = array(
        '0' => "未付款",
        '1' => "待处理",
        '2' => "处理中",
        '3' => "处理完"
    );

    public static $IS_RECOMMEND_GOODS = array(
        'yes' => 1,
        'no' => 0
    );


    public static $ADMIN_USER_ID = 1;

    //权限组的状态值
    public static $AUTH_GROUP_STATUS = 1;

    public static $LOGIN_STATE_PWD_ERROR = 0;//账号或者密码错误
    public static $LOGIN_STATE_USER_NOT_EXIST = -1;//用户不存在
    public static $LOGIN_STATE_USER_NOT_ADMIN = -2;//用户不是管理员


    public static $TICKET_SEP_LINE = 0;
    public static $TICKET_LIMIT_COUNT_ALL = 5;
    public static $TICKET_LIMIT_COUNT_SINGLE = 2;

    public static $ACTIVITY_TIME = "2015-10-7 23:59:59";
    public static $ACTIVITY_DISCOUNT = 0.97;

    public static $TIME = "2016-2-29 23:59:59";

    public static $CZ_CREDITS_MULTIPLE = 2;
    public static $CZ_CREDITS_NORMAL = 1;
    public static $CZ_BACK_COINS_MULTIPLE = 0.12;

    public static $YYS_YD = 1;
    public static $YYS_LT = 2;
    public static $YYS_DX = 3;

    public static $THEME_MOBILE = "mb";

    public static $AUTH_STATE_OK = 2;
    public static $AUTH_STATE_NO = 1;
    public static $AUTH_STATE_TEXT = array('1' => '未通过',
        '2' => '通过');

    public static $MOBILE_DOMAIN = "m.honghonghu.com";

    public static $SEO_TITLE_KEY = "seo_title";
    public static $SEO_KEYWORD_KEY = "seo_keyword";
    public static $SEO_DESC_KEY = "seo_description";
    public static $SITE_KEYWORD = "轰轰虎手游交易平台";
    public static $SITE_KEYWORD_CZ = "轰轰虎苹果手游充值平台";
    public static $PAY_CASH_DESK = "收银台_轰轰虎手游交易平台";
    public static $SEO_HELP_BASE = "介绍";

    public static $FORMAT_UNKNOW = 0;
    public static $FORMAT_TEL = 1;
    public static $FORMAT_EMAIL = 2;

    public static $LOOKED = 'yes';
    public static $LIST_PARAM_NAME = "name";
    public static $LIST_PARAM_ACTIVE = "active";

    public static $SEO_EXTRA = "Index/seo/";
    public static $PARTNER = "Index/partner/";
    public static $UNUSED = 0;
    public static $IS_USED = array(
        '0' => '未使用',
        '1' => '已使用'
    );

    public static $COLLECT_PRAISE_STATE_INIT = 0;
    public static $COLLECT_PRAISE_THROUGH = 1;
    public static $COLLECT_PRAISE_NOT_THROUGH = 2;
    public static $COLLECT_PRAISE_STATE = array(
        '0' => '未审核',
        '1' => '审核通过',
        '2' => '审核不过',
    );

    public static $COLLECT_PRAISE_GIFT_TYPE = array(
        '1' => '流量',
        '2' => '首充号',
        '3' => '游戏币',
    );

    public static $COLLECT_PRAISE_TIME = "2015-12-25 23:59:59";


    public static $GROW_RECORD_TYPE_CZ = 1;// 充值　+
    public static $GROW_RECORD_TYPE_DAILY = 2;// 每日递减　-
    public static $GROW_RECORD_TYPE_SCH_IOS = 3; // IOS首充号  +
    public static $GROW_RECORD_TYPE_SCH_ANDROID = 4; //安卓首充号  -
    public static $GROW_RECORD_TYPE_CZ_PACKAGE = 5;  // 充值团购 +
    public static $GROW_RECORD_TYPE_ONE_GROUP = 6;   //一元购  +
    public static $GROW_RECORD_TYPE_HHH_SEND = 7;//官方赠送 +
    

    public static $GROW_RECORD_TYPE_TEXT = array(
        '1' => "充值",
        '2' => "每日递减",
        '3' => "IOS首充号",
        '4' => "Android首充号",
        '5' => "充值团购",
        '6' => "一元购",
        '7' => "官方赠送"
    );
    public static $MENU_TOP_MENU_PARENT_ID = 0;
    public static $MENU_TOP_MENU = 1;
    public static $MENU_SUB_MENU = 2;
    public static  $MENU_TYPE = array(
        '1' => '顶级导航',
        '2' => '二级导航'
    );

    public static $HB_PAY = array("hb", "mobile_hb");
    public static $VIP_START = 500;

    //站内信已读和未读
    public static  $MESSAGE_IS_READ = 1;
    public static  $MESSAGE_NO_READ = 0;

    public static $MESSAGE_TYPE_GB_FINISH = 1;
    public static $MESSAGE_TYPE_GB_LUCKER = 2;
    public static $MESSAGE_TYPE_VIP_CHANGE = 3;
    public static $MESSAGE_TYPE_MEMBER_LOGOUT = 4;
    public static $MESSAGE_TYPE_MEMBER_KICK = 5;
    
    public static $GROW_RECORD_TYPE = array(
            
    );

    public static $FAMILY_INFO_PAGE_SIZE = 10;

    public static $IDENTITY_MANAGER = 1;  //堂主
    public static $IDENTITY_MEMBER = 2;   //堂会成员
    public static $IDENTITY_ORDINARY = 3; //非堂会成员

    public static $IS_RECOMMEND =  array(
        'yes' => 1,
        'no'  => 0
    );
    
    public static $FAMILY_MAX_COUNT = 100;
    public static $FAMILY_FIRST_MAX_COUNT = 200;
    
    public static $FAMILY_CREATE_VIP_LEVEL = 5;

    public static $CONTRIBUTION_PERCENTAGE_MEMBER_SEND = 0.1;   //堂员充值赠送的百分比
    public static $CONTRIBUTION_PERCENTAGE_MGR_SEND = 0.01;   //堂员充值赠送的百分比
    public static $CONTRIBUTION_VALUE_SELF = 1;

    public static $CONTRIBUTION_RECORD_TYPE_MEMBER_CZ = 1;             //堂员充值+
    public static $CONTRIBUTION_RECORD_TYPE_MEMBER_SEND = 2;           //堂员充值赠送+
    public static $CONTRIBUTION_RECORD_TYPE_MGR_CZ = 3;
    public static $CONTRIBUTION_RECORD_TYPE_MGR_SEND = 4;
    public static $CONTRIBUTION_RECORD_TYPE_CONVERT = 5;        //兑换虎币-
    public static $CONTRIBUTION_RECORD_TYPE_SYSTEM_CLEAR = 6;   //自己退出系统清零-
    public static $CONTRIBUTION_RECORD_TYPE_KICK_MEMBER = 7;    //清除踢除成员的贡献值
    public static $CONTRIBUTION_RECORD_TYPE_TEXT = array(
        '1'=>'堂员充值',
        '2'=>'堂员充值赠送',
        '3'=>'堂主充值',
        '4'=>'堂主充值赠送',
        '5'=>'兑换虎币',
        '6'=>'系统清零',
        '7'=>'清除踢除成员所赠送'
    );

    public static $IS_VALID = array(
        'yes'=> 1,
        'no'=>  0
    );

    public static $SORT_BY_TIME = 1;
    public static $SORT_BY_SUM = 2;

    public static $MEMBER_TYPE_IN = 1; //堂会成员
    public static $MEMBER_TYPE_OUT = 2; //自行退出
    public static $MEMBER_TYPE_KICK = 3; // 踢出
    
    
    public static $STAR_CLASS_NAME = 'star_span';
    public static $BRIGHT_STAR = 1;
    public static $DARK_STAR = 0;

    public static $CONTRIBUTION_MULTIPLE = 100;
    public static $EXCHANGE_HB_PROPORTION = 10000;

    public static $GIFT_CODE_ACTIVE = 1;
    public static $GIFT_CODE_UNACTIVE = 0;
    public static $IS_ACTIVE = array(
        0=>'已领取',
        1=>'未领取'
    );

}
