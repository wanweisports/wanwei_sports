(function ($) {
    // 表单校验设置
    $('#card_type_form').validate({
        ignore: ":hidden"
    });

    // 筛选会员类型
    $(".card-type-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#card_filter_form").serialize();

        location.assign('/member/getMemberCarTypes?' + conditions);
    });

    // 增加会员类型
    $(".card-type-add").on("click", function (e) {
        e.preventDefault();

        $("#card_type_id").val("");
        $("#card_type_name").val("");
        $("#card_type_month").val(0);
        $("#card_type_discount").val(0);
        $("#card_type_money").val(0);
        $("#card_type_overdraw").val(0);
        $("#card_payment_type").val(1);
        $("#card_type_ahead").val(0);
        $("#cardTypeStatus1").prop("checked", true);
    });

    // 支付类型改变
    $("#card_payment_type").on("change", function (e) {
        e.preventDefault();

        var val = $(this).val();

        if (val == 1) {
            $(".card-type-overdraw").hide();
        } else {
            $(".card-type-overdraw").show();
        }
    });

    $("#save_card_type").on("click", function (e) {
        e.preventDefault();

        var $form = $("#card_type_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");
        
        $.post('member/saveMemberCardType', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.reload();
            } else {
                alert("会员设置保存失败, 请稍后重试");
            }
        });
    });

    // 会员卡类型信息弹窗
    function renderCardTypeData(data) {
        var $form = $("#card_type_form");

        $.each(data, function (key, item) {
            $form.find("input[name='" + key + "']").not(":radio").not(":checkbox").val(item);
            $form.find("select[name='" + key + "']").not(".timeWeek").val(item);
        });

        if (data.cardTypeStatus) {
            $("input[name='cardTypeStatus'][value='" + data.cardTypeStatus + "']").prop("checked", true);
        }
        
        //时间处理
        var timeStart = data.cardTypeTimeStart.split(",");
        var timeEnd = data.cardTypeTimeEnd.split(",");
        var selectIndex = 0;
        $.each($("input[name='cardTypeWeek']"), function () {
            if(data.cardTypeWeek.indexOf($(this).val()) >= 0) {
                $(this).prop("checked", true);
                $(this).parent().parent().find("select[name='cardTypeTimeStart']").val(timeStart[selectIndex]);
                $(this).parent().parent().find("select[name='cardTypeTimeEnd']").val(timeEnd[selectIndex]);
                selectIndex++;
            }else{
                $(this).prop("checked", false);
            }
        });
    }

    // 卡类型详情
    $(".card-type-list").on("click", ".type-item", function (e) {
        e.preventDefault();

        var id = $(this).attr("data-id");

        $.post('member/getMemberCarType', {cardTypeId: id}, function (res) {
            if (res.code == 1) {
                renderCardTypeData(res.data);
            } else {
                alert("卡类型信息查询失败, 请稍后重试");
            }
        });
    });
})(jQuery);
