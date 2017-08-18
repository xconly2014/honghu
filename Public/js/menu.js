/**
 * Created by Administrator on 15-1-15.
 */
/*function test(that){
	console.log("sdfgdfgsdfg");
        	 //$(that).parent().parent().find("h1").toggle("click");
        	 
         }*/

$(document).ready(function(){
	
/*    $(".text").hide();
	$(".text").eq(0).show();
	
    $(".box h1").click(function(){
    	//console.log("dfdf");
    	$(".text").hide();
        $(this).next(".text").slideToggle(1000);
    });
   
    $('.text li').click(function(){
    	 $(".text").hide();
    	 $(this).parent().show();
    	 test(this);
    });*/
	
	
	$(".box h1").click(function(){
        $(this).next(".text").slideToggle("slow");
    });
	
});

