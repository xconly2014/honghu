<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title><?php echo ($seo_title); ?></title>
    <meta name="description" content="<?php echo ($seo_description); ?>">
    <meta name="keywords" content="<?php echo ($seo_keyword); ?>">
    
    <meta name="baidu-site-verification" content="exgxIqEXav" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="shortcut icon" type="image/png" href="/branches/out_excel/Public/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/common.css">
    
    <link href="/branches/out_excel/Public/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/index.css">
    <style>
        html body{
            background:#F7CE8E;
        }
    </style>

</head>

<body>

    <div class="top_notice">
        <p>
            <img src="/branches/out_excel/Public/img/horn.gif" alt="网站提示" width="15px" height="15px" />
            <span>警方提示：最近有不法分子冒充轰轰虎工作人员行骗，除腾讯手游充值需向轰轰虎客服提供验证码外，轰轰虎不会以任何形式向玩家索取验证码、用户名、密码，玩家下单手游充值时也无需支付押金。</span>
            <label id="close"></label>
        </p>
    </div>

<div class="top_bar_container">
    <div class="top_quick_bar">
        <div class="row_container">
            <div class="top_quick_bar_left">
                <li>
                    <?php $session_data = session('user_auth'); ?>
                    <span>您好<?php if(!empty($session_data)): ?><a href="<?php echo U('Home/User/info');?>"><?php echo ($session_data['username'] ? $session_data['username'] : $session_data['tel']); ?></a>
                    <?php $vipLevel = getUserVipLevel(); ?>
                    <?php if($vipLevel != ''): ?><span class="vip_level"><?php echo ($vipLevel); ?></span><?php endif; endif; ?>，欢迎光临轰轰虎</span>
                </li>
                <?php if(is_login()): ?><li>
                        <a href="<?php echo U('Login/logout');?>" rel="nofollow">退出</a>
                    </li>
                    <li>
                        <a href="<?php echo U('User/message');?>" rel="nofollow">消息
                            <?php $num = getMessageNoRead(); ?>
                            <?php if($num != 0): ?>(<?php echo ($num); ?>)<?php endif; ?>
                        </a>
                    </li>
                    <?php else: ?>
                    <li>
                        <a href="<?php echo U('Login/index');?>" rel="nofollow">登录</a>
                    </li>
                    <li>
                        <a href="<?php echo U('Register/reg_tel');?>" rel="nofollow">免费注册</a>
                    </li><?php endif; ?>
            </div>
            <div class="top_quick_bar_right">
                <dl>
                    <dt>
                        <a href="http://www.honghonghu.com" rel="nofollow">首页</a>
                    </dt>
                    <dt class="top_grayline">|</dt>
                    <dd class="subNav">
                  <span>
                    <a href="#" rel="nofollow">订单中心</a>
                  </span>
                        <ul>
                            <li>
                                <a href="<?php echo U('User/chongzhi_list');?>">苹果充值</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/cz_package_order');?>">充值团购</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/my_requirement');?>">代练需求</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/my_package');?>">代练套餐</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/my_account_trade');?>">账号交易</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/group_buy_order');?>">一元购</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/goods_order');?>">商品兑换</a>
                            </li>
                            <li>
                                <a href="<?php echo U('User/sc_order_list');?>">首充号</a>
                            </li>
                        </ul>
                    </dd>
                    <dt class="top_grayline">|</dt>
                    <dt>
                        <a href="<?php echo U('User/info');?>" rel="nofollow">个人中心</a>
                    </dt>
                    <dt class="top_grayline">|</dt>
                    <dt>
                        <a href="<?php echo U('Help/index');?>" rel="nofollow">帮助中心</a>
                    </dt>
                    <!--<dt class="top_grayline">|</dt>
                    <dd class="subNav wb">
                  <span>
                  <a href="#" target="_blank" rel="nofollow">官方微博</a>
                </span>
                        <ul id="hide_nav">
                            <li class="tengxun">
                                <a href="#" target="_blank" rel="nofollow" >腾讯微博</a>
                            </li>
                            <li class="xinlang">
                                <a href="#" target="_blank" rel="nofollow" >新浪微博</a>
                            </li>
                        </ul>
                    </dd>-->
                </dl>
            </div>
        </div>
    </div>
    <div class="christmas_top">
        <div class="row_container">
            <!--  <div class="top_bar">

             </div> -->
            <div class="logo_bar">

                <a href="<?php echo U('/');?>">
                    <img src="/branches/out_excel/Public/img/logo.png" alt="logo" class="web_logo"/>
                </a>

                <div class="search_bar">
                    <form action="<?php echo U('Index/search');?>" method="post" style="width:350px;">
                        <input class="search_text" type="text" name="name" placeholder="请输入游戏关键字">
                        <input class="search_submit"  type="submit"  value="搜索"/>
                        <div class="clear"></div>
                    </form>
                    <div class="hot_search">
                        <span class="hot_img"></span>
                        <a href="<?php echo U('CZIOS/chongzhi_info',array('gameId'=>60));?>">天天酷跑</a>
                        <a href="<?php echo U('CZIOS/chongzhi_info',array('gameId'=>795));?>">王者荣耀</a>
                        <a href="<?php echo U('CZIOS/chongzhi_info',array('gameId'=>587));?>">少年三国志</a>
                        <?php $list = getSearchGameList(4); ?>
                        <?php if(is_array($list)): foreach($list as $key=>$search): ?><a href="<?php echo U('CZIOS/chongzhi_info',array('gameId'=>$search['game_id']));?>"><?php echo ($search["name"]); ?></a><?php endforeach; endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="navi">
    <div class="row_container">
        <div class="navi_bar_container">
            <ul>
                <!-- 
    <li class="home_login_btn" id="home_login_btn">
        <img src="/branches/out_excel/Public/img/login_run.gif" alt="" />
    </li>
 -->

                <li class="single">
                    <a href="http://www.honghonghu.com">首页</a>
                </li>

                <li class="single">
                    <a href="<?php echo U('CZIOS/index');?>">手游充值</a>
                </li>

                <li class="single">
                    <a href="<?php echo U('Family/family_index');?>">名人堂
                        <img src="/branches/out_excel/Public/img/new.gif">
                    </a>
                </li>

                <li class="single">
                    <a href="<?php echo U('SCH/index');?>">首充号</a>
                </li>

                <li class="dropdown_menu">游戏交易
                    <dt>
                        <a href="<?php echo U('TradeCenter/index', array('type'=>3));?>">代练套餐</a>
                        <a href="<?php echo U('TradeCenter/index', array('type'=>4));?>">代练需求</a>
                        <a href="<?php echo U('TradeCenter/index', array('type'=>2));?>">账号买卖</a>
                    </dt>
                </li>

               <!--  <li class="single">
                    <a href="<?php echo U('GroupBuy/index');?>" target="_blank">团购专区</a>
                </li> -->
                <li class="single">
                    <a href="<?php echo U('CreditsStore/index');?>">积分商城</a>
                </li>
            </ul>
            <!-- 
    <?php if(is_login()): ?><div class="login_float login_float_in" id="home_login_window">
            <div class="user_header_info">
                <img src="/branches/out_excel/Public<?php echo ($user_info["head_img"]); ?>" alt="用户头像" />
                
                <p><a href="<?php echo U('Home/User/info');?>">个人中心</a></p>
            </div>
            <ul class="login_in">
                <a href="<?php echo U('Home/User/coins_list');?>">虎 币：<?php echo ($user_info["coins"]); ?></a>
                <a href="<?php echo U('Home/User/credits');?>">积 分：<?php echo ($user_info["credit"]); ?></a>
                <a href="<?php echo U('Home/User/info');?>">今 日 签 到</a>
            </ul>
        </div>
        <?php else: ?>
        <div class="login_float login_float_out" id="home_login_window">
            <ul class="login_out">
                <li>
                    <label>&nbsp;</label>
                    <span id="info"></span>
                </li>
                <li>
                    <input placeholder="请输入用户名" id="uname"/>
                </li>
                <li>
                    <input placeholder="请输入密码" id="upwd" type="password"/>
                </li>
                <li>
                    <a href="javascript:void(0)" rel="nofollow" id="login">登录</a>
                    <a href="<?php echo U('Register/index');?>" rel="nofollow">注册</a>
                </li>
            </ul>
        </div><?php endif; ?>
 -->
        </div>
    </div>
</div>


    <div class="fixed">
        <ul>
            <li>
                <a rel="nofollow" target="_blank">
                    <img src="/branches/out_excel/Public/img/float_window/qq.png" alt="QQ">

                    <script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAwNzI2M18yNjE4OTZfNDAwODA2MjQwMF8"></script>
                </a>
            </li>
            <li>
                <a href="<?php echo U('Home/Suggest/suggest');?>" target="_blank">
                    <img src="/branches/out_excel/Public/img/float_window/suggestion.png" alt="建议收集">
                    <p>建议收集</p>
                </a>
            </li>
            <li class="tel_alert">
                <a href="javascript:void(0)">
                    <img src="/branches/out_excel/Public/img/float_window/telephone.png" alt="客服电话">
                    <p>客服电话</p>
                    <div class="tel_div">400-806-2400</div>
                </a>

            </li>
            <li class="go_top" style="display: list-item;">
                <a href="javascript:;">
                    <img src="/branches/out_excel/Public/img/float_window/go_top.png" alt="回到顶部">
                    <p>回到顶部</p>
                </a>
            </li>
        </ul>
    </div>
    <div class="float_right" id="remind">
        <p>掌握最新优惠折扣</p>
        <img src="/branches/out_excel/Public/img/triangle.png">
    </div>
    <div class="float_right">
        <div class="bar_code_container">
            <img src="/branches/out_excel/Public/img/bar_code.png" alt="微信二维码" width="150px" height="150px" />
        </div>
    </div>
    <div class="row_container" >
        <div class="box_left">
            <div class="top_pic_container">
                <div id="slideboxContainer" class="slideBox">
                    <ul class="items">
                        <?php if(is_array($banners)): $i = 0; $__LIST__ = $banners;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$one_item): $mod = ($i % 2 );++$i;?><li>
                                <a href="<?php echo ($one_item["href"]); ?>" >
                                    <img src="/branches/out_excel/Public/upload/banner/<?php echo ($one_item["img"]); ?>" alt="<?php echo ($one_item["title"]); ?>"/>
                                </a>
                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="box_right">
            <div class="part_margin quick_button_container">
                <div class="quick_button_top">
                    <div class="top_deco"></div>
                </div>
                <div class="quick_button">
                    <div class="wrapper_container">
                        <a class="hot_buy" href="<?php echo U('Home/CZIOS/index');?>">苹果充值</a>
                        <a href="<?php echo U('Home/TradeCenter/buy');?>">我要购买</a>
                        <a class="hot_buy" href="<?php echo U('Home/TradeCenter/sell');?>">我要出售</a>
                        <a class="hot_buy" href="<?php echo U('Home/TrafficOrder/mb_flow_index');?>">流量充值</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row_container">
        <div class="box_left">
            <div class="cz_game_container">
                <label class="cz_game_title">游戏充值</label>
                <a class="letter_more_game" href="<?php echo U('Home/CZIOS/index');?>">>>>更多游戏</a>

                <div class="letter_bar_content" id="czios_list">
                    <ul class="letter_bar" id="letter">
                        <li style="width:45px;margin-right:20px;">
                            <a href='javascript:void(0)' class="tab_on">推荐</a>
                        </li>

                        <?php if(is_array($letter_bar)): foreach($letter_bar as $key=>$v): ?><li>
                                <a href='javascript:void(0)'><?php echo ($v); ?></a>
                            </li><?php endforeach; endif; ?>
                    </ul>

                    <div class="letter_bar_tc" id="推荐" style="display:block">
                        <?php if(is_array($suggest_list)): foreach($suggest_list as $key=>$suggest_game): if(!empty($suggest_game)): ?><li class="cz_game_info suggest_game_list" >
                                    <a href="<?php echo U('CZIOS/chongzhi_info?gameId='.$suggest_game['game_id']);?>">
                                        <img src="" alt="<?php echo ($suggest_game['thumbnail_path']); ?>" width="90px" height="90px"/>
                                        <p><?php echo ($suggest_game["name"]); ?></p>
                                    </a>
                                </li><?php endif; endforeach; endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row_container">
        <div class="box_left part_margin">
            <div class="news_container">
                <div class="news_title">公告</div>
                <div class="news_content">
                    <ul>
                        <?php if(is_array($news_list)): foreach($news_list as $index=>$row): ?><a href="<?php echo U('Home/News/index?newsId='.$row['id']);?>">
                                <li title="<?php echo ($row["title"]); ?>">
                                    <?php if($index < 3 ): ?><img src="/branches/out_excel/Public/img/hot.gif" alt="公告-火" width="29px" height="19px" /><?php endif; ?>
                                    <?php echo ($row["title"]); ?>
                                </li>
                            </a><?php endforeach; endif; ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="box_right">
            <div class="sc_container part_margin">
                <div class="tab_title_container">
                    <label>首充号</label>
                    <!--<div class="tab_title" id="tab_title">
                        <li name="ios_sc_list" class="click">苹果</li>
                        <li name="android_sc_list">安卓</li>
                    </div>-->
                    <div class="more">
                        <a href="<?php echo U('Home/SCH/index');?>">>>>更多</a>
                    </div>
                </div>
                <div class="tab_content" id="tab_content">
                    <div id="ios_sc_list">
                        <ul class="common_ul_list" id='iossc'></ul>
                    </div>
                    <!--<div id="android_sc_list" style="display: none">
                        <ul class="common_ul_list" id='androidsc'></ul>
                    </div>-->
                </div>
            </div>
        </div>
    </div>

    <div class="row_container">
        <div class="box_left">
            <div class="inline_div game_strategy_evoluation part_margin" id="strategy_evoluation">
                <div class="tab_title_container">
                    <div class="tab_title" id="game_strategy_evoluation_title">
                        <li name="game_strategy" class="click" id="strategy">攻略</li>
                        <li name="game_evoluation" id="evoluation">资讯</li>
                    </div>
                    <div class="more">
                        <a href="<?php echo U('Home/Strategy/strategy_list');?>" id="strategy_more">>>>更多</a>
                    </div>
                </div>
                <div class="tab_content" id="game_strategy_evoluation_content">
                    <div id="game_strategy">
                        <ul class="common_ul_list" id="strategy_ul"></ul>
                    </div>
                    <div id="game_evoluation" style="display: none">
                        <ul class="common_ul_list" id='evoluation_ul'></ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="box_right">
            <div class="cz_package_container part_margin">
                <div class="deco">充值团购</div>
                <ul class="common_ul_list" id='czpackage_ul'></ul>
            </div>
        </div> -->
    </div>



    <div class="row_container">
        <div class="box_left">
            <div class="part_margin friend_link_container">
                <div class="friend_link_title">友情链接</div>
                <div class="friend_link_content">
                    <ul>
                        <?php if(is_array($friend_link_list)): foreach($friend_link_list as $key=>$row): ?><li><a href="<?php echo ($row["url"]); ?>" target="_blank"><?php echo ($row["name"]); ?></a></li><?php endforeach; endif; ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="box_right">
            <div class="part_margin package_requirement_container">
                <div class="package_requirement_title">
                    <li class="selected">代练需求</li>
                    <li>代练套餐</li>
                    <li>账号交易</li>
                </div>
                <div class="package_requirement_content">
                    <ul style="display:block">
                        <?php if(is_array($requirement_list)): foreach($requirement_list as $key=>$row): ?><a href="<?php echo U('Home/Requirement/receive?id='.$row['id']);?>">
                                <li>
                                    <p><?php echo ($row["name"]); ?></p>
                                    <span><?php echo ($row["game_name"]); ?><b><?php echo ($row["price"]); ?>元</b></span>
                                </li>
                            </a><?php endforeach; endif; ?>
                    </ul>
                    <ul>
                        <?php if(is_array($package_list)): foreach($package_list as $key=>$row): ?><a href="<?php echo U('Home/Package/buy?id='.$row['id']);?>">
                                <li>
                                    <p><?php echo ($row["name"]); ?></p>
                                    <span><?php echo ($row["game_name"]); ?><b><?php echo ($row["price"]); ?>元</b></span>
                                </li>
                            </a><?php endforeach; endif; ?>
                    </ul>
                    <ul>
                        <?php if(is_array($account_trade_list)): foreach($account_trade_list as $key=>$row): ?><a href="<?php echo U('Home/AccountTrade/buy?id='.$row['id']);?>">
                                <li>
                                    <p><?php echo ($row["name"]); ?></p>
                                    <span><?php echo ($row["game_name"]); ?><b><?php echo ($row["price"]); ?>元</b></span>
                                </li>
                            </a><?php endforeach; endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<div class="footer_container">
    <div class="row_container">
        <div class="part_margin footer">
            <div class="footer_top">
                <ul>
                    <li class="item_1">
                        <span>超时无货赔付</span>
                    </li>
                    <li class="item_2">
                        <span>官方正品实惠</span>
                    </li>
                    <li class="item_3">
                        <span>下单闪电快充</span>
                    </li>
                    <li class="item_4">
                        <span>7x24小时客服在线</span>
                    </li>
                </ul>
            </div>

            <div class="left_computer">
                <img src="/branches/out_excel/Public/img/footer/computer.png" alt="computer" width="110px" height="77px" />
            </div>
            <div class="footer_details">
                <a href="<?php echo U('Home/Help/index', array('id'=>7));?>">关于我们</a>
                <span>|</span>
                <a href="<?php echo U('Home/Help/index', array('id'=>9));?>">商务合作</a>
                <span>|</span>
                <a href="<?php echo U('Index/web_map');?>">网站地图</a>
                <span>|</span>
                <a href="<?php echo U('Help/index', array('id'=>4));?>">免责声明</a>
                <span>|</span>
                <a  href="tencent://message/?uin=4008062400">在线咨询</a>
                <span>|</span>
                <a href="<?php echo U('Suggest/suggest');?>">投诉与建议</a>
            </div>
            <div class="footer_introduce">
                    <span class="introduce">
                        广州鸿鹄网络科技有限公司 &nbsp; 版权所有Copyright © 2013 www.honghonghu.com 粤ICP备14011973号
                    </span>
            </div>
            <div class="footer_safe">
                <a href="http://www.cyberpolice.cn/wfjb/" target="_blank">
                    <img class="img_border" src="/branches/out_excel/Public/img/footer/01.jpg" alt="网络警察提醒您" title="网络警察提醒您" width="126px" height="47px"/>
                </a>
                <div style="display:inline-block;margin-right:auto;margin-left:auto;text-align: center;">
                    <script src="http://kxlogo.knet.cn/seallogo.dll?sn=e14041844010048148ul1a000000&size=0"></script>
                </div>
                <a>
                    <img src="/branches/out_excel/Public/img/footer/03.png" alt="安全联盟实名验证" title="安全联盟实名验证" width="126px" height="47px"  />
                </a>
                <a>
                    <img src="/branches/out_excel/Public/img/footer/04.jpg" alt="360可信网站" title="360可信网站" width="124px" height="47px"  />
                </a>
                <a>
                    <img class="img_border" src="/branches/out_excel/Public/img/footer/05.jpg" alt="中国文化部" title="中国文化部" width="126px" height="47px"  />
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1253269026'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s9.cnzz.com/stat.php%3Fid%3D1253269026%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>

<script type="text/javascript" src="http://libs.baidu.com/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="/branches/out_excel/Public/js/Plugin/jqueryForm/jQuery_Validation.js"></script>
<script type="text/javascript" src="/branches/out_excel/Public/js/global_checker.js"></script>
<script type="text/javascript">
    $().ready(function(){
        //点击搜索时，如果为空则获得焦点
        $('.search_submit').click(function(){
            var name = $('.search_text').val();
            if(name==''){
                $('.search_text').focus();
                return false;
            }
        });

        $('#cnzz_stat_icon_1253269026').find("img").remove();
    });

    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F77eddee7c086e43698c007b8bcbee395' type='text/javascript'%3E%3C/script%3E"));
</script>

    <script src="/branches/out_excel/Public/js/Plugin/slideBox/jquery.slideBox.min.js" type="text/javascript"></script>
    <script src="/branches/out_excel/Public/js/module/index.js" type="text/javascript"></script>

    <script type="text/javascript">
        $().ready(function(){

            $('#strategy').click(function(){
                $('#strategy_more').attr('href',"<?php echo U('Home/Strategy/strategy_list');?>");
            });
            $('#evoluation').click(function(){
                $('#strategy_more').attr('href',"<?php echo U('Home/Evoluation/evoluation_list');?>");
            });

            $('.tel_alert').hover(function(){
                $('.tel_div').css('display','block');
            },function(){
                $('.tel_div').css('display','none');
            });
        });
    </script>

</body>