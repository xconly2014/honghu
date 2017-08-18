$(document).ready(function(){
	addMethod();
	$("#mb_tel_form").validate(window.tel_form_option,true);
	$("#mb_auth_tel").validate(window.auth_tel_option,true);
	$("#mb_updatePass_form").validate(window.updatePass_form_option,true);


    $('#code').focus(function(){
    	$('#check_vcode_btn').css('opacity','0.5');
    	$('#check_vcode_btn').prop("disabled",true)
  });
    
	
    $('#code').blur(function(){
        var vcode = $('#code').val();
            $.post('ajax_check_vcode',{vcode:vcode},function(msg){
            	if(msg){
            		$('#check_vcode_btn').css('opacity','1');
            		$('#check_vcode_btn').removeAttr('disabled');
            	}else{
            		$('#check_vcode_btn').css('opacity','0.5');
            	}
            },'json');
     });
    
    
    
    //发送手机短信验证码
	$('#check_vcode_btn').click(function(){
		var ticket = $("#tel_value").text();
		var type = 'tel';
		sleepSendBtn();
		$.post("ajax_send_code",{ticket:ticket,type:type},function(msg){
			mui.toast(msg.data);
		},'json');
	});	
    
    
	  
});


function updateError(errorMsg){
    mui.toast(errorMsg);
}


function sleepSendBtn(){
	var time = 60;
    var interval = setInterval(function(){
        --time;
        if(time >= 0){
             $('#check_vcode_btn').val('重发'+time).css('opacity','0.5').prop("disabled",true);
        }
        if(time < 0){
            $('#check_vcode_btn').removeAttr('disabled').css('opacity','1').val('获取短信验证码');
            clearInterval(interval);
        }
    },1000); 
}


function mbSetProgressBar(step){
	  var divNote = $('.step div');
	  for(var i=0;i < step;i++ ){
		  $(".step div").eq(i).children().addClass('selected');
	  }
}

