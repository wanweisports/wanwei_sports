(function ($) {
    // 检索显示列表
    $(".goods-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#goods_filter_form").serialize();

        location.assign('/good/getGoods?' + conditions);
    });

    // 分页点击
    $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
        e.preventDefault();

        var href = location.href;

        location.assign(
            (href.indexOf("?") > 0) ?
                (href + "&page=" + $(this).attr("data-index")) : (href + "?page=" + $(this).attr("data-index"))
        );
    });

    // 上/下架
    function goodInOrOut(goodId, up){
        $.post("good/goodInOrOut", {goodId: goodId, up: up}, function () {
            location.reload();
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
})(jQuery);
