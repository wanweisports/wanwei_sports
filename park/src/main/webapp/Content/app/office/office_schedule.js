(function ($) {
    var Office_Schedule = {
        opts: {
            URL: '/office/schedule'
        },
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#user_schedule_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                minDate: 0
            });

            // 开始时间
            $('#user_schedule_start').datetimepicker({
                datepicker: false,
                format: "H:i",
                step: 30,
                value: '06:00'
            });

            // 结束时间
            $('#user_schedule_end').datetimepicker({
                datepicker: false,
                format: "H:i",
                step: 30,
                value: '22:00'
            });

            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 筛选
            $(".data-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#data_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 提交
            $("#user_schedule_submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#user_schedule_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/saveSchedule', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#tips_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        alert(res.message || "值班信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Office_Schedule.init();
})(jQuery);
