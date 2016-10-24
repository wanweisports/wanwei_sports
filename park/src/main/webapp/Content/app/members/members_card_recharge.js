(function ($) {
    var Members_Card_Recharge = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 筛选
            $(".member-card-filter").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_card_form");
                var conditions = $form.serialize();

                if (!$form.valid()) {
                    return false;
                }

                location.assign('/member/getMembersCardRecharge?' + conditions);
            });

            // 会员卡充值
            $(".recharge-card-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#recharge_card_form");
                var conditions = $form.serialize();

                if ($("#recharge_cardId").val() === "") {
                    alert("请先选择会员卡");
                    return false;
                }

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/memberCardCZ', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        alert("会员充值成功");
                    } else {
                        alert(res.message || "会员充值失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Card_Recharge.init();
})(jQuery);
