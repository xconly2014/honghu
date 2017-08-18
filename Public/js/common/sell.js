function setGameName(name, id){
    $('.name').text(name);
    $('.form_name').val(id);
}
    
function setType(type){
     if(type !='3'){
          $('.error_msg').css('display','none');
     }
     var typeValue = $("input[name='type']:checked").val();
     var typeText = $("input[name='type']:checked")[0].nextSibling.nodeValue;

     $('.type').text(typeText);
     $('.form_type').val(typeValue);
}


function check(is_trainer){
	
    if($('.form_name').val() == ""){
        alert("请先选择游戏");
        return false;
    }

    if($('.form_type').val() == ""){
        alert("请选择类型");
        return false;
    }
    if($('.form_type').val() == '3' && is_trainer == ''){
       
        $('.error_msg').show();
        return false;
    }

    return true;
}