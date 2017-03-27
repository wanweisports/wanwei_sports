(function ($) {

    $("#class_name").on('input', function (e) {
        e.preventDefault();

        if (!/^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#course_id").on('change', function (e) {
        e.preventDefault();

        if ($(this).val() == "0") {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#start_time").on('input', function (e) {
        e.preventDefault();

        if (!/^\d{4}-\d{2}-\d{2}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#end_time").on('input', function (e) {
        e.preventDefault();

        if (!/^\d{4}-\d{2}-\d{2}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#leader_name").on('input', function (e) {
        e.preventDefault();

        if (!/^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#leader_mobile").on('input', function (e) {
        e.preventDefault();

        if (!/^1\d{10}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#class_price").on('input', function (e) {
        e.preventDefault();

        if (!/^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    // 班级创建
    $("#confirm_create").on("click", function (e) {
        e.preventDefault();

        var $form = $("#class_form");
        var conditions = $form.serialize();

        $("#class_name").trigger("input");
        $("#course_id").trigger("change");
        $("#start_time").trigger("input");
        $("#end_time").trigger("input");
        $("#leader_name").trigger("input");
        $("#leader_mobile").trigger("input");
        $("#class_price").trigger("input");

        if ($(".weui-cell_warn").size() > 0) {
            return false;
        }

        if ($form.attr("submitting") == "submitting") {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('/business/training/saveTrainsClassInfo', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                $.tipsSuccessAlert('班级创建成功！', function () {
                    location.assign('/business/training/list');
                });
            } else {
                $.logConsole('班级创建成功失败', res.message);
                $.tipsWarningAlert(res.message || '班级创建成功失败');
            }
        });
    });
})(Zepto);
