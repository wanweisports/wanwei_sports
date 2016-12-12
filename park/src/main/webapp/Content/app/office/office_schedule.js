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

            function setScheduleInfo(data) {
                $("#schedule_modal").find("#user_schedule_id").val(data.schedulingId || '');
                $("#schedule_modal").find("#user_schedule_date").val(data.date || '');
                $("#schedule_modal").find("#user_schedule_start").val(data.startTime || '');
                $("#schedule_modal").find("#user_schedule_end").val(data.endTime || '');
                $("#schedule_modal").find("#user_schedule_operator").val(data.operatorId || '');
                $("#schedule_modal").find("#user_schedule_job").val(data.schedulingJob || '');

                if (data.schedulingId) {
                    $("#user_schedule_delete").show();
                } else {
                    $("#user_schedule_delete").hide();
                }
            }

            // 增加
            $(".add-schedule").on("click", function (e) {
                e.preventDefault();

                setScheduleInfo({});
            });

            // 查询
            $(".edit-schedule").on("click", function (e) {
                e.preventDefault();

                var schedulingId = $(this).attr("data-id");

                $.post('office/scheduleInfo', {schedulingId: schedulingId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setScheduleInfo(data);
                    } else {
                        console.log(res.message || "查询值班详情失败, 请稍后重试");
                        alert(res.message || "查询值班详情失败, 请稍后重试");
                    }
                });
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

            // 删除
            $("#user_schedule_delete").on("click", function (e) {
                e.preventDefault();

                $.post('office/deleteSchedule', {schedulingId: $("#user_schedule_id").val()}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "值班信息删除失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Office_Schedule.init();
})(jQuery);
