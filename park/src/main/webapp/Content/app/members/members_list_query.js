(function ($) {
    // 检索显示会员列表
    $(".member-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_filter_form").serialize();

        location.assign('member/memberList?' + conditions);
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
            location.assign('member/memberList?page=' + $(this).attr("data-index"));
        }
    });
})(jQuery);
