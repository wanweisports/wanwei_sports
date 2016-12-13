(function ($) {
    var Members_Card_Recharge = {
        init: function () {
            this.initEvents();
        },
        calculateRechargeMoney: function () {
            var $money = $("#recharge_money");
            var $send = $("#recharge_send");

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
                            alert('没有搜索到会员');
                            return [];
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var cardNo = elm.data('label');

                    $('#card_no').val(cardNo);
                    location.assign('/member/getMembersCardRecharge?cardNo=' + cardNo);
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
                            location.assign('/member/getMembersCardRecharge?cardNo='
                                + data.members[0].cardNo);
                        } else {
                            alert('没有搜索到会员');
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                    }
                });
            });

            // 充值金额,赠送金额改变
            $("#recharge_money, #recharge_send").on("change", function (e) {
                e.preventDefault();

                $(".recharge-total-money").text(content.calculateRechargeMoney());
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
                        $("#rechargeModal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#rechargeModal").modal("hide");

                            $("#invoice_confirm_modal").modal({backdrop: false, show: true});
                            $.each(res.data, function(key, item){
                                $("#member_card_ticket_form").find("input[name='" + key + "']").val(item);
                            });
                            $("#member_card_ticket_form").find("#ticket_header").val($("#member_name").val());
                            $("#member_card_ticket_form").find("#ticket_money").val($("#recharge_money").val());
                            $("#member_card_ticket_form").find("#ticket_content").val("会员卡充值");
                        }, 3000);
                    } else {
                        console.log(res.message || "会员充值失败, 请稍后重试");
                        alert(res.message || "会员充值失败, 请稍后重试");
                    }
                });
            });

            // 选择打印发票
            $("#is_print_ticket").on("change", function (e) {
                e.preventDefault();

                var checked = $(this).prop("checked");

                if (checked) {
                    $(".is-show-ticket").show();
                } else {
                    $(".is-show-ticket").hide();
                }
            });

            // 打印小票
            $(".print-ticket").on("click", function (e) {
                e.preventDefault();

                if (!$("#is_print_ticket").prop("checked")) {
                    // 打印收款单 [未完成] 连接小票机

                    location.reload();
                    $("#invoice_confirm_modal").modal("hide");
                    return false;
                }

                var $form = $("#member_card_ticket_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveInvoice', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        // 打印收款单 [未完成] 连接小票机

                        location.reload();
                        $("#invoice_confirm_modal").modal("hide");
                    } else {
                        alert(res.message || "发票登记失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Card_Recharge.init();
})(jQuery);
