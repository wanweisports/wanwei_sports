(function ($) {
    // 筛选会员类型
    $(".member-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_filter_form").serialize();

        location.assign('/member/memberList?' + conditions);
    });
})(jQuery);
