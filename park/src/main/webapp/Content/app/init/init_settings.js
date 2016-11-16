(function ($) {
    var Init_Settings = {
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
                lang: "zh",
                format: "H:i",
                step: 60
            });

            // 营业结束时间
            $('#end_time').datetimepicker({
                datepicker: false,
                lang: "zh",
                format: "H:i",
                step: 60
            });
        },
        initEvents: function () {
            var content = this;

            $(".init-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#init_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/init/saveInit', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.assign('/');
                    } else {
                        alert(res.message || "初始化失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Init_Settings.init();
})(jQuery);
