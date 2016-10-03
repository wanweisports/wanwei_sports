(function ($) {
    $(document).ready(function () {
        $('#member_form').validate({
            ignore: ":hidden"
        });
    });

    //更新会员信息
    $(".genxin-submit").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_form").serialize();

        if (ajaxLock || !$("#member_form").valid()) {
            return false;
        }
        ajaxLock = true;

        $.post('member/updateMemberName', conditions, function (res) {
            if (res.code == 1) {
                $("#gengxinModal").modal("show");
                ajaxLock = false;
            } else {
                alert(res.message);
                ajaxLock = false;
            }
        });
    });

    // 会员卡类型改变
    $("#member_type").on("change", function (e) {
        e.preventDefault();

        $.post('member/getMemberCarType', {cardTypeId: $(this).val()}, function (res) {
            if (res.code == 1) {
                var data = res.data;

                $('[name="cardTypeDiscount"]').val(data.cardTypeDiscount / 10.0);
                $('[name="cardTypeCredit"]').val(data.cardTypeCredit || 0);
                $('[name="cardTypeMoney"]').val(data.cardTypeMoney || 0);
                $('[name="cardDeadline"]').val(data.cardDeadline);
                $('[name="cardTypeAhead"]').val(data.cardTypeAhead || 0);

                //$(".total-money").html();
            } else {
                alert(res.message);
            }
        });
    });

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

        $.post('member/saveInvoice', conditions, function (res) {
            if (res.code == 1) {
                location.assign('member/memberList');
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

        $.post('member/saveMemberCar', conditions, function (res) {
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
