(function ($) {
    var Members_Card_Bind = {
        opts: {
            ToURL: '/member/memberList'
        },
        init: function () {
            $.post('/member/getMemberCarType', {cardTypeId: $('[name="cardTypeId"]').val()}, function (res) {
                if (res.code == 1) {
                    var data = res.data;

                    $('[name="cardTypeMoney"]').val(data.cardTypeMoney || "0.00");
                    $('[name="cardDeadline"]').val(data.cardTypeMonth > 0 ? data.cardDeadline : "无限制");
                    $('[name="cardDeposit"]').val(data.cardDeposit || "0.00");
                } else {
                    alert(res.message || "会员类别详情查询失败, 请稍后重试");
                }
            });

            this.initEvents();
        },
        calculateMoney: function () {
            var $money = $("#recharge_money");
            var $send = $("#recharge_send");
            var $type = $("#recharge_type_money");
            var $deposit = $("#recharge_type_deposit");

            var money = parseFloat($money.val() || "0.00");
            var send = parseFloat($send.val() || "0.00");
            var type = parseFloat($type.val());
            var deposit = parseFloat($deposit.val());

            return (money + send - type - deposit).toFixed(2);
        },
        initEvents: function () {
            var content = this;

            //更新会员信息
            $(".genxin-submit").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/updateMemberName', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#tips_modal").modal("hide");
                        }, 3000);
                    } else {
                        console.log(res.message || "会员信息更新失败, 请稍后重试");
                        alert(res.message || "会员信息更新失败, 请稍后重试");
                    }
                });
            });

            // 会员卡类型改变
            /*$("#member_type").on("change", function (e) {
                e.preventDefault();

                $.post('/member/getMemberCarType', {cardTypeId: $(this).val()}, function (res) {
                    if (res.code == 1) {
                        var data = res.data;

                        $('[name="cardTypeDiscount"]').val(data.cardTypeDiscount + "折");
                        $('[name="cardTypeCredit"]').val((data.cardTypeCredit || 0) + "元");
                        $('[name="cardTypeMoney"]').val((data.cardTypeMoney || 0) + "元");
                        $('[name="cardDeadline"]').val(data.cardDeadline);
                        $('[name="cardTypeAhead"]').val((data.cardTypeAhead || 0) + "天");
                    } else {
                        alert(res.message || "会员类别详情查询失败, 请稍后重试");
                    }
                });
            });*/

            // 支付方式改变
            $("#recharge_type").on("change", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.val() == 5) {
                    $(".recharge-check-no").show();
                } else {
                    $(".recharge-check-no").hide();
                }
            });

            // 充值金额,赠送金额改变
            $("#recharge_money, #recharge_send").on("change", function (e) {
                e.preventDefault();

                $(".total-money").text(content.calculateMoney());
            });

            // 会员绑卡充值
            $(".register-recahrge").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_card_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveMemberCar', conditions, function (res) {
                    $form.attr("submitting", "");
                    if (res.code == 1) {
                        $("#confirm_modal").modal({backdrop: false, show: true});

                        $.each(res.data, function(key, item){
                            $("#member_card_ticket_form").find("input[name='" + key + "']").val(item);
                        });

                        $("#member_card_ticket_form").find("#ticket_header").val('');
                        $("#member_card_ticket_form").find("#ticket_money").val('');
                        $("#member_card_ticket_form").find("#ticket_content").val('');
                        $("#member_card_ticket_form").find("#invoice_no").val(res.data.balanceNo);
                    } else {
                        console.log(res.message || "会员卡充值失败, 请稍后重试");
                        alert(res.message || "会员卡充值失败, 请稍后重试");
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

                    location.assign(content.opts.ToURL);
                    $("#confirmModal").modal("hide");
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

                        location.assign(content.opts.ToURL);
                        $("#confirmModal").modal("hide");
                    } else {
                        alert(res.message || "发票登记失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Card_Bind.init();
})(jQuery);
