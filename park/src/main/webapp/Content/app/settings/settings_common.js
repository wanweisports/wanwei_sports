(function ($) {
    var Settings_Common = {
        init: function () {
            this.initEvents();
            this.initTimePicker();
        },
        // 初始化时间选择器
        initTimePicker: function () {
            // 营业开始时间
            $('#start_time').datetimepicker({
                datepicker: false,
                lang: "zh",
                format: "H:i",
                allowTimes: ['06:00','07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00',
                    '17:00','18:00','19:00','20:00','21:00','22:00','23:00'],
                step: 5
            });

            // 营业结束时间
            $('#end_time').datetimepicker({
                datepicker: false,
                lang: "zh",
                format: "H:i",
                allowTimes: ['06:00','07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00',
                    '17:00','18:00','19:00','20:00','21:00','22:00','23:00'],
                step: 5
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

                $.post('/settings/common', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal("show");
                    } else {
                        alert("常用设置失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Settings_Common.init();
})(jQuery);
