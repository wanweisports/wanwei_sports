(function ($) {
    var Teachers_Create = {
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#member_birthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                maxDate: 0
            });

            $(".member-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#member_birthday').datetimepicker("show");
            });

            this.initEvents();
        },
        initEvents: function () {
            // 身份证号改变，回填生日和性别
            $("#member_idcard").on("change", function (e) {
                e.preventDefault();

                var card = $(this).val();
                var birthday = card.replace(/^\d{6}(\d{4})(\d{2})(\d{2})[0-9xX]{4}$/, "$1-$2-$3");
                var sex = card.replace(/^\d{16}(\d{1})[0-9xX]{1}$/, "$1");

                $("#member_birthday").val(birthday);
                $("[name='memberSex'][value='" + (sex % 2 ? 1 : 2) + "']").prop("checked", true);
            });

            // 注册信息
            $(".register-member").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveMember', conditions, function (res) {
                    var data = res.data;

                    if (res.code != 1) {
                        $.logConsole('教师信息注册失败', res.message);
                        $.tipsWarningAlert('教师信息注册失败');
                        return;
                    }

                    $('[name="memberId"]').val(data.memberId);
                    conditions = $form.serialize();
                    $.post('/member/saveMemberCar', conditions, function (res1) {
                        $form.attr("submitting", "");

                        if (res1.code == 1) {
                            $.tipsSuccessAlert('教师注册成功！', function () {
                                location.assign('/teachers/list');
                            });
                        } else {
                            $.logConsole('教师绑卡失败', res1.message);
                            $.tipsWarningAlert('教师绑卡失败');
                        }

                        $btn.button('reset');
                    });
                });
            });
        }
    };

    Teachers_Create.init();
})(jQuery);
