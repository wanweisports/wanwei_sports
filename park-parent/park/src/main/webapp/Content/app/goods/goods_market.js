(function ($) {
    var Goods_Buy_List = {
        opts: {
            data: {}
        },
        calCartCount: function () {
            $.post('/good/getCartCount', {}, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    $(".good-cart-count").find(".badge").html(data.cartCount);
                }
            });
        },
        init: function () {
            this.initEvents();
            this.calCartCount();

            var goodType = location.search.replace("?goodType=", "");
            $(".good-type-list").find('[data-type="' + goodType + '"]')
                .addClass("btn-primary").removeClass("btn-success");
        },
        initEvents: function () {
            var content = this;
            var $uiGoodsList = $(".goods-buy-list");
            var $btnCart = $(".good-cart-count");

            $uiGoodsList.on("click", ".good-cart-add", function (e) {
                e.preventDefault();

                var $this = $(this);
                var goodId = $this.attr("data-id");

                $.post('/good/addGoodsToCart', {goodId: goodId, amount: 1}, function (res) {
                    if (res.code != 1) {
                        $.logConsole('添加购物车失败', res.message);
                        $.tipsWarningAlert('添加购物车失败');
                        return false;
                    }

                    content.calCartCount();
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
