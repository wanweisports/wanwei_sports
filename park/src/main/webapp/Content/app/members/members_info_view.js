(function ($) {
    var Member_Info_View = {
        init: function () {
            this.initEvents();

            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#member_birthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });

            $(".member-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#member_birthday').datetimepicker("show");
            });

            this.getNewCardNo();
        },
        getNewCardNo: function () {
            // 生成新卡号
            $.post('member/getNewCardNo', function (res) {
                var data = res.data;
                if (res.code == 1) {
                    $("#newCardNo").val(data.newCardNo);
                } else {
                    $.logConsole('新会员卡号生成失败', res.message);
                    $.tipsWarningAlert('新会员卡号生成失败');
                }
            }, 'json');
        },
        calculateRechargeMoney: function () {
            var $money = $("#recharge_money");
            var $send = $("#recharge_send");

            var money = parseFloat($money.val() || "0.00");
            var send = parseFloat($send.val() || "0.00");

            return (money + send).toFixed(2);
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

            // 更新会员信息
            $(".refresh-modal").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveMember', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('会员信息更新成功！');
                    } else {
                        $.logConsole('会员信息更新失败', res.message);
                        $.tipsWarningAlert('会员信息更新失败');
                    }

                    $btn.button('reset');
                });
            });

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

                $(".recharge-total-money").text(content.calculateRechargeMoney());
            });

            // 补办金额,补办金额改变
            $("#refresh_money, #refresh_send").on("change", function (e) {
                e.preventDefault();

                $(".refresh-total-money").text(content.calculateRefreshMoney());
            });

            // 会员卡充值
            $(".recharge-card-submit").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $(".recharge-card-form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/memberCardCZ', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        // 打印收款单 [未完成] 连接小票机
                        location.reload();
                    } else {
                        $.logConsole('会员卡充值失败', res.message);
                        $.tipsWarningAlert('会员卡充值失败');
                    }
                });

                $btn.button('reset');
            });

            // 会员卡补办
            $(".refresh-card-submit").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                // 生成新的会员卡号
                var $form = $(".refresh-card-form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/memberCardBuBan', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        // 打印收款单 [未完成] 连接小票机
                        location.reload();
                    } else {
                        $.logConsole('会员补办失败', res.message);
                        $.tipsWarningAlert('会员补办失败');
                    }
                });

                $btn.button('reset');
            });

            function getMemberCarType(id) {
                $.post('member/getMemberCarType', {cardTypeId: id}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#upgrade_cost").val(data.cardTypeMoney);
                        $("#upgrade_discount").val(data.cardTypeDiscount);
                        $("#upgrade_deadline").val(data.cardDeadline);
                    } else {
                        $.logConsole('卡类型信息查询失败', res.message);
                        $.tipsWarningAlert('卡类型信息查询失败');
                    }
                });
            }

            // 升级弹窗
            $(".shengji-modal").on("click", function (e) {
                e.preventDefault();

                var id = $('[name="cardTypeId"]').val();

                getMemberCarType(id);
            });

            // 卡类型改变查询
            $("[name='cardTypeId']").on("change", function (e) {
                e.preventDefault();

                var id = $(this).val();

                getMemberCarType(id);
            });

            // 会员卡升级
            $(".upgrade-card-submit").on("click", function (e) {
                e.preventDefault();

                // 生成新的会员卡号
                var $form = $(".upgrade-card-form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/memberCardUpLevel', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('会员升级失败', res.message);
                        $.tipsWarningAlert('会员升级失败');
                    }
                });
            });
        }
    };

    Member_Info_View.init();
})(jQuery);
