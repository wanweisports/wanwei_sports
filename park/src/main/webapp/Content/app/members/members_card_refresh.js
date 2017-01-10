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
                    $.logConsole('生成新会员卡号失败', res.message);
                    $.tipsWarningAlert('生成新会员卡号失败');
                }
            });
        },
        calculateRefreshMoney: function () {
            var $money = $("#refresh_money");
            var $send = $("#refresh_send");

            var money = parseFloat($money.val() || "0.00");
            var send = parseFloat($send.val() || "0.00");

            return (money + send).toFixed(2);
        },
        initEvents: function () {
            var content = this;

            $("#keywords").autosuggest({
                url: '/member/searchMember',
                method: 'post',
                queryParamName: 'search',
                dataCallback:function(res) {
                    var data = res.data;
                    var json = [];

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            for (var i = 0; i < data.members.length; i++) {
                                json.push({
                                    id: data.members[i].memberId,
                                    label: data.members[i].cardNo,
                                    value: data.members[i].memberName + '(' + data.members[i].memberMobile + ',' + data.members[i].cardNo + ')'
                                });
                            }
                            return json;
                        } else {
                            $.tipsWarningAlert('没有搜索到会员');
                            return [];
                        }
                    } else {
                        $.logConsole('搜索会员失败', res.message);
                        $.tipsWarningAlert('搜索会员失败');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var cardNo = elm.data('label');

                    $('#card_no').val(cardNo);
                    location.assign('/member/getMembersCardRefresh?cardNo=' + cardNo);
                }
            });

            // 筛选
            $(".member-card-filter").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_card_form");
                var conditions = $form.serialize();

                if (!$form.valid()) {
                    return false;
                }

                $.post('member/searchMember', conditions, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            location.assign('/member/getMembersCardRefresh?cardNo='
                                + data.members[0].cardNo);
                        } else {
                            $.tipsWarningAlert('没有搜索到会员');
                        }
                    } else {
                        $.logConsole('搜索会员失败', res.message);
                        $.tipsWarningAlert('搜索会员失败');
                    }
                });
            });

            // 补办金额,补办金额改变
            $("#refresh_money, #refresh_send").on("change", function (e) {
                e.preventDefault();

                $(".refresh-total-money").text(content.calculateRefreshMoney());
            });

            // 会员卡补办
            $(".refresh-card-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#refresh_card_form");
                var conditions = $form.serialize();

                if ($("#refresh_cardId").val() === "") {
                    $.tipsWarningAlert('请先选择会员卡');
                    return false;
                }

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/memberCardBuBan', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#refreshModal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#refreshModal").modal("hide");
                            location.assign('/member/getMembersCardRefresh?cardNo=' + $("#newCardNo").val());
                        }, 3000);
                    } else {
                        $.logConsole('会员补办失败', res.message);
                        $.tipsWarningAlert('会员补办失败');
                    }
                });
            });
        }
    };

    Members_Card_Refresh.init();
})(jQuery);
