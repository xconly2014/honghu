$(document).ready(function(){
    addMethod();
    $("#trade_center_form").validate(window.trade_center_option, true);
    $("#account_trade_form").validate(window.account_trade_option, true);
    $("#mb_account_trade_verify").validate(window.account_trade_verify_option,true);
    
    $("#platform_ios").click(function(){
	     $("#operators").css("display","none");
	 });

	 $('#platform_android').click(function(){
	     $('#operators').css('display','inline-block');
	 });
	 
	 
	 $('#uploadImg').mouseout(function(){
	        var num = $('i').html();
	        if(num == 0){
	            $('#uploadImg').next().remove();
	            $('#uploadImg').after("<label style='color:red'>请上传游戏图片</label>");
	        }else{
	            $('#uploadImg').next().remove();
	        }
	  });
	 
});

function check(){
	$('#uploadImg').trigger('mouseout');
}