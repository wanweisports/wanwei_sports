(function ($) {
    var Goods_Buy_List = {
        opts: {
            data: {}
        },
        calCartCount: function () {
            var goods = this.opts.data, id;
            var count = 0;

            for (id in goods) {
                count += goods[id].goodCount;
            }

            return count;
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;
            var $uiGoodsList = $(".goods-buy-list");
            var $btnCart = $(".good-cart-count");

            /*$.getJSON('/goods/QueryGoodsCart', function (res) {
                content.opts.data = res.data.carts;

                $btnCart.find(".badge").html(parseInt(content.calCartCount()));
            });*/

            $uiGoodsList.on("click", ".good-cart-add", function (e) {
                e.preventDefault();

                var $this = $(this);
                var goodId = $this.attr("data-id");

                if (!content.opts.data[goodId]) {
                    content.opts.data[goodId] = {
                        goodId: goodId,
                        name: $this.parents(".goods-list-item").find(".good-name").attr("data-text"),
                        price: $this.parents(".goods-list-item").find(".good-price").attr("data-text"),
                        url: $this.parents(".goods-list-item").find(".good-image").attr("src"),
                        goodCount: 0
                    };
                }
                content.opts.data[goodId].goodCount++;

                $btnCart.find(".badge").html(content.calCartCount());
            });

            // 跳转购物车列表
            $btnCart.on("click", function (e) {
                e.preventDefault();

                $.post('/goods/SaveGoodsCart', {carts: JSON.stringify(content.opts.data)}, function (res) {
                    if (res.code == 1) {
                        location.assign("/good/getGoodsCart");
                    }
                }).fail(function (err) {
                    console.log(err);
                });
            });
        }
    };

    Goods_Buy_List.init();
})(jQuery);
