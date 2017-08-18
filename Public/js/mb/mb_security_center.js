$(document).ready(function(){
    function same(pwd) {
        var oldPwd = $("#oldPassword").val();
        if (oldPwd == pwd)
            return false;
        else
            return true;
    }
	$.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");
    $.validator.addMethod("checkPass", checkPass, "必须是字母和数字结合");
    $.validator.addMethod("same", function(value, element) {return this.optional(element) || same(value);}, "新旧密码不能相同");

	$("#update_password").validate(window.update_password_option,true);

    $('#mobile_bind_auth').validate(window.mobile_bind_auth_option,true);
    $('#mobile_bind').validate(window.mobile_bind_option,true);

    $('#tel_email').validate(window.tel_email_option,true);
    $('#tel_email_set').validate(window.tel_email_set_option,true);



      
    $('.vcode_form #check_vcode').blur(function(){
       var vcode = $('#check_vcode').val();

       $.post('ajax_check_vcode',{vcode:vcode},function(msg){
          if(msg){
               $('#check_vcode_btn').removeAttr('disabled');
            }else{
                $('#check_vcode_btn').attr('disabled','disabled');
            }
          },'json');
     });

     
     $('#check_vcode_btn').click(function(){
        var tel = ($('#tel').val() || $('#tel').text());
        var tel_error = $("#tel-error").html();
        if(tel_error == undefined){
            tel_error = '';
        }
        if(tel == '' || tel_error != ''){
            alert('请填写可用手机号码');
            return false;
        }
        
        var msg_type = $('.vcode_form').attr('vcode');
        var data = {tel:tel,type:msg_type};
        $.post("ajax_send_msg",data,function(msg){
            if(msg){
                alert('手机短信已发送');
                sleepSendBtn();
            }else{
                alert('系统繁忙');
            }
        },'json');
        
    });
     

    function sleepSendBtn(){
       var time = 60;
       var interval = setInterval(function(){
           --time;
           if(time >= 0){
                $('#check_vcode_btn').css('opacity','0.5').val('重发'+time).prop("disabled","disabled");
           }
           if(time < 0){
                $('#check_vcode_btn').css('opacity','1').val('获取短信验证码').removeAttr("disabled");
               clearInterval(interval);
           }
       },1000); 
   };
	
});


