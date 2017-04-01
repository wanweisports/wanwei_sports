(function ($) {
    var Passport_Profile = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 完善提交
            $(".profile-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#center_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting") {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/center/updateProfile', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('完善信息成功！');
                    } else {
                        $.logConsole('完善信息失败', res.message);
                        $.tipsWarningAlert('完善信息失败');
                    }
                });
            });
        }
    };

    Passport_Profile.init();
})(Zepto);
