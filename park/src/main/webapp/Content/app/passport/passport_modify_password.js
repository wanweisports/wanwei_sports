(function ($) {
    var Passport_Profile = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 密码修改提交
            $(".password-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#center_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('passport/updatePwd', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({show: true, backdrop: false});
                        setTimeout(function () {
                            $("#tips_modal").modal("hide");
                        }, 3000);
                    } else {
                        console.log(res.message || "密码修改失败, 请稍后重试");
                        alert(res.message || "密码修改失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(jQuery);
