$(document).ready(function(){
    addMethod();
    $("#bm_nickname_register").validate(window.nickname_option, true);
    $("#bm_tel_register").validate(window.tel_option, true);

    $('#bm_tel_register #code').focus(function(){
    	$('#bm_tel_register .clear').next().remove();
    	$('#check_vcode_btn').css('opacity','0.5').prop("disabled",true);
  });

    $('#bm_tel_register #code').blur(function(){
       var vcode = $('#code').val();

       $.post('ajax_check_vcode',{vcode:vcode},function(msg){
          if(msg){
               $('#check_vcode_btn').css('opacity','1').removeAttr('disabled');
            }else{
            	$('#check_vcode_btn').css('opacity','0.5').attr('disabled','disabled');
            }
          },'json');
     });
   
    $('#check_vcode_btn').click(function(){
        var tel = $.trim($('#tel').val());
        var tel_error = $("#tel-error").html();
        if(tel == '' || !tel_error == ''){
        	alert('请填写可用手机号码');
        	return false;
        }
    	
    	$.post("ajax_send_msg",{tel:tel},function(msg){
			if(msg){
				alert('手机短信已发送');
        sleepSendBtn();
			}else{
				alert('系统繁忙');
			}
		},'json');
    	
    });
    
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