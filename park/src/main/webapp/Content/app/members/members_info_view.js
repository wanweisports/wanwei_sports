(function ($) {
    var Member_Info_View = {
        init: function () {
            this.initEvents();

            // 表单时间控件设置
            $(".form_datetime").datepicker({
                format: "yyyy-mm-dd",
                todayBtn: true,
                language: "zh-CN",
                orientation: "bottom auto"
            });

            // 生成新卡号
            $.post('member/getNewCardNo', function (res) {
                var data = res.data;
                if (res.code == 1) {
                    $("#newCardNo").val(data.newCardNo);
                } else {
                    alert("新会员卡号生成失败, 请稍后重试");
                }
            }, 'json');
        },
        initEvents: function () {
            // 更新会员信息
            $(".gengxin-modal").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/member/saveMember', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#gengxinModal").modal("show");
                    } else {
                        alert(res.message || "会员信息更新失败, 请稍后重试");
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

                $.post('/member/memberCardCZ', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "会员充值失败, 请稍后重试");
                    }
                });
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

                $.post('/member/memberCardBuBan', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert("会员补办失败, 请稍后重试");
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

            // 升级弹窗
            $(".shengji-modal").on("click", function (e) {
                e.preventDefault();

                var id = $('[name="cardTypeId"]').val();

                getMemberCarType(id);
            });

            // 卡类型改变查询
            $("[name='cardTypeId']").on("change", function (e) {
                e.preventDefault();

                var id = $(this).val();

                getMemberCarType(id);
            });

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
                        location.reload();
                    } else {
                        alert("会员升级失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Member_Info_View.init();
})(jQuery);
