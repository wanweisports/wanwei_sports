(function ($) {
    // 选择打印发票
    $("#is_print_ticket").on("change", function (e) {
        e.preventDefault();

        var checked = $(this).prop("checked");

        if (checked) {
            $(".is-show-ticket").show();
        } else {
            $(".is-show-ticket").hide();
        }
    });

    var ajaxLock = false;
    // 打印小票
    $(".print-ticket").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_card_ticket_form").serialize();

        if (ajaxLock) {
            return false;
        }
        ajaxLock = true;

        $.post('/users/submitTicketsPrint', conditions, function (res) {
            if (res.status == 200) {
                location.assign('/users/membersQuery');
                $("#confirmModal").modal("hide");
                ajaxLock = false;
            } else {
                alert("注册失败");
                ajaxLock = false;
            }
        });
    });

    // 注册充值
    $(".register-recahrge").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_card_form").serialize();

        if (ajaxLock) {
            return false;
        }
        ajaxLock = true;

        $.post('/users/submitMembersRecharge', conditions, function (res) {
            if (res.status == 200) {
                $("#confirmModal").modal("show");
                ajaxLock = false;
            } else {
                alert("注册失败");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
