(function ($) {
    var Passport_Profile = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 密码修改提交
            $(".password-confirm").on("click", function (e) {
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
                        alert("密码修改成功");
                    } else {
                        alert(res.message || "密码修改失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(jQuery);
