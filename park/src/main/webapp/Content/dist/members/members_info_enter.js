(function ($) {
    var Members_register = {
        opts: {
            ToURL: "/member/membersInfoCar"
        },
        init: function () {
            this.initEvents();

            // 表单时间控件设置
            $(".form_datetime").datepicker({
                format: "yyyy-mm-dd",
                todayBtn: true,
                language: "zh-CN",
                orientation: "bottom auto"
            });
        },
        initEvents: function () {
            var content = this;

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
                        location.assign(content.opts.ToURL + '?memberId=' + data.memberId);
                    } else {
                        alert(res.message || "会员信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_register.init();
})(jQuery);
