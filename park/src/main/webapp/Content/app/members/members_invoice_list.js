(function ($) {
    // 筛选会员类型
    $(".ticket-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#ticket_filter_form").serialize();

        location.assign('member/getInvoices?' + conditions);
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

    // 领取发票状态改变
    $(".ticket-print").on("click", function (e) {
        e.preventDefault();

        var $this = $(this);
        var $tickets = $("[name='ticket_id']:checked");

        if ($tickets.size() == 0) {
            return alert("请选择已领取的发票");
        }

        if ($this.attr("working") == "working") {
            return false;
        }
        $this.attr("working", "working");

        var val = [];
        for (var i = 0; i < $tickets.size(); i++) {
            val.push($tickets.eq(i).val());
        }

        $.post('member/updateGetInvoices', {invoiceIds: val.join(",")}, function (res) {
            $this.attr("working", "");

            if (res.code == 1) {
                location.reload();
            } else {
                alert("发票状态改变失败, 请稍后重试");
            }
        });
    });
})(jQuery);
