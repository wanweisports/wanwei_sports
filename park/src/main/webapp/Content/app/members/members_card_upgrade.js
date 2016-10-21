(function ($) {
    var Members_Card_Upgrade = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 筛选
            $(".member-card-filter").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_card_form");
                var conditions = $form.serialize();

                location.assign('/member/getMembersCardUpgrade?' + conditions);
            });

            function _getMemberCarType(id) {
                $.post('/member/getMemberCarType', {cardTypeId: id}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#upgrade_cost").val(data.cardTypeMoney);
                        $("#upgrade_discount").val(data.cardTypeDiscount);
                        $("#upgrade_deadline").val(data.cardDeadline);
                    } else {
                        alert("卡类型信息查询失败, 请稍后重试");
                    }
                });
            }

            // 卡类型改变查询
            $("[name='cardTypeId']").on("change", function (e) {
                e.preventDefault();

                var id = $(this).val();

                _getMemberCarType(id);
            });
            $("[name='cardTypeId']").change();

            // 会员卡升级
            $(".upgrade-card-submit").on("click", function (e) {
                e.preventDefault();

                // 生成新的会员卡号
                var $form = $("#upgrade_card_form");
                var conditions = $form.serialize();

                if ($("#upgrade_cardId").val() === "") {
                    alert("请先选择会员卡");
                    return false;
                }

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/memberCardUpLevel', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        alert("会员升级成功");
                    } else {
                        alert("会员升级失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Card_Upgrade.init();
})(jQuery);
