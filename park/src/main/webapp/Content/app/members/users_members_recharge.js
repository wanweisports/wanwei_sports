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

        $.post('saveInvoice', conditions, function (res) {
            if (res.code == 1) {
                location.assign('MembersInfo');
                $("#confirmModal").modal("hide");
                ajaxLock = false;
            } else {
                alert(res.message);
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

        $.post('saveMemberCar', conditions, function (res) {
            if (res.code == 1) {
                $("#confirmModal").modal("show");
                ajaxLock = false;
                $.each(res.data, function(key, item){
                	$("#member_card_ticket_form").find("input[name='"+key+"']").val(item);
                });
            } else {
                alert(res.message);
                ajaxLock = false;
            }
        });
    });
})(jQuery);
