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
                        alert(res.message || '上/下架失败, 请稍后重试');
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

                $("input[name='goodId']").val($this.attr("data-id"));
                $("#nowGoodCount").html($this.attr("data-count"));
            });

            // 确认增加库存
            $("#kucunModal").on("click", ".confirm-count", function (e) {
                e.preventDefault();

                var $form = $("#good_kucun_form");

                $.post("/good/addGoodCount", $form.serialize(), function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "增加库存事变, 请稍后重试")
                    }
                });
            });
        }
    };

    Good_List.init();
})(jQuery);
