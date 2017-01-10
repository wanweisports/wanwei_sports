(function ($) {
    var Passport_Profile = {
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#user_birthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d'
            });

            $(".user-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#user_birthday').datetimepicker("show");
            });

            this.initEvents();
        },
        initEvents: function () {
            // 完善提交
            $(".profile-submit").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#center_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('passport/updateProfile', conditions, function (res) {
                    $form.attr("submitting", "");
                    $btn.button('reset');

                    if (res.code == 1) {
                        $.tipsSuccessAlert('完善信息成功！', function () {
                            location.reload();
                        });
                    } else {
                        $.logConsole('完善信息失败', res.message);
                        $.tipsWarningAlert('完善信息失败');
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(jQuery);
