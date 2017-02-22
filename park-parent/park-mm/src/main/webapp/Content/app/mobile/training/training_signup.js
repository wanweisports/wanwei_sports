(function ($) {

    $("#student_name").on('input', function (e) {
        e.preventDefault();

        if (/^\s*$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#student_mobile").on('input', function (e) {
        e.preventDefault();

        if (!/^1\d{10}$/.test($(this).val())) {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");
        }
    });

    $("#class_id").on('change', function (e) {
        e.preventDefault();

        if ($(this).val() == "0") {
            $(this).parents(".weui-cell").addClass("weui-cell_warn");
        } else {
            $(this).parents(".weui-cell").removeClass("weui-cell_warn");

            $.post('/mobile/training/classInfo', {classId: $(this).val()}, function (res) {
                if (res.code == 1) {
                    $("#pay_price").val(res.data.classInfo.classPrice);
                } else {
                    $.logConsole('查询班级详情失败', res.message);
                    $.tipsWarningAlert(res.message || '查询班级详情失败');
                }
            });
        }
    });

    // 提交报名
    $("#confirm_signup").on("click", function (e) {
        e.preventDefault();

        var $form = $("#signup_form");
        var conditions = $form.serialize();

        $("#student_name").trigger("input");
        $("#student_mobile").trigger("input");
        $("#class_id").trigger("change");

        if ($(".weui-cell_warn").size() > 0) {
            return false;
        }

        if ($form.attr("submitting") == "submitting") {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('/mobile/training/signTrainsStudents', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                //支付
                $.tipsSuccessAlert('报名成功！', function () {
                    location.assign('/mobile/training/students?classId=' + $("#class_id").val());
                });
            } else {
                $.logConsole('用户报名失败', res.message);
                $.tipsWarningAlert(res.message || '用户报名失败');
            }
        });
    });
})(Zepto);
