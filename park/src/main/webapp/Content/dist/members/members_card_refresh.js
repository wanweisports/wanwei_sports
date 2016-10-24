(function ($) {
    var Members_Card_Refresh = {
        init: function () {
            this.initEvents();

            // 生成新会员卡号
            $.post('/member/getNewCardNo', function (res) {
                var data = res.data;

                if (res.code == 1) {
                    $("#newCardNo").val(data.newCardNo);
                } else {
                    alert(res.message || "新会员卡号生成失败, 请稍后重试");
                }
            });
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

                location.assign('/member/getMembersCardRefresh?' + conditions);
            });

            // 会员卡补办
            $(".refresh-card-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#refresh_card_form");
                var conditions = $form.serialize();

                if ($("#refresh_cardId").val() === "") {
                    alert("请先选择会员卡");
                    return false;
                }

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/memberCardBuBan', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        alert("会员补办成功");
                    } else {
                        alert(res.message || "会员补办失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Card_Refresh.init();
})(jQuery);
