(function ($) {
    var Passport_Profile = {
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#user_birthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                maxDate: 0
            });

            $(".user-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#user_birthday').datetimepicker("show");
            });

            this.initEvents();
        },
        initEvents: function () {
            // 完善提交
            $(".profile-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#center_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('passport/updateProfile', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({show: true, backdrop: false});
                        setTimeout(function () {
                            $("#tips_modal").modal("hide");
                        }, 3000);
                    } else {
                        alert(res.message || "完善信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(jQuery);
