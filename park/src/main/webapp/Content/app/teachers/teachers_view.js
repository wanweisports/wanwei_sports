(function ($) {
    var Teachers_View = {
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#memberBirthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                maxDate: 0
            });

            $(".member-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#memberBirthday').datetimepicker("show");
            });

            this.initEvents();
        },
        initEvents: function () {
            // 保存信息
            $(".save-member").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_form");
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
                            location.assign('/teachers/list');
                        }, 3000);
                    } else {
                        console.log(res.message || "教师信息保存失败, 请稍后重试");
                        alert(res.message || "教师信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Teachers_View.init();
})(jQuery);
