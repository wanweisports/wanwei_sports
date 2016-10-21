(function ($) {
    var Passport_Profile = {
        init: function () {
            // 表单时间控件设置
            $('#user_birthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });

            $(".user-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#user_birthday').datetimepicker("show");
            });

            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 完善提交
            $(".profile-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#center_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        alert("完善信息保存成功");
                    } else {
                        alert(res.message || "完善信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(jQuery);
