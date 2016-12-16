(function ($, moment) {
    var Office_Trains_Course = {
        opts: {
            URL: '/office/getTrainsCourseList'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索
            $(".course-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#course_filter_form").serialize();

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

            function setTrainsCourseInfo(data) {
                $("#add_course_modal").find("#course_id").val(data.id || '');
                $("#add_course_modal").find("#course_no").val(data.courseNo || moment().format('YYYYMMDDHHmmss'));
                $("#add_course_modal").find("#course_name").val(data.courseName || '');
                $("#add_course_modal").find("#course_remark").val(data.courseRemark || '');
            }

            // 查询
            $(".course-list").on("click", ".course-view", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('office/viewTrainsCourseInfo', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setTrainsCourseInfo(data);
                    } else {
                        console.log(res.message || "查询课程详情失败, 请稍后重试");
                        alert(res.message || "查询课程详情失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".course-list").on("click", ".course-delete", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('office/deleteTrainsCourseInfo', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "删除课程详情失败, 请稍后重试");
                        alert(res.message || "删除课程详情失败, 请稍后重试");
                    }
                });
            });

            // 增加通知
            $(".course-add").on("click", function (e) {
                e.preventDefault();

                setTrainsCourseInfo({});
            });

            // 保存
            $(".course-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#course_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/saveTrainsCourseInfo', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "课程信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Office_Trains_Course.init();
})(jQuery, moment);
