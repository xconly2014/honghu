function mobileFormat(value,element){var length=value.length;var mobile=/^1[34578][0-9]{9}$/;return this.optional(element)||(length==11&&mobile.test(value));}
function userNameFormat(value,element){var regExp=/^[a-zA-Z0-9_]{6,18}$/;return regExp.test(value);}
function checkPass(value,element){var combination=/^(?![^a-zA-Z]+$)(?!\D+$)/;return this.optional(element)||(combination.test(value));}
function checkID(value,element){var length=value.length;var ID=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;return this.optional(element)||(ID.test(value));}
function updateError(errorMsg){$("#info").text(errorMsg);}
function close_dlg()
{$('.theme-popover-mask').fadeOut(100);$('.theme-popover').slideUp(200);}
function open_dlg()
{$('.theme-popover-mask').fadeIn(100);$('.theme-popover').slideDown(200);}
function login_user(){var username=$.trim($("#uname").val());var password=$.trim($("#upwd").val());if(username==''){updateError("用户名不能为空");return false;}
if(password==''){updateError("密码不能为空");return false;}
$('.loading_login').css('display','block');
var url="/Login/ajaxLogin.html";$.post(url,{username:username,password:password},function(msg){$('.loading_login').css('display','none');if(msg.status){is_login=true;close_dlg();update_login_window(msg.data.info,msg.data.head);}else{updateError(msg.data);return false;}},'json');return false;}
function update_login_window(ul_text,head_info){if($('#home_login_window')){updateError("");$('#home_login_window').removeClass('login_float_out');$('#home_login_window').addClass('login_float_in');$('#home_login_window').empty();$('#home_login_window').html(ul_text);$('.top_quick_bar_left').empty();$('.top_quick_bar_left').html(head_info);}}
$(document).ready(function(){$('#uname').focus(function(){$('#info').text('');});$('#upwd').focus(function(){$('#info').text('');});$('#login').click(login_user);});
