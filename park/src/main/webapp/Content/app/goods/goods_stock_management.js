(function ($) {
    var Good_STOCK = {
        opts: {
            URL: '/good/getGoodsStock'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索显示列表
            $(".goods-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#goods_filter_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 分页点击
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(location.href + '&page=' + $(this).attr("data-index"));
                    } else {
                        location.assign(location.href.replace(/page=\d+/, "") + '&page=' + $(this).attr("data-index"));
                    }
                } else {
                    location.assign('/good/getGoodsStock?page=' + $(this).attr("data-index"));
                }
            });
        }
    };

    Good_STOCK.init();
})(jQuery);
