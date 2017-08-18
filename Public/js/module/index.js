$().ready(function(){
	
	$('#slideboxContainer').slideBox({
        direction : 'left',//left,top#方向
        duration : 0.3,//滚动持续时间，单位：秒
        delay : 10,//滚动延迟时间，单位：秒
        startIndex : 0,//初始焦点顺序
        easing : 'linear',//swing,linear//滚动特效
        hideClickBar : false,//不自动隐藏点选按键
        clickBarRadius : 20,
        hideBottomBar : false//隐藏底栏
    });
	
	$.post("Index/ajax_get_iossc_list",function(msg){
		if(msg){
			var lis ='';
			$(msg).each(function(i,item){
				 lis += "<a href="+item.url+"><li>"+item.details+"<span>"+item.name+"</span></li></a>";
			});
			$('#iossc').append(lis);
		}
	},'json');
	
	$.post("Index/ajax_get_androidsc_list",function(msg){
		if(msg){
			var lis ='';
			$(msg).each(function(i,item){
				 lis += "<a href="+item.url+"><li>"+item.details+"<span>"+item.name+"</span></li></a>";
			});
			$('#androidsc').append(lis);
		}
	},'json');
	
	$.post("Index/ajax_get_strategy_list",function(msg){
		if(msg){
			var lis ='';
			$(msg).each(function(i,item){
				 lis += "<a href="+item.url+"><li><label>"+item.title+"</label><span>"+item.game_name+"</span></li></a>";
			});
			$('#strategy_ul').append(lis);
		}
	},'json');
	
	
	$.post("Index/ajax_get_evoluation_list",function(msg){
		if(msg){
			var lis ='';
			$(msg).each(function(i,item){
				 lis += "<a href="+item.url+"><li><label>"+item.title+"</label><span>"+item.game_name+"</span></li></a>";
			});
			$('#evoluation_ul').append(lis);
		}
	},'json');
    
	
	$.post("Index/ajax_get_czpackage_list",function(msg){
		if(msg){
			var lis ='';
			$(msg).each(function(i,item){
				 lis += "<a href="+item.url+"><li>"+item.option_text+"<span>"+item.price+"元</span></li></a>";
			});
			$('#czpackage_ul').append(lis);
		}
	},'json');
	
	
	$.post("Index/ajax_get_czios_list",function(msg){
		if(msg){
			var czios = '';
			var lis = '';
			for(var p in msg.gameList){
				czios = "<div class='letter_bar_tc' style='display:none;' id="+p+"></div>";
				$('#czios_list').append(czios);
				$(msg.gameList[p]).each(function(i,item){
					 lis = "<li class='cz_game_info'><a href="+item.url+"><img src='/game_pic/"+item.pic+"'alt="+item.pic+" width='90px' height='90px'/><p>"+item.name+"</p></a></li>";
					 $('#'+p).append(lis);
				});
			}
		}
	},'json');
	
	
	
	
	
	$('#home_login_btn').toggle(function(){
		$('#home_login_window').show();
	},function(){
        $('#home_login_window').hide();
    });

    $('#tab_title > li').click(function(){
        var tab_content_id = $(this).attr('name');
        $('#tab_title > li').removeClass('click');
        $(this).addClass('click');
        $("#tab_content > div").hide();
        $("#tab_content > div[id="+tab_content_id+"]").css('display', "block");
    });

    $('#game_strategy_evoluation_title > li').click(function(){
        var tab_content_id = $(this).attr('name');
        $('#game_strategy_evoluation_title > li').removeClass('click');
        $(this).addClass('click');
        $("#game_strategy_evoluation_content > div").hide();
        $("#game_strategy_evoluation_content > div[id="+tab_content_id+"]").css('display', "block");
    });
    
    $(".cz_game_container .letter_bar_content .letter_bar_tc").addClass("sleep");
    $(".cz_game_container .letter_bar>li>a").click(function(e){
        var letter = this.innerHTML
        $(".cz_game_container .letter_bar>li>a").removeClass("tab_on");
        $(this).addClass('tab_on');

        $(".cz_game_container .letter_bar_content .letter_bar_tc").css('display','none');
        $(".cz_game_container .letter_bar_content .letter_bar_tc[id="+letter+"]").css('display','block');
    });
    
    
    $(".suggest_game_list > a > img").each(function(){
        var picPath = $(this).attr('alt');
        $(this).attr('src', "" + "/game_pic/" + picPath);
    });
    
    $('#close').click(function(){
    	$('.top_notice').hide();
    	$('.logo_bar').css('top','45px');
    });
    
    
    fixeds();
    $(window).resize(function () {
       fixeds();
    });

    $(".go_top").click(function () {
        $('html,body').animate({scrollTop: '0px'}, 300);
        $(this).find("a").blur();
        return false;
    });
    var fixedheight = $(".fixed").height();

    $(window).scroll(function () {
        goTop();
    });
   goTop();
    if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
       $(".fixed").css({"position": "absolute", "bottom": document.body.clientHeight - document.documentElement.scrollTop + document.body.scrollTop - document.documentElement.clientHeight + 160})
    }

    var li = $('.package_requirement_title > li');
    var liLength =li.length;
    var ul = $('.package_requirement_content > ul');
    for(var i = 0; i < liLength; i++){
        li[i].index = i;

        li[i].onclick = function(){
            for(var i = 0; i < liLength; i++){
                if(li[i] && ul[i]){
                    li[i].className='';
                    ul[i].style.display='none';
                }
            }
            if(ul[this.index]){
                this.className='selected';
                ul[this.index].style.display='block';
            }

        }
    }
	

});


function fixeds() {
    $(".float_right").each(function () {
       var windowwidth = document.documentElement.clientWidth;
       var fixedwidth = $(this).width();
       var kszone = ( windowwidth - 1020 ) / 2 ;
       if (kszone >= fixedwidth) {
           $(this).css("right", kszone - fixedwidth);
       }
       else {
           $(this).css("right", "10px");
       }
       $(this).fadeIn();
   });

   $(".fixed").each(function () {
       var windowwidth = document.documentElement.clientWidth;
       var fixedwidth = $(this).width();
       var kszone = ( windowwidth - 1020 ) / 2 - 10;
       if (kszone >= fixedwidth) {
           $(this).css("left", kszone - fixedwidth);
       }
       else {
           $(this).css("left", "10px");
       }
       $(this).fadeIn();
   });
   $(".fixeda").each(function () {
       var windowwidth = document.documentElement.clientWidth;
       var fixedwidth = $(this).width();
       var kszone = ( windowwidth - 1000 ) / 2 - 10;
       if (kszone >= fixedwidth) {
           $(this).css("left", kszone - fixedwidth);
       }
       else {
           $(this).css("left", "10px");
       }
       $(this).fadeIn();
   });
}

function goTop() {
   if (document.documentElement.scrollTop + document.body.scrollTop > 100) {
       $(".go_top").fadeIn();
       $(".fixeda").css("top", "430px");
   }
   else {
       $(".go_top").fadeOut("normal", function () {
           $(".fixeda").css("top", "430px");
       });
   }
   if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
       $(".fixed").css({"position": "absolute", "bottom": document.body.clientHeight - document.documentElement.scrollTop + document.body.scrollTop - document.documentElement.clientHeight + 160});
   }
}

   setTimeout(function(){
   $("iframe:eq(1)").contents().find(".launchBtn").removeClass('bg');
   $("iframe:eq(1)").contents().find(".launchBtn").append('<p style="margin-top: 5px;line-height: 12px;font-size: 12px;margin-left: -10px;color: #777;font-family: Microsoft YaHei, Helvetica Neue, Helvetica, Arial, sans-serif;">QQ咨询</p>');
}, 1000);
