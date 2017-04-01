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

        $.post('/pp/userLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.href = '/home/dashboard';
            } else {
                alert(res.message || "用户登录失败");
            }
        });
    });
})(Zepto);
