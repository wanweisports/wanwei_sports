(function ($) {
    var Office_Trains_Students = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            function setTrainsStudentsInfo(data) {
                $("#student_sign_modal").find("#students_class_id").val(data.id || '');
                $("#student_sign_modal").find("#students_sign_name").val(data.studentName || '');
                $("#student_sign_modal").find("#students_contact_phone").val(data.studentMobile || '');
                $("#student_sign_modal").find("#trains_sign_desc").val(data.remark || '');
                $("#student_sign_modal").find("#students_class_price").val(data.payPrice || '0');
                if (data.payStatus == 2) {
                    $("#student_sign_modal").find("#students_pay_status2").prop("checked", true);
                } else {
                    $("#student_sign_modal").find("#students_pay_status1").prop("checked", true);
                }
            }

            // 支付
            $(".sign-list").on("click", ".sign-pay", function (e) {
                e.preventDefault();

                var signId = $(this).attr("data-id");
                var classPrice = $(this).attr("data-price");

                $.post('office/getTrainsClassStudentsSign', {signId: signId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#student_pay_modal").find("#students_id").val(data.id || '');
                        $("#student_pay_modal").find("#students_paid_price").val(data.payPrice || '0');
                        $("#student_pay_modal").find("#trains_pay_remark").val(data.remark || '');
                        if (data.payStatus == 2) {
                            $("#student_pay_modal").find("#students_status2").prop("checked", true);
                        } else {
                            $("#student_pay_modal").find("#students_status1").prop("checked", true);
                        }
                    } else {
                        console.log(res.message || "查询报名详情失败, 请稍后重试");
                        alert(res.message || "查询报名详情失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".sign-list").on("click", ".sign-delete", function (e) {
                e.preventDefault();

                var signId = $(this).attr("data-id");

                $.post('office/deleteTrainsStudents', {signId: signId}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "删除报名详情失败, 请稍后重试");
                        alert(res.message || "删除报名详情失败, 请稍后重试");
                    }
                });
            });

            // 增加通知
            $(".add-sign").on("click", function (e) {
                e.preventDefault();

                setTrainsStudentsInfo({});
            });

            // 报名
            $(".sign-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#students_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/signTrainsStudents', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "报名信息保存失败, 请稍后重试");
                    }
                });
            });

            // 报名支付
            $(".pay-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#students_pay_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/payTrainsStudents', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "报名信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Office_Trains_Students.init();
})(jQuery);
