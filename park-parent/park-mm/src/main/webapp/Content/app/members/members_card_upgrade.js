(function ($) {
    var Members_Card_Upgrade = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            $("#keywords").autosuggest({
                url: '/member/searchMember',
                method: 'post',
                queryParamName: 'search',
                dataCallback:function(res) {
                    var data = res.data;
                    var json = [];

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            for (var i = 0; i < data.members.length; i++) {
                                json.push({
                                    id: data.members[i].memberId,
                                    label: data.members[i].cardNo,
                                    value: data.members[i].memberName + '(' + data.members[i].memberMobile + ',' + data.members[i].cardNo + ')'
                                });
                            }
                            return json;
                        } else {
                            alert('没有搜索到会员');
                            return [];
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var cardNo = elm.data('label');

                    $('#card_no').val(cardNo);
                    location.assign('member/getMembersCardUpgrade?cardNo=' + cardNo);
                }
            });

            // 筛选
            $(".member-card-filter").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_card_form");
                var conditions = $form.serialize();

                if (!$form.valid()) {
                    return false;
                }

                $.post('member/searchMember', conditions, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            location.assign('member/getMembersCardUpgrade?cardNo='
                                + data.members[0].cardNo);
                        } else {
                            alert('没有搜索到会员');
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                    }
                });
            });

            function _getMemberCarType(id) {
                $.post('member/getMemberCarType', {cardTypeId: id}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#upgrade_cost").val(data.cardTypeMoney + "元");
                        $("#upgrade_discount").val(data.cardTypeDiscount + "折");
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

                _getMemberCarType(id);
            });
            $("[name='cardTypeId']").change();

            // 会员卡升级
            $(".upgrade-card-submit").on("click", function (e) {
                e.preventDefault();

                // 生成新的会员卡号
                var $form = $("#upgrade_card_form");
                var conditions = $form.serialize();

                if ($("#upgrade_cardId").val() === "") {
                    alert("请先选择会员卡");
                    return false;
                }

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
        }
    };

    Members_Card_Upgrade.init();
})(jQuery);
