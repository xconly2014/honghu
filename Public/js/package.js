$().ready(function(){
	$.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");
	$("#package_form").validate(window.publish_option);
    $("#game_account_form").validate(window.buy_package_option);
    //cash_desk_active();
    
    
    if($("#uploadImages").length > 0 ){
        $("#uploadImages").kinFormUpload({
            length:5,
            zIndex:2,
            ext:'jpg,jpeg,png,gif'
        });
    }
    
    $('#uploadImg').mouseout(function(){
        var num = $('i').html();
        if(num == 0){
            $('#uploadImg').next().remove();
            $('#uploadImg').after("<label class='error'>请上传游戏图片</label>");
        }else{
            $('#uploadImg').next().remove();
            $('#uploadImg').after("<label class='success'></label>");
        }
    });    

    $(".platform_ios").click(function(){
        $(".game_operator").css("display","none");
    });

    $('.platform_android').click(function(){
        $('.game_operator').css('display','inline-block');
    });
    
});

function check(){
	$('#uploadImg').trigger('mouseout');
}