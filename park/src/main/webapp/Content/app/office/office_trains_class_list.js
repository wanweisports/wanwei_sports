(function ($, moment) {
    var Office_Trains_Class = {
        opts: {
            URL: '/office/getTrainsClassList'
        },
        init: function () {
            this.initEvents();

            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#start_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                minDate: 0
            });

            $(".class-start-select").on("click", function (e) {
                e.preventDefault();

                $('#start_date').datetimepicker("show");
            });

            $('#end_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                minDate: 0
            });

            $(".class-end-select").on("click", function (e) {
                e.preventDefault();

                $('#end_date').datetimepicker("show");
            });
        },
        initEvents: function () {
            var content = this;

            // 检索
            $(".trains-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#trains_filter_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 分页
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;
                var pageIndex = $(this).attr("data-index");

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(content.opts.URL + '?' + conditions + '&page=' + pageIndex);
                    } else {
                        location.assign(content.opts.URL + '?' + conditions.replace(/(page=)\d+/, '$1' + pageIndex));
                    }
                } else {
                    location.assign(content.opts.URL + '?page=' + pageIndex);
                }
            });

            function setTrainsClassInfo(data) {
                $("#add_class_modal").find("#class_id").val(data.id || '');
                $("#add_class_modal").find("#class_name").val(data.className || '');
                $("#add_class_modal").find("#course_name").val(data.courseId || '');
                $("#add_class_modal").find("#class_desc").val(data.classRemark || '');
                $("#add_class_modal").find("#start_date").val(data.startTime || '');
                $("#add_class_modal").find("#end_date").val(data.endTime || '');
                $("#add_class_modal").find("#leader_teacher").val(data.leaderName || '');
                $("#add_class_modal").find("#contact_phone").val(data.leaderMobile || '');
                $("#add_class_modal").find("#class_price").val(data.classPrice || '0');
            }

            // 查询
            $(".class-list").on("click", ".class-view", function (e) {
                e.preventDefault();

                var classId = $(this).attr("data-id");

                $.post('office/viewTrainsClassInfo', {classId: classId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setTrainsClassInfo(data);
                    } else {
                        $.logConsole('查询班级详情失败', res.message);
                        $.tipsWarningAlert('查询班级详情失败');
                    }
                });
            });

            // 删除
            $(".class-list").on("click", ".class-delete", function (e) {
                e.preventDefault();

                var classId = $(this).attr("data-id");

                $.post('office/deleteTrainsClassInfo', {classId: classId}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('删除班级详情失败', res.message);
                        $.tipsWarningAlert('删除班级详情失败');
                    }
                });
            });

            // 增加通知
            $(".class-add").on("click", function (e) {
                e.preventDefault();

                setTrainsClassInfo({});
            });

            // 保存
            $(".class-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#class_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/saveTrainsClassInfo', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('班级信息保存失败', res.message);
                        $.tipsWarningAlert('班级信息保存失败');
                    }
                });
            });
        }
    };

    Office_Trains_Class.init();
})(jQuery, moment);
