(function ($) {
    var Orders_List = {
        opts: {
            URL: '/order/getOrderList?orderServiceTypes=2'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 筛选
            $(".order-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#order_filter_form").serialize();

                location.assign(content.opts.URL + '&' + conditions);
            });

            // 分页
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;
                var pageIndex = $(this).attr("data-index");

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(content.opts.URL + '?' + conditions + '&page=' + pageIndex);
                    } else {
                        location.assign(content.opts.URL + '?' + conditions.replace(/(page=)\d+/, '$1' + pageIndex));
                    }
                } else {
                    location.assign(content.opts.URL + '?page=' + pageIndex);
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

                $("#zhifuModal").modal({backdrop: false, show: true});
            });

            // 确认支付
            $(".reservations-pay-confirm").on("click", function (e) {
                e.preventDefault();

                $("#zhifuModal").modal("hide");
                location.reload();
            });
        }
    };

    Orders_List.init();
})(jQuery);
