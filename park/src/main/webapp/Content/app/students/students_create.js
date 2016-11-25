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
                    if (res.code == 1) {
                        $("#tips_success_modal").modal({show: true, backdrop: false});
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.assign('/students/list');
                        }, 3000);
                    } else {
                        console.log(res.message || "学生信息办理失败, 请稍后重试");
                        alert(res.message || "学生信息办理失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Students_Create.init();
})(jQuery);
