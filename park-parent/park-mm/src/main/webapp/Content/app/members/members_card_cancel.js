(function ($) {
    var Members_Card_Cancel = {
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

                location.assign('member/getMembersCardCancel?' + conditions);
            });

            // 会员卡注销
            $(".cancel-card-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#cancel_card_form");
                var conditions = $form.serialize();

                if ($("#cancel_cardId").val() === "") {
                    alert("请先选择会员卡");
                    return false;
                }

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/memberCardCancel', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        alert("会员注销成功");
                    } else {
                        alert(res.message || "会员注销失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Card_Cancel.init();
})(jQuery);
