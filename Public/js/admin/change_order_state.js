$().ready(function(){
	$('.state').click(function(){
		$(this).css('display','none');
		$(this).next().css('display','block');
	});
        	
        	
});

function change_state(url){
	$('select').change(function(){
		var state = $(this).val();
		var id = $(this).attr('class');
		$.post(url,{state:state,id:id},function(msg){
	    	if(msg.status){
	    		var selectNode = $('.'+id);
	    		selectNode.prev().css('display','block').html(msg.stateText);
	    		selectNode.css('display','none');
	    	}else{
	    		alert('修改失败！请刷新重新操作！');
	    	}
	    },'json');
		
	});
}