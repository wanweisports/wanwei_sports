(function ($) {
    var Good_List = {
        opts: {
            URL: '/good/getGoods'
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

                $.tipsWarningAlert

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
                    location.assign('/good/getGoods?page=' + $(this).attr("data-index"));
                }
            });

            // 上/下架
            function goodInOrOut(goodId, up){
                $.post("/good/goodInOrOut", {goodId: goodId, up: up}, function (res) {
                    if(res.code == 1){
                        location.reload();
                    }else{
                        $.logConsole('商品上/下架失败失败', res.message);
                        $.tipsWarningAlert('商品上/下架失败失败');
                    }
                });
            }

            // 进销存上架
            $(".goods-list").on("click", ".goods-enter", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("working") == "working") {
                    return false;
                }
                $this.attr("working", "working");

                goodInOrOut($this.attr("data-id"), true);
            });

            // 进销存下架
            $(".goods-list").on("click", ".goods-outer", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("working") == "working") {
                    return false;
                }
                $this.attr("working", "working");

                goodInOrOut($this.attr("data-id"), false);
            });

            // 进销存增加库存弹窗
            $(".goods-list").on("click", ".goods-count", function () {
                var $this = $(this);

                $("#plus_good_id").val($this.attr("data-id"));
                $("#plus_current_good_count").text($this.attr("data-count"));
                $("#plus_good_count").val("");
            });

            // 确认增加库存
            $("#plus_count_modal").on("click", ".confirm-plus-count", function (e) {
                e.preventDefault();

                var $form = $("#plus_count_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post("/good/addGoodCount", conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('增加库存失败', res.message);
                        $.tipsWarningAlert('增加库存失败');
                    }
                });
            });

            // 进销存损耗库存弹窗
            $(".goods-list").on("click", ".goods-minus-count", function () {
                var $this = $(this);

                $("#minus_good_id").val($this.attr("data-id"));
                $("#minus_current_good_count").text($this.attr("data-count"));
                $("#minus_good_count").val("");
            });

            // 确认损耗库存
            $("#minus_count_modal").on("click", ".confirm-minus-count", function (e) {
                e.preventDefault();

                var $form = $("#minus_count_form");
                var conditions = $form.serialize();
                var curCount = $("#minus_current_good_count").text();
                var count = $("#minus_good_count").val();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                if (parseInt(curCount) < parseInt(count)) {
                    $.tipsWarningAlert('损耗大于当前库存');
                    return false;
                }

                $form.attr("submitting", "submitting");

                $.post("/good/minusGoodCount", conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('损耗库存失败', res.message);
                        $.tipsWarningAlert('损耗库存失败');
                    }
                });
            });
        }
    };

    Good_List.init();
})(jQuery);
