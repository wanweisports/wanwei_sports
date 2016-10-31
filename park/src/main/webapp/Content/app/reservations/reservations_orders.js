(function ($) {
    var Orders_List = {
        opts: {
            URL: '/order/getOrderList'
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

                location.assign(content.opts.URL + '?' + conditions);
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
        }
    };

    Orders_List.init();
})(jQuery);
