<?php
return array(

    'URL_ROUTER_ON'   => true,
    'URL_ROUTE_RULES' => array(
        //'chongzhi/chongzhi-info/:gameId'  => 'Home/CZIOS/index',
        //'chongzhi/chongzhi-info/:gameId'  => 'Home/CZIOS/chongzhi_info',
        'c_z_i_o_s/chongzhi_info/gameId/error'=> 'Home/Index/index',
        'CZIOS/chongzhi_info/gameId/error'=> 'Home/CZIOS/index',
        'chongzhi/ios/error'              => 'Home/CZIOS/index',
        'chongzhi/chongzhi-info-again/:orderId'=> 'Home/CZIOS/chongzhi_again',
        'chongzhi/chongzhi-verify/:id'    => 'Home/CZIOS/index',
        'filter/error'                    => 'Home/CZIOS/index',
        'filter/filter-requirement/error' => 'Home/Index/index',
        'filter/filter-requirement/:id'   => 'Home/Index/index',
        'filter/filter-first-account/error'=> 'Home/Index/index',
        'account/chongzhi_list'           => 'Home/Login/index',
        'evaluation/error'                => 'Home/Index/index',
        'm/:id/package-get/error'         => 'Home/Index/index',
        'm/:id/package-get/:packageId'    => 'Home/Index/index',
        'order/:id/error'                 => 'Home/Index/index',
        'order/:id/zhifubao_zhifubao'     => 'Home/Index/index',
        'order/zhifubao-async-callback/:id'=> 'Home/Index/index',
        'order/:id/yeepay'              => 'Home/Index/index',
        'help/help_article_get/error'     => 'Home/Help/index',
        'help/news-get/error'              => "Home/Help/index",
        'help/news-get/:id'                => "Home/Help/index",
        'chongzhi/chongzhi-modify/:id'    => 'Home/Index/index',
        'chongzhi/chongzhi-modify/error'  => 'Home/Index/index',
        'Home/SCH/account_android/gameId/error' => 'Home/Index/index'
    ),

    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    // 允许访问的模块列表
    'MODULE_ALLOW_LIST'    =>    array('Home','Admin'),

    'DEFAULT_MODULE'       =>    'Home',  // 默认模块
    //'DEFAULT_CONTROLLER'   =>    'Index',

    'other_controller' => array('baidu', 'sanliuling', 'sougou', 'shenma', 'huodong', 'weixin'),

    'partner'   => array('shouyou'),

    'MODULE_DENY_LIST'   => array('Common'),
    //'MODULE_ALLOW_LIST'  => array('Home','Admin'),

    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'Uy"i%j7^aQ0A`wXvD:tzx$H8#1M4W.(r>k!BdnGO', //默认数据加密KEY

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => false, //默认false 表示URL区分大小写 true则表示不区分大小写
    'TMPL_CACHE_ON'         =>false, // 是否开启模板编译缓存,设为false则每次都会重新编译
    'ERROR_PAGE'           => 'error.html',
    'LOG_RECORD' => true, // 开启日志记录
    'LOG_LEVEL' =>'EMERG,ALERT,CRIT,ERR', // 只记录EMERG ALERT CRIT ERR 错误 
    'URL_MODEL'            => '2',
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
  //  'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数


    /*图片上传配置*/
    //游戏图片
    'game_pic_upload' => array(
        'maxSize' => 3145728,
        'exts' => array('jpg', 'gif', 'png', 'jpeg'),// 设置附件上传类型
        'rootPath' => '/data/uploads/',
        'savePath' => '/image/',
        'subName'  => '',
        'saveName' => 'time'//保存文件的命名规则
    ),
   
    'src_path' => './Public/upload/'.\Utils\ConstantUtils::$UPOLAD_PATH_USER_ACCOUNT_SRC.'/',
    'dest_path'=> './Public/upload/'.\Utils\ConstantUtils::$UPOLAD_PATH_USER_ACCOUNT_DEST.'/',
    

    'game_thumbnail'=>'/Public/upload/game_pic/',

    'footer_pic_upload' =>array(
        'maxSize' => 3145728,
        'exts' => array('jpg', 'gif', 'png', 'jpeg'),// 设置附件上传类型
        'rootPath' => './Public/upload',
        'savePath' => '/footer_pic/',
        'subName'  => '',
        'saveName' => 'time'//保存文件的命名规则
    ),

    'AUTH_CONFIG' => array(
        ´AUTH_ON´ => true, //认证开关
        ´AUTH_TYPE´ => 1, // 认证方式，1为时时认证；2为登录认证。
        ´AUTH_GROUP´ => ´auth_group´, //用户组数据表名
        ´AUTH_GROUP_ACCESS´ => ´auth_group_access´, //用户组明细表
        ´AUTH_RULE´ => ´auth_rule´, //权限规则表
        ´AUTH_USER´ => ´auth_user´//用户信息表
    ),

    'order_prefix'  => array(
        'cz_order_ios'     => "16",
        'cz_order_android' => "26",
        'cz_package_order' => "36",
        'coins_order'      => "46",
        'package_order'    => "56",
        'requirement_order'=>"66",
        'account_trade_order' => "76",
        'sc_order_ios' => "86",
        'group_buy_cz_order' => "96",
        'traffic_order' =>"106",
        'sc_order_android' => "116"
    ),

    'order_base_info_mobile' => array(
        'cz_order_ios' =>array(
            'notify_url' => array('http://www.honghonghu.com/CZOrderIOS/order_alipay_mobile_notify',
                                   'http://www.honghonghu.com/CZOrderIOS/order_shengpay_mobile_notify',
                                   'http://www.honghonghu.com/CZOrderIOS/order_wx_pay_notify'),

            'return_url' => array('http://www.honghonghu.com/CZOrderIOS/order_alipay_mobile_return',
                                    'http://www.honghonghu.com/CZOrderIOS/order_shengpay_mobile_page'),
            'subject'    => "ios充值",
        ),

        'cz_package_order' =>array(
            'notify_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_mobile_notify',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_mobile_notify',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_mobile_return',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_mobile_page',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "充值套餐",
        ),
        'cz_coins' => array(
            'notify_url' => array('http://www.honghonghu.com/CoinsCenterOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/CoinsCenterOrder/order_wx_pay_notify',
                'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_notify'),

            'return_url' => array('http://www.honghonghu.com/CoinsCenterOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/CoinsCenterOrder/order_wx_pay_return',
                'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_page'),
            'subject'    => "虎币充值",
        ),
        'ios_cz_package_order' => array(
            'notify_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_notify',
                ''),

            'return_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_return',
                ''),
            'subject'    => "ios充值套餐",
        ),
        'package_order'=> array(
            'notify_url' => array('http://www.honghonghu.com/PackageOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/PackageOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/PackageOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/PackageOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/PackageOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/PackageOrder/order_wx_pay_return',
                ''),
            'subject'    => "代练套餐",
        ),
        'requirement_order'=> array(
            'notify_url' => array('http://www.honghonghu.com/RequirementOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/RequirementOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/RequirementOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/RequirementOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/RequirementOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/RequirementOrder/order_wx_pay_return',
                ''),
            'subject'    =>"代练需求"
        ),
        'account_trade_order'=> array(
            'notify_url' => array('http://www.honghonghu.com/AccountTradeOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/AccountTradeOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/AccountTradeOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/AccountTradeOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/AccountTradeOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/AccountTradeOrder/order_wx_pay_return',
                ''),
            'subject'    => "账号交易",
        ),
        'ios_sc_order' => array(
            'notify_url' => array('http://www.honghonghu.com/IOSScOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/IOSScOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/IOSScOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/IOSScOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/IOSScOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/IOSScOrder/order_wx_pay_return',
                ''),
            'subject'    => "IOS首充号",
        ),
        'group_buy_cz_order' => array(
            'notify_url' => array('http://www.honghonghu.com/GroupBuyCzOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/GroupBuyCzOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/GroupBuyCzOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/GroupBuyCzOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/GroupBuyCzOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/GroupBuyCzOrder/order_wx_pay_return',
                ''),
            'subject'    => "一元团购"
        ),
        'traffic_order'   => array(
            'notify_url' => array('http://www.honghonghu.com/TrafficOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/TrafficOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/TrafficOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/TrafficOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/TrafficOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/TrafficOrder/order_wx_pay_return',
                ''),
            'subject'    => "流量充值"
        ),
        'sc_order_android'=> array(
            'notify_url' => array('http://www.honghonghu.com/AndroidScOrder/order_alipay_mobile_notify',
                'http://www.honghonghu.com/AndroidScOrder/order_shengpay_mobile_notify',
                'http://www.honghonghu.com/AndroidScOrder/order_wx_pay_notify',
                ''),
            'return_url' => array('http://www.honghonghu.com/AndroidScOrder/order_alipay_mobile_return',
                'http://www.honghonghu.com/AndroidScOrder/order_shengpay_mobile_page',
                'http://www.honghonghu.com/AndroidScOrder/order_wx_pay_return',
                ''),
            'subject'    => "android首充号",
        )
    ),

    'order_base_info' => array(
        'cz_order_ios' =>array(
            'notify_url' => array('http://www.honghonghu.com/CZOrderIOS/order_alipay_notify',
                                  'http://www.honghonghu.com/CZOrderIOS/order_shengpay_notify',
                                  'http://www.honghonghu.com/CZOrderIOS/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/CZOrderIOS/order_alipay_return',
                                  'http://www.honghonghu.com/CZOrderIOS/order_shengpay_page',
                                  'http://www.honghonghu.com/CZOrderIOS/order_wx_pay_return',
                                  ''),
            'subject'    => "ios充值",
        ),

        'cz_package_order' =>array(
            'notify_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_notify',
                                   ''),
            'return_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_return',
                                   'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_page',
                                   'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_return',
                                   ''),
            'subject'    => "充值套餐",
        ),
        'cz_coins' => array(
            'notify_url' => array('http://www.honghonghu.com/CoinsCenterOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_wx_pay_notify',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_notify'),
            'return_url' => array('http://www.honghonghu.com/CoinsCenterOrder/order_alipay_return',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_wx_pay_return',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/CoinsCenterOrder/order_shengpay_page'),
            'subject'    => "虎币充值",
        ),
        'ios_cz_package_order' => array(
            'notify_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_notify',
                                  ''),

            'return_url' => array('http://www.honghonghu.com/IOSCZPackageOrder/order_alipay_return',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/IOSCZPackageOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "ios充值套餐",
        ),
        'package_order'=> array(
            'notify_url' => array('http://www.honghonghu.com/PackageOrder/order_alipay_notify',
                                   'http://www.honghonghu.com/PackageOrder/order_shengpay_notify',
                                   'http://www.honghonghu.com/PackageOrder/order_wx_pay_notify',
                                   ''),
            'return_url' => array('http://www.honghonghu.com/PackageOrder/order_alipay_return',
                                  'http://www.honghonghu.com/PackageOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/PackageOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "代练套餐",
        ),
        'requirement_order'=> array(
            'notify_url' => array('http://www.honghonghu.com/RequirementOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/RequirementOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/RequirementOrder/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/RequirementOrder/order_alipay_return',
                                  'http://www.honghonghu.com/RequirementOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/RequirementOrder/order_wx_pay_return',
                                  ''),
            'subject'    =>"代练需求"
        ),
        'account_trade_order'=> array(
            'notify_url' => array('http://www.honghonghu.com/AccountTradeOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/AccountTradeOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/AccountTradeOrder/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/AccountTradeOrder/order_alipay_return',
                                  'http://www.honghonghu.com/AccountTradeOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/AccountTradeOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "账号交易",
        ),
        'ios_sc_order' => array(
            'notify_url' => array('http://www.honghonghu.com/IOSScOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/IOSScOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/IOSScOrder/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/IOSScOrder/order_alipay_return',
                                  'http://www.honghonghu.com/IOSScOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/IOSScOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "IOS首充号",
        ),
        'group_buy_cz_order' => array(
            'notify_url' => array('http://www.honghonghu.com/GroupBuyCzOrder/order_alipay_notify',
                                   'http://www.honghonghu.com/GroupBuyCzOrder/order_shengpay_notify',
                                   'http://www.honghonghu.com/GroupBuyCzOrder/order_wx_pay_notify',
                                   ''),
            'return_url' => array('http://www.honghonghu.com/GroupBuyCzOrder/order_alipay_return',
                                   'http://www.honghonghu.com/GroupBuyCzOrder/order_shengpay_page',
                                   'http://www.honghonghu.com/GroupBuyCzOrder/order_wx_pay_return',
                                   ''),
            'subject'    => "一元团购"
        ),
        'traffic_order'   => array(
            'notify_url' => array('http://www.honghonghu.com/TrafficOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/TrafficOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/TrafficOrder/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/TrafficOrder/order_alipay_return',
                                  'http://www.honghonghu.com/TrafficOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/TrafficOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "流量充值"
        ),
        'sc_order_android'=> array(
            'notify_url' => array('http://www.honghonghu.com/AndroidScOrder/order_alipay_notify',
                                  'http://www.honghonghu.com/AndroidScOrder/order_shengpay_notify',
                                  'http://www.honghonghu.com/AndroidScOrder/order_wx_pay_notify',
                                  ''),
            'return_url' => array('http://www.honghonghu.com/AndroidScOrder/order_alipay_return',
                                  'http://www.honghonghu.com/AndroidScOrder/order_shengpay_page',
                                  'http://www.honghonghu.com/AndroidScOrder/order_wx_pay_return',
                                  ''),
            'subject'    => "android首充号",
        )
    ),

    
    'goods_pic' => array(
            'maxSize' => 3145728,
            'exts' => array('jpg', 'gif', 'png', 'jpeg'),// 设置附件上传类型
            'rootPath' => './Public/upload',
            'savePath' => '/goods_pic/',
            'subName'  => '',
            'saveName' => 'time'//保存文件的命名规则
    ),

    'collect_praise_pic' => array(
        'maxSize' => 30000000,//
        'exts' => array('jpg', 'gif', 'png', 'jpeg'),// 设置附件上传类型
        'rootPath' => './Public/upload',
        'savePath' => '/collect_praise_pic/',
        'subName'  => '',
        'saveName' => 'time'//保存文件的命名规则
    ),

    //需要“登录”的操作
    'auth_action' =>array(
        'package'         =>array('game_account', 'publish'),
        'accounttrade'    =>array('publish','buy'),
        'accounttradeorder' => array('buyer_pay'),
        'czios'           =>array('chongzhi_again'),
        'coinscenter'     =>array('index','coins_cz_finish'),
        'creditsstore'    =>array('goods_info'),
        'goodsorder'      =>array('infomation'),
        'iosczpackage'    =>array('buy'),
        'iossc'           =>array('addGameAccount'),
        'androidsc'       =>array('get','addGameAccount'),
        'requirement'     =>array('publish','get','verify_requirement'),
        'user'            =>array('coins_list','chongzhi_list','info','password_modify','mobile','mobile_bind_auth',
                                  'mobile_bind_vcode','email','tel_email_valid','tel_email_set','email_auth_wait',
                                  'email_auth_imp','pwd_question','pwd_question_index','pwd_question_set','credits',
                                  'authentication', 'cz_package_order', 'my_requirement', 'my_package','my_account_trade',
                                  'group_buy_order', 'goods_order', 'sc_order_list', 'security_center', 'grow_record_list',
                                  'message','family_create', 'contribution_list'),
        'groupbuyczorder' =>array(''),
        'trafficorder'    =>array('mb_flow_index')
    ),

    'privilege' => array(
        'package' => array('game_account' => array(array('package', 'publisher_id'),
                                                   array('id'),
                                                   \Utils\ConstantUtils::$NOT_EQUAL,
                                                   '您是套餐的所有者，不能购买')
        ),

        'requirement'=> array('verify_requirement' => array(array('requirement', 'publisher_id'),
                                                            array('id'),
                                                            \Utils\ConstantUtils::$NOT_EQUAL,
                                                            '您是需求的所有者，不能购买')
        ),

        'czios' => array(
            'chongzhi_again'  => array(array('cz_order_ios', 'customer_id'),
                array('orderId'),
                \Utils\ConstantUtils::$EQUAL,
                '您不是订单所有者'),
            'chongzhi_verify' => array(array('cz_order_ios', 'customer_id'),
                array('orderId'),
                \Utils\ConstantUtils::$EQUAL,
                '您不是订单所有者'),
            'chongzhi_doing' => array(array('cz_order_ios', 'customer_id'),
                 array('orderId'),
                 \Utils\ConstantUtils::$EQUAL,
                 '您不是订单所有者'),
            'chongzhi_modify' => array(array('cz_order_ios', 'customer_id'),
                array('orderId'),
                \Utils\ConstantUtils::$EQUAL,
                '您不是订单所有者')
        ),

        'accounttrade'=>array('buy_verify' => array(array('account_trade', 'seller_user_id'),
                                                            array('id'),
                                                            \Utils\ConstantUtils::$NOT_EQUAL,
                                                             '您是账号发布者，不能购买')
        ),

        /* //不可行，跨Model
         'accounttradeorder' => array('buyer_pay' => array(array('account_trade', 'seller_user_id'),
                                                     array('id'),
                                                     \Utils\ConstantUtils::$NOT_EQUAL,
                                                     '您是账号的发布者，不能购买')
        )*/
    ),

    'state' => array(
        'package' => array('package' => array(array('package', 'active'),
                                              array('id'),
                                              '套餐状态不允许')
        ),
    ),

    'pay_failed_page' => array(
        'alipay'  =>"",
        'shengpay'=>"",
        'wx'      =>"",
        'hb'      =>"",
        'credits' =>""
    )
);