$(document).ready(function(){
    addMethod();
    $("#bm_requirement_form").validate(window.requirement_form_option, true);
    $("#bm_requirement_account_form").validate(window.requirement_account_option, true);
    $("#mb_verify_requirement").validate(window.verify_requirement_option, true);
    
    
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