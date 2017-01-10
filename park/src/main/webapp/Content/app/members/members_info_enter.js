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

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/saveMember', conditions, function (res) {
                    var data = res.data;

                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#tips_modal").modal("hide");
                            location.assign(content.opts.ToURL + '?memberId=' + data.memberId);
                        }, 3000);
                    } else {
                        alert(res.message || "会员信息保存失败, 请稍后重试");
                    }
                });
            });

            // 读取卡信息
            $(".member-card-read").on("click", function (e) {
                e.preventDefault();
            });
        }
    };

    Members_register.init();
})(jQuery);
