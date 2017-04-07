(function ($) {
    var Passport_Profile = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 密码修改提交
            $(".password-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#center_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('passport/updatePwd', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('密码重置成功！', function () {
                            location.reload();
                        });
                    } else {
                        $.logConsole('密码重置失败', res.message);
                        $.tipsWarningAlert('密码重置失败');
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(jQuery);
