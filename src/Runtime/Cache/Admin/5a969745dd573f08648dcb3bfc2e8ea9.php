<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title>轰轰虎后台系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/common.css">
    <link rel="stylesheet" type="text/css" href="/branches/out_excel/Public/css/login.css">

    <script type="text/javascript" src="/branches/out_excel/Public/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/branches/out_excel/Public/js/Plugin/jqueryForm/jQuery.form.js"></script>
    <script type="text/javascript" src="/branches/out_excel/Public/js/Plugin/jqueryForm/jQuery_Validation.js"></script>

    <script type="text/javascript">	
    $().ready(function(){
    	function updateError(errorMsg){
    	    $("#info").text(errorMsg);
    	}

        function checkField(){
            $("#info").html("&nbsp;");
            var username = $.trim($('#account').val());
            var password = $.trim($('#pwd').val());

            if(username == '' ){
                updateError('请填写账号');
                return false;
            }

            if(password == ''){
                updateError('请填写密码');
                return false;
            }
            return true;
        }

    	$('button').click(function(){
    		if(!checkField()){
                return false;
            }

            var username = $('#account').val();
            var password = $('#pwd').val();
    	    var url = "ajax_admin_login";
    	    $.post(url,{username:username,password:password},function(msg){
    	    	if(msg.status){
    	    		window.location.href = msg.url;
    	    	}else{
    	    		updateError(msg.data);
    	    	}
    	    },'json');
    	});
    	
	    $('#account').blur(function(){
	    	var username = $('#account').val();
	    	if(username == ''){
	    		$("#info").html("&nbsp;");
    	    	updateError('请填写账号');
	    		return false;	    		
	    	}
	    });
	    
	    $('#pwd').blur(function(){
	    	var password = $('#pwd').val();
	    	if(password == ''){
	    		$("#info").html("&nbsp;");
    	    	updateError('请填写密码');
	    		return false;	    		
	    	}
	    });	    
    });


    </script>
</head>
<body>
<div class="row_container">
    <div class="top_bar">
        <img src="/branches/out_excel/Public/img/logo.png"/>
    </div>
</div>
<div class="row_container">
    <div class="login_box">
        <img class="login_banner" src="/branches/out_excel/Public/img/login.png"/>

        <div class="login_form_container">
            <div class="title_bar">
                <center><img src="/branches/out_excel/Public/img/login_title.png" /></center>
            </div>
                <p class="input_field">
                    <label class="form_info"></label>
                    <input type="text" id="account" name="account" placeholder="请填写您的轰轰虎账号">
                </p>
                <p class="input_field">
                    <label class="form_info"></label>
                    <input type="password" id="pwd" name="pwd" placeholder="请填写账号密码">
                </p>
                <p class="input_field">
                    <label class="form_info"></label>
                    <span id="info" style="color:#f00;">&nbsp;</span>
                </p>

            <p class="input_field">
                <label class="form_info">&nbsp;</label>
                <label class="form_info">&nbsp;</label>
                <button type="submit">登录</button>
            </p>
        </div>
    </div>
</div>
</body>
</html>