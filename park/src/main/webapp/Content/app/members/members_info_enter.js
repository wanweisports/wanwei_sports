(function ($) {
    var Members_register = {
        opts: {
            ToURL: "/member/membersInfoCar"
        },
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
            var content = this;

            // 身份证号改变，回填生日和性别
            $("#member_idcard").on("change", function (e) {
                e.preventDefault();

                var card = $(this).val();

                $("#member_birthday").val(card.replace(/\d{6}(\d{4})(\d{2})(\d{2})\d{4}/, "$1-$2-$3"));
                $("[name='memberSex'][value='" + card.replace(/\d{16}(\d{1})\d{1}/, "$1") + "']").prop("checked", true);
            });

            // 注册用户提交
            $(".register-member").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/saveMember', conditions, function (res) {
                    $form.attr("submitting", "");

                    var data = res.data;
                    if (res.code == 1) {
                        $.tipsSuccessAlert('会员信息保存成功！', function () {
                            location.assign(content.opts.ToURL + '?memberId=' + data.memberId);
                        });
                    } else {
                        $.logConsole('会员信息保存失败', res.message);
                        $.tipsWarningAlert('会员信息保存失败');
                    }

                    $btn.button('reset');
                });
            });
        }
    };

    Members_register.init();
})(jQuery);
