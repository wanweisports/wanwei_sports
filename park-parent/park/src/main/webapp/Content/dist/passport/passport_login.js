!function(t){t(document).ready(function(){t("#login_form").validate({ignore:":hidden"})}),t(".login-btn").on("click",function(n){n.preventDefault();var i=t(this).button("loading"),o=t("#login_form"),e=o.serialize();return!("submitting"==o.attr("submitting")||!o.valid())&&(o.attr("submitting","submitting"),void t.post("/passport/submitUserLogin",e,function(n){o.attr("submitting",""),1==n.code?location.assign(t('[name="return_url"]').val()):(console.log(n.message||"用户登录失败, 请稍后重试"),alert(n.message||"用户登录失败, 请稍后重试")),i.button("reset")}))})}(jQuery);