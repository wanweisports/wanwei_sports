(function ($) {
    // 表单校验配置
    $(document).ready(function () {
        $('#member_form').validate({
            ignore: ":hidden"
        });
    });

    // 登录跳转
    $(".login-btn").on("click", function (e) {
        e.preventDefault();

        var $form = $("#login_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('/passport/submitUserLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.assign($('[name="return_url"]').val());
            } else {
                alert("用户登录失败, 请稍后重试");
            }
        });
    });
})(jQuery);
