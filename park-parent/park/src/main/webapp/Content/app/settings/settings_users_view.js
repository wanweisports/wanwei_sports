(function ($) {
    var Settings_Users_View = {
        init: function () {
            this.initEvents();
            this.initDatePicker();
        },
        // 初始时间选择
        initDatePicker: function () {
            $.datetimepicker.setLocale('zh');

            // 生效时间
            $('#start_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0
            });

            // 截止时间
            $('#end_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0
            });

            // 员工生日
            $('#data_birthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                maxDate: 0
            });
        },
        initEvents: function () {
            // 用户设置
            $(".users-save").on("click", function (e) {
                e.preventDefault();

                var $form = $("#users_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/settings/saveEmployee', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('员工信息设置成功！', function () {
                            location.href = "/settings/getUsers";
                        });
                    } else {
                        $.logConsole('员工信息设置失败', res.message);
                        $.tipsWarningAlert('员工信息设置失败');
                    }
                });
            });
        }
    };

    Settings_Users_View.init();
})(jQuery);
