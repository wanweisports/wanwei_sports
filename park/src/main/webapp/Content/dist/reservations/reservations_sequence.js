(function ($, moment) {
    var Site_Reservations = {
        tpl: {
            show: function () {
                return '<span>#USERNAME#</span><span>#USERMOBILE#</span>';
            }
        },
        opts: {
            Current_Date: $("#current_date").val(),
            Current_Sport: $("#current_sport").val(),
            Reservation_Tpl: '<span>#USERNAME#</span><span>#USERMOBILE#</span>',
            Reservation_Date_Tpl: '<li class="reservation-date-picker #DATEACTIVE#" data-value="#DATEVALUE#">' +
                '<a href="javascript:;">#DATETEXT#</a></li>'
        },
        init: function () {
            this.initDatePicker();
            this.initMenuDate();
            this.loadReservations();
            this.initSequenceEvents();
            this.initMenuButtons();
            this.initReservationsSteps();
        },
        // 初始化时间选择控件
        initDatePicker: function () {
            var content = this;

            $.datetimepicker.setLocale('zh');

            $('#other_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                inline: true,
                maxDate: 0,
                onSelectDate: function (ct, $el) {
                    content.opts.Current_Date = $el.val();
                    $(".other-date .icon-text").text(content.opts.Current_Date);
                    content.loadReservations();

                    $(".other-date-calendar").hide();
                }
            });

            $(".other-date").on("click", function (e) {
                e.preventDefault();

                if ($(".other-date-calendar").is(":visible")) {
                    $(".other-date-calendar").hide();
                } else {
                    $(".other-date-calendar").show();
                }
            });
        },
        // 初始化菜单日期
        initMenuDate: function () {
            var content = this;

            var date = moment(content.opts.Current_Date);
            var Weeks = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
            var htmlArr = [];

            htmlArr.push(
                content.opts.Reservation_Date_Tpl
                    .replace(/#DATEACTIVE#/, 'active')
                    .replace(/#DATEVALUE#/, date.format('YYYY-MM-DD'))
                    .replace(/#DATETEXT#/, '今天(' + date.format('MM-DD') + ')')
            );

            for (var i = 0; i < 6; i++) {
                date.add(1, 'd');

                htmlArr.push(
                    content.opts.Reservation_Date_Tpl
                        .replace(/#DATEACTIVE#/, '')
                        .replace(/#DATEVALUE#/, date.format('YYYY-MM-DD'))
                        .replace(/#DATETEXT#/, (i !== 0 ? Weeks[date.format('e')] : "明天") + '(' + date.format('MM-DD') + ')')
                );
            }

            $(".other-date-select").before(htmlArr.join(''));

            $(".sequence-date").on("click", ".reservation-date-picker", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.hasClass("active")) {
                    return;
                }

                $this.addClass("active").siblings().removeClass("active");

                content.opts.Current_Date = $this.attr("data-value");
                content.loadReservations();
            });
        },
        // 加载当前所选日期的场地预订情况
        loadReservations: function () {
            var content = this;

            $.post('/site/dynamicSiteReservation', {
                siteDate: content.opts.Current_Date,
                sportId: content.opts.Current_Sport
            }, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var siteInfos = data.siteInfos;
                    for (var i = 0; i < siteInfos.length; i++) {
                        var siteInfo = siteInfos[i];
                        var reserveInfos = siteInfo.reserveInfos;
                        for (var j = 0; j < reserveInfos.length; j++) {
                            var reserveInfo = reserveInfos[j];

                            var $site = $('[data-id="' + siteInfo.siteId + '"]' +
                                '[data-start="' + reserveInfo.startTime + '"]' +
                                '[data-end="' + reserveInfo.endTime + '"]');

                            // 场地已预订
                            if (reserveInfo.siteReserveStatus == 1) {
                                if (reserveInfo.reserveType == 1) {  // PC预订
                                    $site.removeClass().addClass('ordered computer')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(1) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                } else if (reserveInfo.reserveType == 2) {  // 微信预订
                                    $site.removeClass().addClass('ordered mobile')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(1) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                } else if (reserveInfo.reserveType == 3) {  // 电话预订
                                    $site.removeClass().addClass('ordered phone')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(1) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                }

                            }

                            // 未支付
                            if (reserveInfo.siteReserveStatus == 2) {
                                if (reserveInfo.reserveType == 1) {
                                    $site.removeClass().addClass('unpaid computer')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(1) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                } else if (reserveInfo.reserveType == 2) {
                                    $site.removeClass().addClass('unpaid mobile')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(1) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                } else if (reserveInfo.reserveType == 3) {
                                    $site.removeClass().addClass('unpaid phone')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(1) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                }
                            }

                            // 已锁定
                            if (reserveInfo.siteReserveStatus == 3) {
                                $site.removeClass().addClass("locked").html("");
                            }

                            // 不可使用
                            if (reserveInfo.siteReserveStatus == 4) {
                                $site.removeClass().addClass("disabled").html("");
                            }

                            // 空场地
                            if (reserveInfo.siteReserveStatus == 5) {
                                $site.removeClass().addClass("null").html("");
                            }
                        }
                    }
                } else {
                    alert(res.message || "查询预订信息失败, 请稍后重试");
                }
            });
        },
        // 初始化时序图的事件绑定
        initSequenceEvents: function () {
            var $sequenceTable = $(".sequence-show");

            // 空闲场地预订
            $sequenceTable.on("click", "td.null", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.addClass("selected").removeClass("null").html("");
            });

            // 已选择的取消
            $sequenceTable.on("click", "td.selected", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.addClass("null").removeClass("selected").html("");
            });
        },
        // 初始化菜单操作
        initMenuButtons: function () {
            var content = this;
            var $reservationsSteps = $("#zhifuModal");

            function _findSelectedArea() {
                var $sequenceTable = $(".sequence-show");
                var $selected = $sequenceTable.find('td.selected');
                var data = [];

                if ($selected.size() === 0) {
                    return data;
                }

                for (var i = 0; i < $selected.size(); i++) {
                    var $sel = $selected.eq(i);

                    data.push({
                        siteStartTime: $sel.attr("data-start"),
                        siteEndTime: $sel.attr("data-end"),
                        siteId: $sel.attr("data-id")
                    });
                }

                return data;
            }

            // 锁场
            $(".sequence-lock").on("click", function (e) {
                e.preventDefault();

                $(".tips-modal").modal({backdrop: false, show: true});
            });

            // 预订
            $(".sequence-order").on("click", function (e) {
                e.preventDefault();

                var data = _findSelectedArea();

                if (data.length === 0) {
                    return alert("请选择场地");
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: (new Date(content.opts.Current_Date)).getDay() || 7,
                        siteReserveTimeList: data
                    }]
                };
                $.post('/site/calculateSiteMoney', {
                    siteOperationJson: JSON.stringify(content.opts.data)
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_amount").val(data.originalPrice);
                    } else {
                        alert(res.message || "计算金额失败, 请稍后重试");
                    }
                });

                $reservationsSteps.modal({backdrop: false, show: true});
            });
        },
        // 预订弹窗弹窗
        initReservationsSteps: function () {
            var content = this;
            var $reservationsSteps = $("#zhifuModal");

            // 初始化支付流程步骤
            $reservationsSteps.find(".reservations-steps").steps({
                enableFinishButton: false,
                enablePagination: false,
                enableAllSteps: false
            });

            // 去支付
            $(".reservations-pay").on("click", function (e) {
                e.preventDefault();

                $reservationsSteps.find(".reservations-steps").steps("next", 1);

                var data = content.opts.data;
                data.name = $("#reservations_name").val();
                data.mobile = $("#reservations_mobile").val();
                //data.memberId = "";
                data.opType = "2";
                data.reserveType = "1";
                data.reserveModel = "1";

                $.post('/site/saveReservationSite', {
                    siteOperationJson: JSON.stringify(data)
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_order_id").val(data.orderId);
                        $("#reservations_order_no").val(data.orderNo);
                        $reservationsSteps.find(".reservations-steps").steps("next", 1);
                    } else {
                        alert(res.message || "提交预订失败, 请稍后重试");
                    }
                });
            });

            // 确认支付
            $(".reservations-pay-confirm").on("click", function (e) {
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
                        $reservationsSteps.modal("hide");
                        content.loadReservations();
                        //location.reload();
                    } else {
                        alert(res.message || "确认订单失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Site_Reservations.init();
})(jQuery, moment);
