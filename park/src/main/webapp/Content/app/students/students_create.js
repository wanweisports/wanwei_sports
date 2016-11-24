(function ($) {
    var Students_Create = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 注册信息
            $(".register-student").on("click", function (e) {
                e.preventDefault();

                var $form = $("#student_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/students/saveStudent', conditions, function (res) {
                    var data = res.data;

                    if (res.code != 1) {
                        console.log(res.message || "学生信息注册失败, 请稍后重试");
                        alert(res.message || "学生信息注册失败, 请稍后重试");
                        return;
                    }

                    $('[name="memberId"]').val(data.memberId);
                    conditions.memberId = data.memberId;
                    $.post('/member/saveMemberCar', conditions, function (res) {
                        $form.attr("submitting", "");

                        if (res.code == 1) {
                            $("#tips_success_modal").modal({show: true, backdrop: false});
                            setTimeout(function () {
                                $("#tips_success_modal").modal("hide");
                                location.assign('/students/list');
                            }, 3000);
                        } else {
                            console.log(res.message || "学生绑卡失败, 请稍后重试");
                            alert(res.message || "学生绑卡失败, 请稍后重试");
                        }
                    });
                });
            });
        }
    };

    Students_Create.init();
})(jQuery);
