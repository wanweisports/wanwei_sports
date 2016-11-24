(function ($) {
    var Teachers_View = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 保存信息
            $(".save-student").on("click", function (e) {
                e.preventDefault();

                var $form = $("#student_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveMember', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_success_modal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.assign('/students/list');
                        }, 3000);
                    } else {
                        console.log(res.message || "学生信息保存失败, 请稍后重试");
                        alert(res.message || "学生信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Teachers_View.init();
})(jQuery);
