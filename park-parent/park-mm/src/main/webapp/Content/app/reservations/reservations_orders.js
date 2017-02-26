(function ($) {
    var Orders_List = {
        opts: {
            URL: 'order/getOrderList?orderServiceTypes=100,200'
        },
        init: function () {
            this.initEvents();
            this.changePaidMoney();
        },
        initEvents: function () {
            var content = this;

            // 筛选
            $(".orders-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#orders_filter_form").serialize();

                location.assign(content.opts.URL + '&' + conditions);
            });

            // 分页
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;
                var pageIndex = $(this).attr("data-index");

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(content.opts.URL + '&' + conditions + '&page=' + pageIndex);
                    } else {
                        location.assign(content.opts.URL + '&' + conditions.replace(/(page=)\d+/, '$1' + pageIndex));
                    }
                } else {
                    location.assign(content.opts.URL + '&page=' + pageIndex);
                }
            });

            // 取消订单
            $(".order-cancel").on("click", function (e) {
                e.preventDefault();

                var conditions = {
                    orderId: $(this).attr("data-id")
                };

                if ($(this).attr("working") == "working") {
                    return false;
                }
                $(this).attr("working", "working");

                $.post('order/cancelOrder', conditions, function (res) {
                    $(this).attr("working", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('取消订单失败', res.message);
                        $.tipsWarningAlert('取消订单失败');
                    }
                });
            });

            // 删除订单
            $(".order-delete").on("click", function (e) {
                e.preventDefault();

                var conditions = {
                    orderId: $(this).attr("data-id")
                };

                if ($(this).attr("working") == "working") {
                    return false;
                }
                $(this).attr("working", "working");

                $.post('order/deleteOrder', conditions, function (res) {
                    $(this).attr("working", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('取消订单失败', res.message);
                        $.tipsWarningAlert('取消订单失败');
                    }
                });
            });

            // 支付
            $(".order-pay").on("click", function (e) {
                e.preventDefault();

                var conditions = {
                    orderId: $(this).attr("data-id"),
                    memberId: $(this).attr("data-member")
                };

                if ($(this).attr("working") == "working") {
                    return false;
                }
                $(this).attr("working", "working");

                $.post('order/getOrderToPay', conditions, function (res) {
                    $(this).attr("working", "");

                    var data = res.data;
                    if (res.code == 1) {
                        $("#pay_modal").modal({backdrop: false, show: true});

                        $("#reservations_paid_order").val(conditions.orderId);
                        $("#reservations_paid_orderSumCount").val(data.sumNums);
                        $("#reservations_paid_orderSumPrice").val(data.originalPrice);
                        $("#reservations_paid_payCount").val(data.sumNums);
                        $("#reservations_paid_paySumPrice").val(data.originalPrice);
                        $("#reservations_paid_money").val(data.originalPrice);

                        content.queryMemberBalance(conditions.memberId);
                    } else {
                        $.logConsole('查询订单支付失败', res.message);
                        $.tipsWarningAlert('查询订单支付失败');
                    }
                });
            });

            // 确认支付
            $("#reservations_pay_order").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_paid_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('site/confirmOrder', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#pay_modal").modal("hide");
                        location.reload();
                    } else {
                        $.logConsole('确认订单失败', res.message);
                        $.tipsWarningAlert('确认订单失败');
                    }
                });
            });
        },
        queryMemberBalance: function (memberId) {
            if (!memberId || memberId == "0") {
                $('#reservations_paid_balance').val("您还不是会员");
                return;
            }

            $.post('member/memberDetail', {memberId: memberId}, function (res) {
                var data = res.data;
                var originalPrice = $("#reservations_paid_money").val();

                if (res.code == 1) {
                    $('#reservations_paid_balance').val(data.cardBalance);
                    if (data.cardBalance >= originalPrice) {
                        $("#reservations_paid_money").val("0.00");
                    } else {
                        $("#reservations_paid_money").val(originalPrice - data.cardBalance);
                    }
                } else {
                    $.logConsole('会员余额查询失败', res.message);
                    $.tipsWarningAlert('会员余额查询失败');
                }
            });
        },
        changePaidMoney: function () {
            $("#reservations_paid_paySumPrice").on("change", function (e) {
                e.preventDefault();

                var balance = $("#reservations_paid_balance").val();
                var paidPrice = $(this).val();

                balance = parseFloat(balance).toFixed(2);
                paidPrice = parseFloat(paidPrice).toFixed(2);

                if (balance >= paidPrice) {
                    $("#reservations_paid_money").val("0.00");
                } else {
                    $("#reservations_paid_money").val(paidPrice - balance);
                }
            });
        }
    };

    Orders_List.init();
})(jQuery);
