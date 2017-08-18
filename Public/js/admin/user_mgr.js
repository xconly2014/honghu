/**
 * Created by Administrator on 15-5-26.
 */
function powAll(id,checked){
    var str = '.' + id;
    if (checked) {
    $(str).prop("checked","checked");
    }else {
    $(str).removeAttr("checked");
    }
}

$().ready(function(){
	
	$("#admin_form").validate({
        onfocusout: function(element) { 
           $(element).valid();
       	},
        rules: {
        	group_id:"required",
        	user_id:{
        		required:true,
        		digits:true
        	}
        },
        messages:{
        	group_id:"请选择权限组",
        	user_id:{
        		required:'请填写用户ID',
        		digits:'ID必须为整数'       		
        	},
    	},
    	errorPlacement: function(error, element) {
            error.appendTo(element.parent());
            error.siblings("span").remove();
    	},
    	errorElement:"span",
    	success: function(span) {
    		span.attr("class","success");
    	},
       	submitHandler:function(form){
            form.submit();
        }      
    });
});
