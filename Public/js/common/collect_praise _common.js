var collect_form_option = {
		rules: {
            contact:'required',
            type:'required',
            game:'required'
        },

        messages:{
            contact:'请填写正确的联系方式',
            type:'请选择您的兑换的类型',
            game:'请选择游戏'
        },
        submitHandler:function(form){
            if(check_img()){
                return form.submit();
            }
            return false;


        }
};



function showSelect(){
    $('#select').css('display','block');
}
function hideSelect(){
    $('#select').css('display','none');
}

$().ready(function(){
	if($("#uploadImages").length > 0 ){
        $("#uploadImages").kinFormUpload({
            length:1,
            zIndex:2,
            ext:'jpg,jpeg,png,gif'
        });
    }
});
