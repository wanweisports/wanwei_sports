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
            // 身份证号改变，回填生日和性别
            $("#member_idcard").on("change", function (e) {
                e.preventDefault();

                var card = $(this).val();
                var birthday = card.replace(/^\d{6}(\d{4})(\d{2})(\d{2})[0-9xX]{4}$/, "$1-$2-$3");
                var sex = card.replace(/^\d{16}(\d{1})[0-9xX]{1}$/, "$1");

                $("#member_birthday").val(birthday);
                $("[name='memberSex'][value='" + (sex % 2 ? 1 : 2) + "']").prop("checked", true);
            });


            // 保存信息
            $(".save-member").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveMember', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('教师信息保存成功！', function () {
                            location.href = '/teachers/list';
                        });
                    } else {
                        $.logConsole('教师信息保存失败', res1.message);
                        $.tipsWarningAlert('教师信息保存失败');
                    }

                    $btn.button('reset');
                });
            });
        }
    };

    Teachers_View.init();
})(jQuery);
