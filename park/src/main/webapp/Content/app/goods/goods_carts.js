(function ($) {
    var Goods_Cart_List = {
        init: function () {
            this.initEvents();

            var $uiGoodsSteps = $("#pay_model");

            // 初始化支付流程步骤
            $uiGoodsSteps.find(".goods-steps").steps({
                enableFinishButton: false,
                enablePagination: false,
                enableAllSteps: false
            });

            this.bindPayEvents();
            $(".money-num").text(this.calculateMoney());
        },
        // 估价
        calculateMoney: function () {
            var $list = $(".goods-cart-list");
            var $count = $list.find(".good-count");
            var money = 0;

            $count.each(function (index, item) {
                var price = parseFloat($(item).attr("data-money"));
                var count = parseInt($(item).val());

                money += price * 100 * count;
            });

            return (money / 100).toFixed(2);
        },
        // 计价
        calculateShoppingMoney: function (conditions) {
            $.post('/good/calculateShoppingMoney', conditions, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    $("#goods_paid_sum").val(data.presentPrice || data.originalPrice);
                } else {
                    $.logConsole('订单计价失败', res.message);
                    $.tipsWarningAlert('订单计价失败');
                }
            });
        },
        // 支付流程事件绑定
        bindPayEvents: function () {
            var content = this;
            var $uiGoodsSteps = $("#pay_model");

            // 结算
            $(".goods-buy-money").on("click", function () {
                var $list = $(".cart-list");
                var shoppingIds = [];

                $list.find(".cart-item").each(function (index, item) {
                    shoppingIds.push($(item).attr("data-sid"));
                });

                $("#goods_user_shoppingIds").val(shoppingIds.join(","));
            });

            // 检索会员
            $("#goods_user_mobile").autosuggest({
                url: '/member/searchMember',
                method: 'post',
                queryParamName: 'search',
                dataCallback:function(res) {
                    var data = res.data;
                    var json = [];

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            for (var i = 0; i < data.members.length; i++) {
                                json.push({
                                    id: data.members[i].memberMobile,
                                    label: data.members[i].memberId,
                                    value: data.members[i].memberName + "(" + data.members[i].cardTypeName + ")"
                                });
                            }
                            return json;
                        } else {
                            $('#goods_user_memberId').val("0");
                            $('#goods_user_opType').val("2");
                            $('#goods_user_name').val("散客");
                            return [];
                        }
                    } else {
                        $.logConsole('搜索会员失败', res.message);
                        $.tipsWarningAlert('搜索会员失败');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var memberId = elm.data('label');
                    var mobile = elm.data('id');
                    var memberName = elm.data('value');

                    $('#goods_user_memberId').val(memberId);
                    $('#goods_user_mobile').val(mobile);
                    $("#goods_user_opType").val("1");
                    $('#goods_user_name').val(memberName.replace(/\(.+\)/, ""));
                }
            });

            // 提交购买
            $("#goods_user_pay").on("click", function (e) {
                e.preventDefault();

                var $form = $("#goods_user_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/good/saveOrder', conditions, function (res) {
                    var data = res.data;
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $uiGoodsSteps.find(".goods-steps").steps("next", 1);
                        $("#goods_paid_order").val(data.orderId);
                    } else {
                        $.logConsole('保存订单失败', res.message);
                        $.tipsWarningAlert('保存订单失败');
                    }
                });

                content.calculateShoppingMoney(conditions);
            });

            // 确定支付
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
                        location.assign('/order/getOrderList?orderServiceTypes=300');
                    } else {
                        $.logConsole('支付订单失败', res.message);
                        $.tipsWarningAlert('支付订单失败');
                    }
                })
            });
        },
        initEvents: function () {
            var content = this;
            var $uiGoodsList = $(".goods-cart-list");

            // 购物车移除
            $uiGoodsList.on("click", ".goods-remove", function (e) {
                e.preventDefault();

                var $this = $(this);

                $.post("/good/deleteCart", {
                    shoppingId: $this.attr("data-sid")
                }, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('移除购物车失败', res.message);
                        $.tipsWarningAlert('移除购物车失败');
                    }
                });
            });

            // 购物车加
            $uiGoodsList.on("click", ".goods-plus", function (e) {
                e.preventDefault();

                var $this = $(this);
                var count = parseInt($this.parents(".input-group").find(".good-count").val());

                $.post("/good/addGoodsToCart", {
                    goodId: $this.attr("data-id"),
                    amount: 1
                }, function (res) {
                    var $count = $this.parents(".input-group").find(".good-count");

                    if (res.code == 1) {
                        $count.val(++count);
                        $(".money-num").text(content.calculateMoney());

                        var itemPrice = parseFloat($count.attr("data-money"));
                        var itemCount = parseInt($count.val());
                        $this.parents(".cart-item").find(".good-total").text((itemPrice * itemCount).toFixed(2) + "元");
                    } else {
                        $.logConsole('增加数量失败', res.message);
                        $.tipsWarningAlert('增加数量失败');
                    }
                });
            });

            // 购物车减
            $uiGoodsList.on("click", ".goods-minus", function (e) {
                e.preventDefault();

                var $this = $(this);
                var count = parseInt($this.parents(".input-group").find(".good-count").val());

                if (count <= 1) {
                    return false;
                }

                $.post("/good/addGoodsToCart", {
                    goodId: $this.attr("data-id"),
                    amount: -1
                }, function (res) {
                    var $count = $this.parents(".input-group").find(".good-count");

                    if (res.code == 1) {
                        $count.val(--count);
                        $(".money-num").text(content.calculateMoney());

                        var itemPrice = parseFloat($count.attr("data-money"));
                        var itemCount = parseInt($count.val());
                        $this.parents(".cart-item").find(".good-total").text((itemPrice * itemCount).toFixed(2) + "元");
                    } else {
                        $.logConsole('减少数量失败', res.message);
                        $.tipsWarningAlert('减少数量失败');
                    }
                });
            });
        }
    };

    Goods_Cart_List.init();
})(jQuery);
