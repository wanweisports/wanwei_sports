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

            var goodType = location.search.replace("?goodType=", "");
            $(".good-type-list").find('[data-type="' + goodType + '"]')
                .addClass("btn-warning").removeClass("btn-primary");
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

                $.post('/good/addGoodsToCart', {goodId: goodId, amount: 1}, function (res) {
                    if (res.code == 1) {
                    } else {
                        alert(res.message || "添加购物车失败, 请稍后重试");
                    }
                });
            });

            // 跳转购物车列表
            $btnCart.on("click", function (e) {
                e.preventDefault();

                location.assign("/good/getGoodsCart");
            });
        }
    };

    Goods_Buy_List.init();
})(jQuery);
