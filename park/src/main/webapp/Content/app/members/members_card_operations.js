(function ($) {
    //$(".member-card-filter").on("click", function (e) {
     //   e.preventDefault();

        // 获取新会员卡号
        $.post('member/getNewCardNo', function (res) {
            var data = res.data;
            if (res.code == 1) {
                $("#newCardNo").val(data.newCardNo);
            } else {
                alert("新会员卡号生成失败, 请稍后重试");
            }
        });
    //});

    // 切换tab
    $(".tab-card").on("click", function (e) {
        e.preventDefault();

        var $this = $(this);

        if ($this.hasClass("btn-info")) {
            return;
        }

        $(".tab-card.btn-info").removeClass("btn-info").addClass("btn-primary");
        $this.addClass("btn-info").removeClass("btn-primary");

        $(".refresh-card-panel").hide();
        $(".recharge-card-panel").hide();
        $(".upgrade-card-panel").hide();
        $("." + $this.attr("data-tab") + "-panel").show();
    });

    // 会员卡补办
    $(".refresh-card-submit").on("click", function (e) {
        e.preventDefault();

        // 生成新的会员卡号
        var $form = $(".refresh-card-form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/memberCardBuBan', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                alert("会员补办成功");
            } else {
                alert("会员补办失败, 请稍后重试");
            }
        });
    });

    // 会员卡充值
    $(".recharge-card-submit").on("click", function (e) {
        e.preventDefault();

        var $form = $(".recharge-card-form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/memberCardCZ', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                alert("会员充值成功");
            } else {
                alert("会员充值失败, 请稍后重试");
            }
        });
    });

    function getMemberCarType(id) {
        $.post('member/getMemberCarType', {cardTypeId: id}, function (res) {
            var data = res.data;

            if (res.code == 1) {
                $("#upgrade_cost").val(data.cardTypeMoney);
                $("#upgrade_discount").val(data.cardTypeDiscount);
                $("#upgrade_deadline").val(data.cardDeadline);
            } else {
                alert("卡类型信息查询失败, 请稍后重试");
            }
        });
    }

    // 卡类型改变查询
    $("[name='cardTypeId']").on("change", function (e) {
        e.preventDefault();

        var id = $(this).val();

        getMemberCarType(id);
    });
    
    $("[name='cardTypeId']").change();

    // 会员卡升级
    $(".upgrade-card-submit").on("click", function (e) {
        e.preventDefault();

        // 生成新的会员卡号
        var $form = $(".upgrade-card-form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/memberCardUpLevel', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                alert("会员升级成功");
            } else {
                alert("会员升级失败, 请稍后重试");
            }
        });
    });
})(jQuery);
