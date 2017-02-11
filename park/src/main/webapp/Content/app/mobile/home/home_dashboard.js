(function ($) {
    /**** 登录 ****/

    $('.login-dialog-show').on('click', function(){
        $(".login-dialog").show();
    });

    $('.logout-confirm').on('click', function(){
        $.post('/mobile/passport/userLogout', {}, function (res) {
            if (res.code == 1) {
                location.reload();
            } else {
                $.logConsole('用户退出登录失败', res.message);
                $.tipsWarningAlert(res.message || '用户退出登录失败');
            }
        });
    });

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

    // 登录取消
    $(".login-cancel").on("click", function (e) {
        e.preventDefault();

        $(".login-dialog").hide();
    });

    // 登录跳转
    $(".login-confirm").on("click", function (e) {
        e.preventDefault();

        var $form = $("#login_form");
        var conditions = $form.serialize();

        $("#password").trigger("input");
        $("#mobile").trigger("input");

        if ($(".weui-cell_warn").size() > 0) {
            $.tipsWarningAlert('请输入合法的手机号和密码');
            return false;
        }

        if ($form.attr("submitting") == "submitting") {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('/mobile/passport/userLogin', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.reload();
            } else {
                $.logConsole('用户登录失败', res.message);
                $.tipsWarningAlert(res.message || '用户登录失败');
            }
        });
    });
})(Zepto);
