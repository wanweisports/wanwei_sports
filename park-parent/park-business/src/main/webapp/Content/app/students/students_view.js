(function ($) {
    var Students_View = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 保存信息
            $(".save-student").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#student_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/students/saveStudent', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('学生信息保存成功！', function () {
                            location.assign('/students/list');
                        });
                    } else {
                        $.logConsole('学生信息保存失败', res.message);
                        $.tipsWarningAlert('学生信息保存失败');
                    }

                    $btn.button('reset');
                });
            });
        }
    };

    Students_View.init();
})(jQuery);
