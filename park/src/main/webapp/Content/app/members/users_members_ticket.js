(function ($) {
    // 筛选会员类型
    $(".ticket-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#ticket_filter_form").serialize();

        location.assign('/users/membersTicket?' + conditions);
    });

    var ajaxLock = false;
    $(".ticket-print").on("click", function (e) {
        e.preventDefault();

        var $tickets = $("[name='ticket_id']:checked");

        if ($tickets.size() == 0) {
            return alert("请选择要领取的发票!");
        }

        if (ajaxLock) {
            return false;
        }
        ajaxLock = true;

        $.post('/users/membersTicketGet', {}, function (res) {
            if (res.status == 200) {
                location.reload();
            } else {
                alert("领取失败");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
