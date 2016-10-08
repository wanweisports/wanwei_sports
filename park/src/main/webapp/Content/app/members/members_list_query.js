(function ($) {
    // 检索显示会员列表
    $(".member-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_filter_form").serialize();

        location.assign('/member/memberList?' + conditions);
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
})(jQuery);
