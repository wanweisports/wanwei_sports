(function ($) {
    var Orders_List = {
        opts: {
            URL: '/order/getOrderList?orderServiceTypes=300'
        },
        init: function () {
            this.initEvents();
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

                $.post('/order/cancelOrder', conditions, function (res) {
                    $(this).attr("working", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "取消订单失败, 请稍后重试");
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

                $.post('/order/deleteOrder', conditions, function (res) {
                    $(this).attr("working", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "取消订单失败, 请稍后重试");
                    }
                });
            });

            // 支付
            $(".order-pay").on("click", function (e) {
                e.preventDefault();

                $("#goods_paid_order").val($(this).attr("data-id"));
                $("#goods_paid_sum").val($(this).attr("data-price"));
                $("#pay_model").modal({backdrop: false, show: true});
            });

            // 确认支付
            $("#goods_paid_confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#goods_paid_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/good/confirmOrder', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('支付订单成功！', function () {
                            $("#pay_model").modal("hide");
                            location.reload();
                        });
                    } else {
                        $.logConsole('支付订单失败', res.message);
                        $.tipsWarningAlert('支付订单失败');
                    }
                });
            });
        }
    };

    Orders_List.init();
})(jQuery);
