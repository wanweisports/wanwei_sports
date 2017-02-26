(function ($) {

    $("#mobile").on('input', function (e) {
        e.preventDefault();

        if (!/^1\d{10}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#password").on('input', function (e) {
        e.preventDefault();

        if (!/^[A-Za-z0-9\^\$\.\+\*_@!#%&amp;~=-]{6,32}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#confirm").on('input', function (e) {
        e.preventDefault();

        if ($("#password").val() != $(this).val()) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    // 注册跳转
    $(".reg-btn").on("click", function (e) {
        e.preventDefault();

        var $form = $("#login_form");
        var conditions = $form.serialize();

        $("#password").trigger("input");
        $("#mobile").trigger("input");
        $("#confirm").trigger("input");

        if ($(".weui-cell_warn").size() > 0) {
            $.tipsWarningAlert('请输入合法的手机号和密码');
            return false;
        }

        if ($form.attr("submitting") == "submitting") {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('mobile/passport/userLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.assign($('[name="return_url"]').val());
            } else {
                $.logConsole('用户登录失败', res.message);
                $.tipsWarningAlert(res.message || '用户登录失败');
            }
        });
    });
})(Zepto);
