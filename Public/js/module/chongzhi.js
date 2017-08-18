$().ready(function(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码格式错误");

    $("#cz_info_form").validate(window.chongzhi_option);
    get_sum();
});