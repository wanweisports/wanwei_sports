!function(t){t(document).ready(function(){t("#form_login").validate({ignore:":hidden"})}),t(".btn-login").on("click",function(i){i.preventDefault();var n=t("#form_login"),e=n.serialize();return!("submitting"==n.attr("submitting")||!n.valid())&&(n.attr("submitting","submitting"),void t.post("/passport/submitUserLogin",e,function(t){n.attr("submitting",""),1==t.code?location.href="/home/index":alert(t.message||"用户登录失败, 请稍后重试")}))})}(jQuery);