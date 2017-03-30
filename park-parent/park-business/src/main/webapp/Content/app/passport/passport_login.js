(function ($) {
    // 登录跳转
    $(".login-btn").on("click", function (e) {
        e.preventDefault();

        var $form = $("#login_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting") {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('/passport/userLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                $.tipsSuccessAlert("用户登录成功！", function () {
                    location.href = $('[name="return_url"]').val();
                });
            } else {
                $.logConsole("passport", res.message || "用户登录失败");
                $.tipsWarningAlert(res.message || "用户登录失败");
            }
        });
    });
})(Zepto);
