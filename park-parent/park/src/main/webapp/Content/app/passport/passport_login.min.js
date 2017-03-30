(function ($) {
    // 表单校验配置
    $(document).ready(function () {
        $('#form_login').validate({
            ignore: ":hidden"
        });
    });

    // 登录跳转
    $(".btn-login").on("click", function (e) {
        e.preventDefault();

        var $form = $("#form_login");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('/passport/submitUserLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.href = "/home/index";
            } else {
                alert(res.message || "用户登录失败, 请稍后重试");
            }
        });
    });
})(jQuery);
