var goods_option = {
		rules:{
        	recipient: "required",
            address:"required",
            tel:{
                required:true,
                mobile:true
            }
        },
        messages:{
        	recipient:"请填写收件人名称",
        	address:"请填写收件地址",
            tel:{
                required:"请填写收件人的手机号码",
                mobile:"手机号码格式错误"
            }
        }
};

function addMethod(){
    $.validator.addMethod("mobile", mobileFormat, "手机号码不足11位或者格式错误");
}
