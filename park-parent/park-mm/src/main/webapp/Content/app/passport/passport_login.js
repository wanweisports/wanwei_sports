(function ($) {
    // 表单校验配置
    $(document).ready(function () {
        $('#login_form').validate({
            ignore: ":hidden"
        });
    });

    // 登录跳转
    $(".login-btn").on("click", function (e) {
        e.preventDefault();

        var $btn = $(this).button('loading');

        var $form = $("#login_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('passport/submitUserLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.assign("");
            } else {
                console.log(res.message || "用户登录失败, 请稍后重试");
                alert(res.message || "用户登录失败, 请稍后重试");
            }

            $btn.button('reset');
        });
    });
})(jQuery);
