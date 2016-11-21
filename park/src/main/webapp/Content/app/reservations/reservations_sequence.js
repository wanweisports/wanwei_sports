(function ($, moment) {
    var Site_Reservations = {
        opts: {
            STATUS: 0,       // 状态
            ORDERED: 1,      // 预订
            LOCKED: 2,       // 锁场
            REFRESHED: 3,    // 换场
            Current_Date: $("#current_date").val(),
            Current_Sport: $("#current_sport").val(),
            Reservation_Tpl: '<span>#USERNAME#</span><span>#USERMOBILE#</span>',
            Reservation_Date_Tpl: '<li class="reservation-date-picker #DATEACTIVE#" data-value="#DATEVALUE#">' +
                '<a href="javascript:;">#DATETEXT#</a></li>',
            Reservation_list: '<li class="court">#SITENAME# #STARTTIME#-#ENDTIME#</li>'
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

            // 表单时间控件设置
            $('#other_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                onSelectDate: function (ct, $el) {
                    content.opts.Current_Date = $el.val();
                    $(".sequence-date").find(".reservation-date-picker[data-value='" + content.opts.Current_Date + "']")
                        .addClass("active").siblings().removeClass("active");

                    content.loadReservations();
                }
            });

            $(".other-date-calendar").on("click", function (e) {
                e.preventDefault();

                $('#other_date').datetimepicker("show");
            });
        },
        // 初始化菜单日期
        initMenuDate: function () {
            var content = this;

            var date = moment(content.opts.Current_Date);
            var Weeks = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
            var htmlArr = [];
            var week;
            var weekday = date.weekday();

            for (var i = 1 - weekday; i <= 7 - weekday; i++) {
                date = moment(content.opts.Current_Date);
                date.add(i, 'd');

                if (date.format('e') == weekday) {
                    week = '今天';
                } else if (date.format('e') == (weekday + 1)) {
                    week = '明天';
                } else if (date.format('e') == (weekday - 1)) {
                    week = '昨天';
                } else {
                    week = Weeks[date.format('e')];
                }

                htmlArr.push(
                    content.opts.Reservation_Date_Tpl
                        .replace(/#DATEACTIVE#/, week != '今天' ? '' : 'active')
                        .replace(/#DATEVALUE#/, date.format('YYYY-MM-DD'))
                        .replace(/#DATETEXT#/, week + '(' + date.format('MM-DD') + ')')
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

            $(".show-orders-btn .btn").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.text() === "显示") {
                    $this.text("隐藏");
                    $(".show-orders-list").show();
                } else {
                    $this.text("显示");
                    $(".show-orders-list").hide();
                }
            });
        },
        // 加载当前所选日期的场地预订情况
        loadReservations: function () {
            var content = this;

            var $sequence = $(".sequence-show");
            $sequence.find("tr.timing-body td:not(.time)").removeClass();
            var currentDate = moment();

            if (content.opts.Current_Date === currentDate.format("YYYY-MM-DD")) {
                var currentTime = currentDate.format("HH:ss");

                $sequence.find("tr.timing-body").each(function (index, el) {
                    var startTime = $(el).attr("data-start");

                    // 不可使用
                    if (currentTime >= startTime) {
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
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(0,2) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                } else if (reserveInfo.reserveType == 2) {
                                    $site.removeClass().addClass('unpaid mobile')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(0,2) + "*")
                                            .replace(/#USERMOBILE#/, "*" + reserveInfo.operatorMobile.substr(-4))
                                        );
                                } else if (reserveInfo.reserveType == 3) {
                                    $site.removeClass().addClass('unpaid phone')
                                        .html(content.opts.Reservation_Tpl
                                            .replace(/#USERNAME#/, reserveInfo.operatorName.substr(0,2) + "*")
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
                            if (reserveInfo.siteReserveStatus == 5 && !$site.hasClass("time-end")) {
                                $site.removeClass().addClass("null").html("");
                            }
                        }
                    }
                } else {
                    alert(res.message || "查询预订信息失败, 请稍后重试");
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
                $(".sequence-refresh").attr("data-click", "no").show();
            }
            if (status === content.opts.REFRESHED) {
                $selected = $sequenceTable.find('td.sel');
                $(".sequence-order").attr("data-click", "no").show();
                $(".sequence-lock").attr("data-click", "no").show();
                $(".sequence-unlock").attr("data-click", "no").hide();
                $(".sequence-refresh").attr("data-click", "yes").show();
            }
            if (status === content.opts.LOCKED) {
                $selected = $sequenceTable.find('td.sel');
                $(".sequence-order").attr("data-click", "no").show();
                $(".sequence-lock").attr("data-click", "no").hide();
                $(".sequence-unlock").attr("data-click", "yes").show();
                $(".sequence-refresh").attr("data-click", "no").show();
            }

            $ordersListSelected.find(".court").remove();

            if ($selected.size() === 0) {
                $ordersListSelected.find(".none").show();
                return;
            }

            for (var i = 0; i < $selected.size(); i++) {
                var $sel = $selected.eq(i);

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

            // 换场选择
            $sequenceTable.on("click", "td.ordered,td.unpaid", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.addClass("sel");
                content.addReservationsSelected(content.opts.REFRESHED);
            });

            // 锁场选择
            $sequenceTable.on("click", "td.locked", function (e) {
                e.preventDefault();

                var $this = $(this);

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
                    siteId: $sel.attr("data-id")
                });
            }

            return data;
        },
        // 初始化菜单操作
        initMenuButtons: function () {
            var content = this;
            var $reservationsSteps = $("#zhifuModal");

            // 锁场
            $(".sequence-lock").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return alert("当前不能锁定场地");
                }

                var data = content.findReservationsSelected(content.opts.ORDERED);

                if (data.length === 0) {
                    return alert("请先选择场地");
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: (new Date(content.opts.Current_Date)).getDay() || 7,
                        siteReserveTimeList: data
                    }]
                };
                $.post('/site/lockSite', {
                    siteOperationJson: JSON.stringify(content.opts.data),
                    lock: true
                }, function (res) {
                    if (res.code == 1) {
                        $(".tips-modal").modal({backdrop: false, show: true});
                    } else {
                        alert(res.message || "锁场失败, 请稍后重试");
                    }
                });
            });

            // 解锁
            $(".sequence-unlock").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return alert("当前不能解锁场地");
                }

                var data = content.findReservationsSelected(content.opts.LOCKED);

                if (data.length === 0) {
                    return alert("请先选择场地");
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: (new Date(content.opts.Current_Date)).getDay() || 7,
                        siteReserveTimeList: data
                    }]
                };
                $.post('/site/lockSite', {
                    siteOperationJson: JSON.stringify(content.opts.data),
                    lock: false
                }, function (res) {
                    if (res.code == 1) {
                        $(".tips-modal").modal({backdrop: false, show: true});
                    } else {
                        alert(res.message || "解锁失败, 请稍后重试");
                    }
                });
            });

            // 预订
            $(".sequence-order").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return alert("当前不能预订场地");
                }

                var data = content.findReservationsSelected(content.opts.ORDERED);

                if (data.length === 0) {
                    return alert("请先选择场地");
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

            // 换场
            $(".sequence-refresh").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);

                if ($this.attr("data-click") === "no") {
                    return alert("当前不能调换场地");
                }

                var data = content.findReservationsSelected(content.opts.REFRESHED);

                if (data.length === 0) {
                    return alert("请先选择场地");
                }

                content.opts.data = {
                    siteReserveDateList: [{
                        reserveStartDate: content.opts.Current_Date,
                        reserveEndDate: content.opts.Current_Date,
                        reserveWeek: (new Date(content.opts.Current_Date)).getDay() || 7,
                        siteReserveTimeList: data
                    }]
                };
                $.post('', {
                    siteOperationJson: JSON.stringify(content.opts.data),
                    lock: true
                }, function (res) {
                    if (res.code == 1) {
                        $(".tips-modal").modal({backdrop: false, show: true});
                    } else {
                        alert(res.message || "锁场失败, 请稍后重试");
                    }
                });
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

            // 检索会员
            $("#reservations_name").autosuggest({
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
                                    value: data.members[i].memberName
                                });
                            }
                            return json;
                        } else {
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

                    $('#reservations_member').val(memberId);
                    $('#reservations_mobile').val(mobile);
                }
            });
        }
    };

    Site_Reservations.init();
})(jQuery, moment);
