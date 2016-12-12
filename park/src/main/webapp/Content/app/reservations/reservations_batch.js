(function ($, moment) {
    var Venue_Bookings = {
        tpl: {
            BlockBooking: function () {
                return '<tr class="reservations-list-item" data-start="#BOOKING_START_DATE#" data-end="#BOOKING_END_DATE#" data-site="#BOOKING_SITE#">' +
                    '<td>#BOOKING_SPORT#</td><td>#BOOKING_START_DATE# ~ #BOOKING_END_DATE#</td>' +
                    '<td>#BOOKING_WEEK#</td><td>#BOOKING_START_TIME# ~ #BOOKING_END_TIME#</td><td>#BOOKING_AREA#</td>' +
                    '<td><a href="javascript:;" class="btn btn-danger reservations-delete"><span class="glyphicon glyphicon-trash"></span></a></td>' +
                    '</tr>';
            }
        },
        opts: {
            data: {
                name: "散客",
                mobile: "",
                memberId: "0",
                opType: "2",
                reserveType: "1",
                reserveModel: "2",
                siteReserveDateList: []
            }
        },
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#reservations_batch_startDate').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0,
                value: moment().format('YYYY-MM-DD')
            });

            $(".start-date-select").on("click", function (e) {
                e.preventDefault();

                $('#reservations_batch_startDate').datetimepicker("show");
            });

            $('#reservations_batch_endDate').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0,
                value: moment().format('YYYY-MM-DD')
            });

            $(".end-date-select").on("click", function (e) {
                e.preventDefault();

                $('#reservations_batch_endDate').datetimepicker("show");
            });

            $('#reservations_batch_start').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 60,
                value: '06:00'
            });

            $('#reservations_batch_end').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 60,
                value: '22:00'
            });

            this.initEvents();
            this.searchMembers();
            this.changePaidMoney();
        },
        formatWeek: function(date) {
            var week = moment(date).format("e");

            return week != "0" ? week : 7;
        },
        // 查询会员
        searchMembers: function () {
            var content = this;

            $("#reservations_batch_mobile").autosuggest({
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
                                    id: data.members[i].memberMobile,
                                    label: data.members[i].memberId,
                                    value: data.members[i].memberName + "(" + data.members[i].cardTypeName + ")"
                                });
                            }
                            return json;
                        } else {
                            $('#reservations_batch_member').val("0");
                            $('#reservations_batch_name').val("散客");
                            $('#reservations_batch_opType').val("2");
                            content.queryMemberBalance(0);
                            return [];
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var memberId = elm.data('label');
                    var mobile = elm.data('id');
                    var memberName = elm.data('value');

                    $('#reservations_batch_member').val(memberId);
                    $('#reservations_batch_mobile').val(mobile);
                    $("#reservations_batch_opType").val("1");
                    $('#reservations_batch_name').val(memberName.replace(/\(.+\)/, ""));

                    content.queryMemberBalance(memberId);
                }
            });
        },
        queryMemberBalance: function (memberId) {
            if (!memberId) {
                $('#reservations_paid_balance').val("0.00");
                return;
            }

            $.post('/member/memberDetail', {memberId: memberId}, function (res) {
                var data = res.data;
                var originalPrice = $("#reservations_paid_money").val();

                if (res.code == 1) {
                    $(".reservations-batch-cardMoney").text(data.cardBalance);
                    $('#reservations_paid_balance').val(data.cardBalance);
                    if (data.cardBalance >= originalPrice) {
                        $("#reservations_paid_money").val("0.00");
                    } else {
                        $("#reservations_paid_money").val(originalPrice - data.cardBalance);
                    }
                } else {
                    alert(res.message || "会员余额查询失败, 请稍后重试");
                }
            });
        },
        changePaidMoney: function () {
            $("#reservations_paid_paySumPrice").on("change", function (e) {
                e.preventDefault();

                var balance = $("#reservations_paid_balance").val();
                var paidPrice = $(this).val();

                balance = parseFloat(balance).toFixed(2);
                paidPrice = parseFloat(paidPrice).toFixed(2);

                if (balance >= paidPrice) {
                    $("#reservations_paid_money").val("0.00");
                } else {
                    $("#reservations_paid_money").val(paidPrice - balance);
                }
            });
        },
        // 计算
        calculateSiteMoney: function () {
            var content = this;

            $.post('/site/calculateSiteMoney', {
                siteOperationJson: JSON.stringify(content.opts.data)
            }, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    $(".reservations-batch-totalMoney").text(data.originalPrice);
                    $(".reservations-batch-totalNum").text(data.sumNums);

                    $("#reservations_paid_orderSumCount").val(data.sumNums);
                    $("#reservations_paid_orderSumPrice").val(data.originalPrice);
                    $("#reservations_paid_payCount").val(data.sumNums);
                    $("#reservations_paid_paySumPrice").val(data.originalPrice);
                    $("#reservations_paid_money").val(data.originalPrice);
                } else {
                    alert(res.message || "计算金额失败, 请稍后重试");
                }
            });
        },
        initEvents: function () {
            var content = this;

            // 场地类型改变
            $("#reservations_batch_site").on("change", function (e) {
                e.preventDefault();

                var $this = $(this);
                var tmp = '<option value="#SITEID#">#SITENAME#</option>';

                $.post('site/getSiteNames', {sportId: $this.val(), siteStatus: "1"}, function (res) {
                    var data = res.data;
                    var html = '';

                    if (res.code == 1) {
                        html += '<option value="">请选择</option>';

                        for (var i = 0; i < data.siteNames.length; i++) {
                            html += tmp.replace('#SITENAME#', data.siteNames[i].siteName)
                                .replace('#SITEID#', data.siteNames[i].siteId);
                        }

                        $("#reservations_batch_siteId").html(html);
                    } else {
                        console.log(res.message || "查询场地失败, 请稍后重试");
                        alert(res.message || "查询场地失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".reservations-list").on("click", ".reservations-delete", function (e) {
                e.preventDefault();

                var $list = $(this).parents("tr.reservations-list-item");
                var start = $list.attr("data-start");
                var end = $list.attr("data-end");
                var site = $list.attr("data-site");
                var list = content.opts.data.siteReserveDateList;

                for (var i = 0; i < list.length; i++) {
                    if (list[i].reserveStartDate == start && list[i].reserveEndDate == end &&
                        list[i].siteReserveTimeList[0].siteId == site) {
                        content.opts.data.siteReserveDateList.splice(i, 1);
                        break;
                    }
                }
                $list.remove();

                content.calculateSiteMoney();
            });

            // 加场
            $("#reservations_batch_add").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_batch_form");
                var $list = $(".reservations-list");
                var siteReserveDate = {};

                if (!$form.valid()) {
                    return false;
                }

                function __getCheckbox() {
                    var value = [];
                    var text = [];

                    $('input[name="reserveWeek"]:checked').each(function(){
                        value.push($(this).val());
                        text.push($(this).attr("data-text"));
                    });

                    return {value: value, text: text};
                }

                var data = content.opts.data;

                data.mobile = $("#reservations_batch_mobile").val();
                data.name = $("#reservations_batch_name").val();
                data.memberId = $("#reservations_batch_member").val() || "0";
                data.opType = $("#reservations_batch_opType").val();

                siteReserveDate.reserveStartDate = $("#reservations_batch_startDate").val();
                siteReserveDate.reserveEndDate = $("#reservations_batch_endDate").val();
                siteReserveDate.reserveWeek = __getCheckbox().value.join(",");
                siteReserveDate.siteReserveTimeList = [{
                    siteStartTime: $("#reservations_batch_start").val(),
                    siteEndTime: $("#reservations_batch_end").val(),
                    siteId: $("#reservations_batch_siteId").val()
                }];
                data.siteReserveDateList.push(siteReserveDate);

                $list.append(content.tpl.BlockBooking()
                    .replace(/#BOOKING_SPORT#/g, $("#reservations_batch_site").find("option:selected").text().trim())
                    .replace(/#BOOKING_START_DATE#/g, $("#reservations_batch_startDate").val())
                    .replace(/#BOOKING_END_DATE#/g, $("#reservations_batch_endDate").val())
                    .replace(/#BOOKING_START_TIME#/g, $("#reservations_batch_start").val())
                    .replace(/#BOOKING_END_TIME#/g, $("#reservations_batch_end").val())
                    .replace(/#BOOKING_AREA#/g, $("#reservations_batch_siteId").find("option:selected").text().trim())
                    .replace(/#BOOKING_WEEK#/g, "(" + __getCheckbox().text + ")"));

                content.calculateSiteMoney();
            });

            // 预订
            $("#reservations_batch_confirm").on("click", function (e) {
                e.preventDefault();

                var $list = $(".reservations-list");
                if ($list.find("tr").size() == 1) {
                    alert("请先加场");
                    return false;
                }

                var data = content.opts.data;
                /*data.mobile = $("#reservations_batch_mobile").val();
                data.name = $("#reservations_batch_name").val();
                data.memberId = $("#reservations_batch_member").val() || "0";
                data.opType = $("#reservations_batch_opType").val();*/

                $.post('site/saveReservationSite', {
                    siteOperationJson: JSON.stringify(content.opts.data)
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_paid_order").val(data.orderId);
                        $("#zhifuModal").modal({backdrop: false, show: true});
                    } else {
                        alert(res.message || "提交预订失败, 请稍后重试");
                    }
                });
            });

            // 确认支付
            $("#reservations_paid_confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_paid_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/site/confirmOrder', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#zhifuModal").modal("hide");

                        $("#tips_success_modal").modal({show: true, backdrop: false});
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        alert(res.message || "确认订单失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Venue_Bookings.init();
})(jQuery, moment);