(function ($) {
    var Teachers_Create = {
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
            $(".register-member").on("click", function (e) {
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
                        $("#tips_success_modal").modal({show: true, backdrop: false});
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.assign('/teachers/list');
                        }, 3000);
                    } else {
                        alert(res.message || "场馆基础信息设置失败, 请稍后重试");
                        console.log(res.message || "场馆基础信息设置失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Teachers_Create.init();
})(jQuery);
