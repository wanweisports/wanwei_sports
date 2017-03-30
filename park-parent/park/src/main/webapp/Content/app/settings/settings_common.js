(function ($) {
    var Settings_Common = {
        init: function () {
            this.initEvents();
            this.initTimePicker();
        },
        // 初始化时间选择器
        initTimePicker: function () {
            $.datetimepicker.setLocale('zh');

            // 营业开始时间
            $('#start_time').datetimepicker({
                datepicker: false,
                format: "H:i",
                step: 60
            });

            // 营业结束时间
            $('#end_time').datetimepicker({
                datepicker: false,
                format: "H:i",
                step: 60
            });
        },
        initEvents: function () {
            // 所有常用设置
            $(".common-save").on("click", function (e) {
                e.preventDefault();

                var $form = $("#common_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/settings/saveCommon', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('场馆基础信息设置成功！', function () {
                            window.location.reload();
                        });
                    } else {
                        $.logConsole('场馆基础信息设置失败', res.message);
                        $.tipsWarningAlert('场馆基础信息设置失败');
                    }
                });
            });
        }
    };

    Settings_Common.init();
})(jQuery);
