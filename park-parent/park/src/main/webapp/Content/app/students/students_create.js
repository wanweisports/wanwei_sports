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
                        $.tipsSuccessAlert('学生办卡成功！', function () {
                            location.assign('/students/list');
                        });
                    } else {
                        $.logConsole('学生办卡失败', res.message);
                        $.tipsWarningAlert('学生办卡失败');
                    }
                });
            });
        }
    };

    Students_Create.init();
})(jQuery);
