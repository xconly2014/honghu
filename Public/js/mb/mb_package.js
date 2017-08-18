$(document).ready(function(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");
    $("#package_form").validate(window.publish_option,true);
    $("#game_account_form").validate(window.buy_package_option,true);


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
            $('#uploadImg').after("<label style='color:red'>请上传游戏图片</label>");
        }else{
            $('#uploadImg').next().remove();
        }
    });      
});

function check(){
    $('#uploadImg').trigger('mouseout');
}