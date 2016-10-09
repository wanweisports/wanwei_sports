(function ($) {
    // 筛选余额列表
    $(".balance-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#balance_filter_form").serialize();

        location.assign('member/getBalances?' + conditions);
    });

    // 分页点击
    $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
        e.preventDefault();

        var href = location.href;

        location.assign(href + "&page=" + $(this).attr("data-index"));
    });
})(jQuery);
