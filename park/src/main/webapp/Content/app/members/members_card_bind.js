(function ($) {
    // 表单校验配置
    $(document).ready(function () {
        $('#member_form').validate({
            ignore: ":hidden"
        });
    });

    //更新会员信息
    $(".genxin-submit").on("click", function (e) {
        e.preventDefault();

        var $form = $("#member_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/updateMemberName', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                $("#tips_modal").modal("show");
            } else {
                alert("会员信息更新失败, 请稍后重试");
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
            } else {
                alert("会员类别详情查询失败, 请稍后重试");
            }
        });
    });

    // 会员绑卡充值
    $(".register-recahrge").on("click", function (e) {
        e.preventDefault();

        var $form = $("#member_card_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/saveMemberCar', conditions, function (res) {
            $form.attr("submitting", "");
            if (res.code == 1) {
                $("#confirm_modal").modal("show");
                $.each(res.data, function(key, item){
                    $("#member_card_ticket_form").find("input[name='" + key + "']").val(item);
                });
            } else {
                alert("会员卡充值失败, 请稍后重试");
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

    // 打印小票
    $(".print-ticket").on("click", function (e) {
        e.preventDefault();

        var $form = $("#member_card_ticket_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/saveInvoice', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                // 打印收款单 [未完成]

                location.assign('member/memberList');
                $("#confirmModal").modal("hide");
            } else {
                alert("打印流水单失败, 请稍后重试");
            }
        });
    });
})(jQuery);
