(function ($, moment) {
    var Site_Reservations = {
        opts: {
            STATUS: 0,       // 状态
            ORDERED: 1,      // 预订
            LOCKED: 2,       // 锁场
            REFRESHED: 3,    // 换场
            ATTENTION: 4,    // 开场
            Current_Date: $("#current_date").val(),
            Current_Sport: $("#current_sport").val(),
            Current_Week_Date: [],
            Reservation_Tpl: '<span class="name" data-id="#USERID#" data-name="#USERNAME#">#USERNAME1#</span>' +
                '<span class="mobile" data-mobile="#USERMOBILE#" data-card="#CARDNO#">#USERMOBILE1#</span>' +
                '<span class="angle" data-reserve="#RESERVETIMEID#"></span>',
            Reservation_Date_Tpl: '<li class="reservation-date-picker #DATEACTIVE#" data-value="#DATEVALUE#">' +
                '<a href="javascript:;">#DATETEXT#</a></li>',
            Reservation_list: '<li class="court">#SITENAME# #STARTTIME#-#ENDTIME#</li>'
        },
        init: function () {
            // 初始化日期
            this.initDatePicker();
            // 初始化日期菜单
            this.initMenuDate();
            this.loadReservations();
            this.initSequenceEvents();
            this.initMenuButtons();
            this.initReservationsSteps();
            this.changePaidMoney();
        },
        // 初始化时间选择控件
        initDatePicker: function () {
            var content = this;

            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#other_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                onSelectDate: function (ct, $el) {
                    content.opts.Current_Date = $el.val();

                    if (content.opts.Current_Week_Date.indexOf(content.opts.Current_Date) > -1) {
                        $(".sequence-date").find(".reservation-date-picker[data-value='" + content.opts.Current_Date + "']")
                            .addClass("active").siblings().removeClass("active");
                    } else {
                        $(".sequence-date").find(".reservation-date-picker").removeClass("active");
                    }

                    content.loadReservations();
                }
            });

            $(".other-date-calendar").on("click", function (e) {
                e.preventDefault();

                $('#other_date').datetimepicker("show");
            });
        },
        formatWeek: function(date) {
            var week = moment(date).format("e");

            return week != "0" ? week : 7;
        },
        // 初始化菜单日期
        initMenuDate: function () {
            var content = this;

            var date = moment(content.opts.Current_Date);
            var Weeks = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
            var htmlArr = [];
            var week;
            var weekday = parseInt(date.format("e"));//[1,2,3,4,5,6,0]

            for (var i = 1; i <= 7; i++) {
                date = moment(content.opts.Current_Date);
                if (i < weekday) {
                    date.subtract(weekday - i, 'd');
                } else {
                    date.add(i - weekday, 'd');
                }

                if (date.format('e') == weekday) {
                    week = '今天';
                } else {
                    week = Weeks[date.format('e')];
                }

                htmlArr.push(
                    content.opts.Reservation_Date_Tpl
                        .replace(/#DATEACTIVE#/, week != '今天' ? '' : 'active')
                        .replace(/#DATEVALUE#/, date.format('YYYY-MM-DD'))
                        .replace(/#DATETEXT#/, week + '(' + date.format('MM-DD') + ')')
                );

                content.opts.Current_Week_Date.push(date.format('YYYY-MM-DD'));
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
                $("#other_date").val(content.opts.Current_Date);
                content.loadReservations();
            });

            var $draggableBtn = $(".show-orders-btn");
            var $draggableList = $(".show-orders-list");
            var $draggable = $draggableBtn.draggabilly({axis: 'x'});
            var $textDraggableBtn = $draggableBtn.find(".btn");
            $draggable.on('dragStart', function () {
                $draggableBtn.css("position", "fixed");
                $draggableList.hide();
            });
            $draggable.on('dragEnd', function (e, p) {
                $draggableBtn.css("position", "fixed");
                $draggableList.css("left", (p.x - 200) + "px");
                if ($textDraggableBtn.text() === "显示") {
                    $draggableList.hide();
                } else {
                    $draggableList.show();
                }
            });
            $draggable.on('staticClick', function () {
                if ($textDraggableBtn.text() === "显示") {
                    $textDraggableBtn.text("隐藏");
                    $draggableList.show();
                } else {
                    $textDraggableBtn.text("显示");
                    $draggableList.hide();
                }
            });
            $draggableBtn.css("position", "fixed");
        },
        // 加载当前所选日期的场地预订情况
        loadReservations: function () {
            var content = this;

            var $sequence = $(".sequence-show");
            $sequence.find("tr.timing-body td:not(.time)").removeClass();
            var currentDate = moment();

            if (content.opts.Current_Date === currentDate.format("YYYY-MM-DD")) {
                var currentTime = currentDate.format("HH:00");

                $sequence.find("tr.timing-body").each(function (index, el) {
                    var startTime = $(el).attr("data-start");

                    // 不可使用
                    if (currentTime > startTime) {
                        $(el).find("td:not(.time)").removeClass().addClass("disabled").addClass("time-end").html("");
                    }
                });
            }

            if (content.opts.Current_Date < currentDate.format("YYYY-MM-DD")) {
                $sequence.find("tr.timing-body").find("td:not(.time)").removeClass().addClass("disabled").addClass("time-end").html("");
            }

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

                            var html = '';
                            // 场地已预订
                            if (reserveInfo.siteReserveStatus == 1) {
                                html = content.opts.Reservation_Tpl
                                    .replace(/#RESERVETIMEID#/, reserveInfo.reserveTimeId || "")
                                    .replace(/#CARDNO#/, reserveInfo.cardNo || "")
                                    .replace(/#USERID#/, reserveInfo.operatorId)
                                    .replace(/#USERNAME#/, reserveInfo.operatorName)
                                    .replace(/#USERNAME1#/, reserveInfo.operatorName.substr(0, 2) + "*")
                                    .replace(/#USERMOBILE#/, reserveInfo.operatorMobile)
                                    .replace(/#USERMOBILE1#/, "*" + reserveInfo.operatorMobile.substr(-4));
                                if (reserveInfo.reserveType == 1) {  // PC预订
                                    $site.removeClass().addClass('ordered computer').html(html);
                                } else if (reserveInfo.reserveType == 2) {  // 微信预订
                                    $site.removeClass().addClass('ordered mobile').html(html);
                                } else if (reserveInfo.reserveType == 3) {  // 电话预订
                                    $site.removeClass().addClass('ordered phone').html(html);
                                }

                                if (reserveInfo.isUse == 1) {
                                    $site.addClass("signed");
                                }
                                if (reserveInfo.isUse == 2) {
                                    $site.addClass("used");
                                }
                            }

                            // 未支付
                            if (reserveInfo.siteReserveStatus == 2) {
                                html = content.opts.Reservation_Tpl
                                    .replace(/#RESERVETIMEID#/, reserveInfo.reserveTimeId || "")
                                    .replace(/#CARDNO#/, reserveInfo.cardNo || "")
                                    .replace(/#USERID#/, reserveInfo.operatorId)
                                    .replace(/#USERNAME#/, reserveInfo.operatorName)
                                    .replace(/#USERNAME1#/, reserveInfo.operatorName.substr(0, 2) + "*")
                                    .replace(/#USERMOBILE#/, reserveInfo.operatorMobile)
                                    .replace(/#USERMOBILE1#/, "*" + reserveInfo.operatorMobile.substr(-4));
                                if (reserveInfo.reserveType == 1) {
                                    $site.removeClass().addClass('unpaid computer').html(html);
                                } else if (reserveInfo.reserveType == 2) {
                                    $site.removeClass().addClass('unpaid mobile').html(html);
                                } else if (reserveInfo.reserveType == 3) {
                                    $site.removeClass().addClass('unpaid phone').html(html);
                                }

                                if (reserveInfo.isUse == 1) {
                                    $site.addClass("signed");
                                }
                                if (reserveInfo.isUse == 2) {
                                    $site.addClass("used");
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
                            if (reserveInfo.siteReserveStatus == 5 && !$site.hasClass("time-end")) {
                                $site.removeClass().addClass("null").html("");
                            }
                        }
                    }
                } else {
                    $.logConsole('查询预订信息失败', res.message);
                    $.tipsWarningAlert('查询预订信息失败');
                }
            });
        },
        // 显示右侧所选场地
        addReservationsSelected: function (status) {
            var content = this;

            var $sequenceTable = $(".sequence-show");
            var $ordersList = $(".show-orders-list");
            var $ordersListSelected = $ordersList.find(".selected-booking");
            var $selected;
            var data = [];
            var html = "";

            if (status === content.opts.ORDERED) {
                $selected = $sequenceTable.find('td.selected');
                $(".sequence-order").attr("data-click", "yes").show();
                $(".sequence-lock").attr("data-click", "yes").show();
                $(".sequence-unlock").attr("data-click", "no").hide();
                $(".sequence-refresh").attr("data-click", "no").hide();
                $(".sequence-attention").attr("data-click", "no").hide();
            }
            if (status === content.opts.REFRESHED) {
                $selected = $sequenceTable.find('td.sel');
                $(".sequence-order").attr("data-click", "no").hide();
                $(".sequence-lock").attr("data-click", "no").hide();
                $(".sequence-unlock").attr("data-click", "no").hide();
                $(".sequence-refresh").attr("data-click", "no").hide();
                $(".sequence-attention").attr("data-click", "yes").show();
            }
            if (status === content.opts.LOCKED) {
                $selected = $sequenceTable.find('td.sel');
                $(".sequence-order").attr("data-click", "no").hide();
                $(".sequence-lock").attr("data-click", "no").hide();
                $(".sequence-unlock").attr("data-click", "yes").show();
                $(".sequence-refresh").attr("data-click", "no").hide();
                $(".sequence-attention").attr("data-click", "no").hide();
            }

            $ordersListSelected.find(".court").remove();

            if ($selected.size() === 0) {
                $ordersListSelected.find(".none").show();
                return;
            }

            $selected = $selected.sort(function (min, max) {
                return $(min).attr("data-col") - $(max).attr("data-col");
            });
            var $sel = null;
            for (var i = 0; i < $selected.size(); i++) {
                $sel = $selected.eq(i);

                html += content.opts.Reservation_list.replace("#SITENAME#", $sel.attr("data-name"))
                    .replace("#STARTTIME#", $sel.attr("data-start"))
                    .replace("#ENDTIME#", $sel.attr("data-end"));
            }

            $ordersListSelected.find(".none").hide();
            $ordersListSelected.append(html);
            $ordersList.find(".court-display .number").text($selected.size());
        },
        // 初始化时序图的事件绑定
        initSequenceEvents: function () {
            var content = this;

            var $sequenceTable = $(".sequence-show");

            // 场地鼠标
            $sequenceTable.on("mouseover", "tr.timing-body td:not(.time)", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.parents("tr").addClass("active").siblings().removeClass("active");
                $this.parents("table").find("[data-col='" + $this.attr("data-col") + "']").addClass("active")
                    .siblings().removeClass("active");
            });

            // 空闲场地预订
            $sequenceTable.on("click", "td.null", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.addClass("selected").removeClass("null").html("");
                content.addReservationsSelected(content.opts.ORDERED);
            });

            // 已选择的取消
            $sequenceTable.on("click", "td.selected", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.addClass("null").removeClass("selected").html("");
                content.addReservationsSelected(content.opts.ORDERED);
            });

            // 开场换场选择
            $sequenceTable.on("click", "td.ordered,td.unpaid", function (e) {
                e.preventDefault();

                var $this = $(this);

                $sequenceTable.find("td.selected").addClass("null").removeClass("selected").html("");
                $this.addClass("sel");

                var $sel = null, mobile;
                var $selected = $sequenceTable.find('td.sel');
                for (var i = 0; i < $selected.size(); i++) {
                    $sel = $selected.eq(i);

                    if (!mobile) {
                        mobile = $sel.find("span.mobile").attr("data-mobile");
                    }

                    if ($sel.find("span.mobile").attr("data-mobile") !== mobile) {
                        $.tipsWarningAlert('请选择相同人的预订场地');
                        $this.addClass("sel").removeClass("sel");
                        return;
                    }
                }

                content.addReservationsSelected(content.opts.REFRESHED);
            });

            // 锁场选择
            $sequenceTable.on("click", "td.locked", function (e) {
                e.preventDefault();

                var $this = $(this);

                $sequenceTable.find("td.selected").addClass("null").removeClass("selected").html("");
                $this.addClass("sel");
                content.addReservationsSelected(content.opts.LOCKED);
            });

            // 选择
            $sequenceTable.on("click", "td.sel", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.removeClass("sel");
                content.addReservationsSelected(content.opts.LOCKED);
            });
        },
        // 找到选中的场地
        findReservationsSelected: function (status) {
            var content = this;

            var $sequenceTable = $(".sequence-show");
            var $selected;
            var data = [];

            if (status === content.opts.ORDERED) {
                $sequenceTable.find('td.sel').removeClass("sel");
                $selected = $sequenceTable.find('td.selected');
            }
            if (status === content.opts.REFRESHED) {
                $sequenceTable.find('td.locked.sel').removeClass("sel");
                $selected = $sequenceTable.find('td.sel');
            }
            if (status === content.opts.LOCKED) {
                $sequenceTable.find('td.ordered.sel').removeClass("sel");
                $sequenceTable.find('td.unpaid.sel').removeClass("sel");
                $selected = $sequenceTable.find('td.sel');
            }

            if ($selected.size() === 0) {
                return data;
            }

            for (var i = 0; i < $selected.size(); i++) {
                var $sel = $selected.eq(i);

                data.push({
                    siteStartTime: $sel.attr("data-start"),
                    siteEndTime: $sel.attr("data-end"),
                    siteId: $sel.attr("data-id"),
                    mobile: $sel.find("span.mobile").attr("data-mobile"),
                    name: $sel.find("span.name").attr("data-name"),
                    member: $sel.find("span.name").attr("data-id"),
                    card: $sel.find("span.mobile").attr("data-card"),
                    timeId: $sel.find("span.angle").attr("data-reserve")
                });
            }

            return data;
        },
        // 初始化菜单操作
        initMenuButtons: function () {
            var content = this;
            var $reservationsModal = $("#pay_model");

            // 锁场
            $(".sequence-lock").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return $.tipsWarningAlert('当前不能锁定场地');
                }

                var data = content.findReservationsSelected(content.opts.ORDERED);

                if (data.length === 0) {
                    return $.tipsWarningAlert('请先选择场地');
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: content.formatWeek(content.opts.Current_Date),
                        siteReserveTimeList: data
                    }]
                };
                $.post('/site/lockSite', {
                    siteOperationJson: JSON.stringify(content.opts.data),
                    lock: true
                }, function (res) {
                    if (res.code == 1) {
                        content.loadReservations();
                        $.tipsSuccessAlert('您已经成功锁定这些场地！');
                    } else {
                        $.logConsole('锁场失败', res.message);
                        $.tipsWarningAlert('锁场失败');
                    }
                });
            });

            // 解锁
            $(".sequence-unlock").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return $.tipsWarningAlert('当前不能解锁场地');
                }

                var data = content.findReservationsSelected(content.opts.LOCKED);

                if (data.length === 0) {
                    return $.tipsWarningAlert('请先选择场地');
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: content.formatWeek(content.opts.Current_Date),
                        siteReserveTimeList: data
                    }]
                };
                $.post('/site/lockSite', {
                    siteOperationJson: JSON.stringify(content.opts.data),
                    lock: false
                }, function (res) {
                    if (res.code == 1) {
                        content.loadReservations();
                        $.tipsSuccessAlert('您已经成功解锁这些场地！');
                    } else {
                        $.logConsole('解锁失败', res.message);
                        $.tipsWarningAlert('解锁失败');
                    }
                });
            });

            // 预订
            $(".sequence-order").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return $.tipsWarningAlert('当前不能预订场地');
                }

                var data = content.findReservationsSelected(content.opts.ORDERED);

                if (data.length === 0) {
                    return $.tipsWarningAlert("请先选择场地");
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: content.formatWeek(content.opts.Current_Date),
                        siteReserveTimeList: data
                    }]
                };

                $.post('/site/calculateSiteMoney', {
                    siteOperationJson: JSON.stringify(content.opts.data)
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_user_amount").val(data.originalPrice);

                        $("#reservations_paid_orderSumCount").val(data.sumNums);
                        $("#reservations_paid_orderSumPrice").val(data.originalPrice);
                        $("#reservations_paid_payCount").val(data.sumNums);
                        $("#reservations_paid_paySumPrice").val(data.originalPrice);
                        $("#reservations_paid_money").val(data.originalPrice);
                    } else {
                        $.logConsole('计算金额失败', res.message);
                        $.tipsWarningAlert('计算金额失败');
                    }
                });

                $reservationsModal.modal({backdrop: false, show: true});
                $("#reservations_user_name").val("");
                $("#reservations_user_mobile").val("");
            });

            // 换场
            $(".sequence-refresh").on("click", function (e) {
                e.preventDefault();

                return false;
            });

            // 开场
            $(".sequence-attention").on("click", function (e) {
                e.preventDefault();

                var data = content.findReservationsSelected(content.opts.REFRESHED);
                if (data.length === 0) {
                    return $.tipsWarningAlert("请先选择场地");
                }

                $("#attention_user_name").val(data[0].name);
                $("#attention_user_mobile").val(data[0].mobile);
                $("#attention_user_opType").val(data[0].member > 0 ? "1" : "2");
                $("#attention_user_id").val(data[0].member);
                $("#attention_user_card").val(data[0].card);

                $("#attentionModal").modal({backdrop: false, show: true});
            });

            // 开场
            $("#attention_user_confirm").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return $.tipsWarningAlert("当前不能开场");
                }

                var data = content.findReservationsSelected(content.opts.REFRESHED);
                var ids = [];

                if (data.length === 0) {
                    return $.tipsWarningAlert("请先选择场地");
                }

                for (var i = 0; i < data.length; i++) {
                    ids.push(data[i].timeId);
                }

                $.post('/memberSign/memberSign', {
                    signType: $("#attention_user_opType").val(),
                    signMobile: $("#attention_user_mobile").val(),
                    signName: $("#attention_user_name").val(),
                    signMemberCardNo: $("#attention_user_card").val(),
                    reserveTimeIds: ids.join(","),
                    signDate: content.opts.Current_Date,
                    memberId: $("#attention_user_id").val()
                }, function (res) {
                    if (res.code == 1) {
                        $("#attentionModal").modal("hide");

                        location.reload();
                    } else {
                        $.logConsole('签到开场失败', res.message);
                        $.tipsWarningAlert('签到开场失败');
                    }
                });
            });
        },
        // 预订弹窗弹窗
        initReservationsSteps: function () {
            var content = this;
            var $reservationsModal = $("#pay_model");

            // 支付订单
            $("#reservations_pay_order").on("click", function (e) {
                e.preventDefault();

                function __saveOrder(cb) {
                    var $form = $("#reservations_user_form");

                    if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                        return false;
                    }
                    $form.attr("submitting", "submitting");

                    var data = content.opts.data;
                    data.name = $("#reservations_user_name").val();
                    data.mobile = $("#reservations_user_mobile").val();
                    data.memberId = $("#reservations_user_member").val() || "0";
                    data.opType = $("#reservations_user_opType").val();
                    data.reserveType = "1";
                    data.reserveModel = "1";

                    $.post('/site/saveReservationSite', {
                        siteOperationJson: JSON.stringify(data)
                    }, function (res) {
                        $form.attr("submitting", "");
                        var data = res.data;

                        if (res.code == 1) {
                            $("#reservations_paid_order").val(data.orderId);
                            cb();
                        } else {
                            $.logConsole('提交预订失败', res.message);
                            $.tipsWarningAlert('提交预订失败');
                        }
                    });
                }

                function __confirmOrder() {
                    var $form = $("#reservations_paid_form");
                    var conditions = $form.serialize();

                    if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                        return false;
                    }
                    $form.attr("submitting", "submitting");

                    $.post('/site/confirmOrder', conditions, function (res) {
                        $form.attr("submitting", "");

                        if (res.code == 1) {
                            content.loadReservations();
                            $.tipsSuccessAlert('预订支付成功！', function () {
                                $reservationsModal.modal("hide");
                            });
                        } else {
                            $.logConsole('确认订单失败', res.message);
                            $.tipsWarningAlert('确认订单失败');
                        }
                    });
                }

                __saveOrder(__confirmOrder);
            });

            // 去支付
            /*$("#reservations_user_pay").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_user_form");

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                var data = content.opts.data;
                data.name = $("#reservations_user_name").val();
                data.mobile = $("#reservations_user_mobile").val();
                data.memberId = $("#reservations_user_member").val() || "0";
                data.opType = $("#reservations_user_opType").val();
                data.reserveType = "1";
                data.reserveModel = "1";

                $.post('/site/saveReservationSite', {
                    siteOperationJson: JSON.stringify(data)
                }, function (res) {
                    $form.attr("submitting", "");
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_paid_order").val(data.orderId);
                    } else {
                        $.tipsWarningAlert(res.message || "提交预订失败, 请稍后重试");
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
                        $reservationsModal.modal("hide");
                        content.loadReservations();
                    } else {
                        $.tipsWarningAlert(res.message || "确认订单失败, 请稍后重试");
                    }
                });
            });*/

            // 检索会员
            $("#reservations_user_name").autosuggest({
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
                            $('#reservations_user_member').val("0");
                            $('#reservations_user_opType').val("2");
                            content.queryMemberBalance(0);
                            return [];
                        }
                    } else {
                        $.logConsole('搜索会员失败', res.message);
                        $.tipsWarningAlert('搜索会员失败');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var memberId = elm.data('label');
                    var mobile = elm.data('id');
                    var memberName = elm.data('value');

                    $('#reservations_user_member').val(memberId);
                    $('#reservations_user_mobile').val(mobile);
                    $("#reservations_user_opType").val("1");
                    $('#reservations_user_name').val(memberName.replace(/\(.+\)/, ""));

                    content.queryMemberBalance(memberId);
                }
            });
        },
        queryMemberBalance: function (memberId) {
            if (!memberId) {
                $('#reservations_paid_balance').val("您还不是会员");
                return;
            }

            $.post('/member/memberDetail', {memberId: memberId}, function (res) {
                var data = res.data;
                var originalPrice = $("#reservations_paid_money").val();

                if (res.code == 1) {
                    $('#reservations_paid_balance').val(data.cardBalance);
                    if (data.cardBalance >= originalPrice) {
                        $("#reservations_paid_money").val("0.00");
                    } else {
                        $("#reservations_paid_money").val(originalPrice - data.cardBalance);
                    }
                } else {
                    $.logConsole('会员余额查询失败', res.message);
                    $.tipsWarningAlert('会员余额查询失败');
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
        }
    };

    Site_Reservations.init();
})(jQuery, moment);
