$(document).ready(function(){
    addMethod();
    $("#nickname_form").validate(window.nickname_option);
    $("#tel_form").validate(window.tel_option);

    //初始化
    $('.tel_vcode').css('opacity','0.5');

    // 根据手机号是否匹配来确定点击按钮是否显示图形验证码
      $('.tel_vcode').click(function(){
            var judge = $('.tel_value').next().prop('class');
            var transparent = $('.tel_vcode').css('opacity');
            if(judge === 'success' && transparent == 1){
                $('#check_vcode').val("");
                change();
                if($('.img_vcode').children().last().is('span')){
                    $('.img_vcode').children().last().remove();
                }

                $('.get_vcode').css('display','inline-block');
            }
       });

      //根据手机号是否匹配改变发送短信验证码按钮样式
      $('.tel_value').focusout(function(){
            var judge = $('.tel_value').next().prop('class');
            if(judge === 'success'){
                $('.tel_vcode').css('opacity','1');
            }else{
                $('.tel_vcode').css('opacity','0.5');
            }
      });

      $('.tel_value').blur(function(){
        var mobile = $('.tel_value').val();
            var match = /^13[\d]{9}$|14^[0-9]\d{8}|^15[0-9]\d{8}$|^18[0-9]\d{8}$/;
            if(match.test(mobile)){
                $('.tel_vcode').css('opacity','1');
            }else{
                $('.tel_vcode').css('opacity','0.5');
            }
     });

      
      
    //点取消隐藏图形验证码div
    $('.btn_cancel').click(function(){
        $('.get_vcode').css('display','none');
    });

    $('.btn_ok').click(function(){
        $('#check_vcode').valid();
        var judge = $('.img_vcode').children().last().prop('class');
        if(judge === 'success'){
            $('.get_vcode').css('display','none');
            var url="ajax_send_msg";
            var data = {tel:$('.tel_value').val(), 'type':$('form').attr('vcode')};

            $.post(url, data, function(msg){
                if(msg){
                    alert("已发送成功");
                    sleepSendBtn();
                }else{
                    alert("系统繁忙");
                }
            },'json');
            
        }
    });

        
    function sleepSendBtn(){
   	   var time = 60;
        var interval = setInterval(function(){
            --time;
            if(time >= 0){
            	    $('.tel_vcode').css('opacity','0.5').text(time+'秒后重发');
            }
            if(time < 0){
               	$('.tel_vcode').css('opacity','1').text('获取短信验证码');
                clearInterval(interval);
            }
        },1000); 
    };
    
});