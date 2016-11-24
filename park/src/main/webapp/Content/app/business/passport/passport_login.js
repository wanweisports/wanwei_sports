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

        $.post('/business/passport/userLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.assign($('[name="return_url"]').val());
            } else {
                console.log(res.message || "用户登录失败, 请稍后重试");
                alert(res.message || "用户登录失败, 请稍后重试");
            }
        });
    });
})(Zepto);
