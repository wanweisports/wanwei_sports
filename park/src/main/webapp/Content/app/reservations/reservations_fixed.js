(function ($, moment) {
    var Venue_Bookings = {
        tpl: {
            BlockBooking: function () {
                return '<tr data-date="#BOOKING_START_DATE#" data-site="#BOOKING_SITE#">' +
                    '<td>#BOOKING_SPORT#</td><td>#BOOKING_START_DATE#</td>' +
                    '<td>#BOOKING_START_TIME# ~ #BOOKING_END_TIME#</td><td>#BOOKING_AREA#</td>' +
                    '<td><a href="javascript:;" class="btn btn-danger reservations-delete">' +
                    '<span class="glyphicon glyphicon-trash"></span></a></td>' +
                    '</tr>';
            }
        },
        opts: {
            data: {
                name: "散客",
                mobile: "",
                memberId: "",
                opType: "2",
                reserveType: "1",
                reserveModel: "2",
                siteReserveDateList: []
            }
        },
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#block_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0,
                value: moment().format('YYYY-MM-DD')
            });

            $(".start-date-select").on("click", function (e) {
                e.preventDefault();

                $('#block_date').datetimepicker("show");
            });

            $('#block_time_start').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 60,
                value: '06:00'
            });

            $('#block_time_end').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 60,
                value: '22:00'
            });

            this.initEvents2();
            this.searchMembers();
        },
        // 查询会员
        searchMembers: function () {
            $("#block_user_phone").autosuggest({
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
                                    label: data.members[i].memberMobile,
                                    value: data.members[i].memberName + '(' + data.members[i].memberMobile + ')'
                                });
                            }
                            return json;
                        } else {
                            $('#block_user_Id').val("");
                            $('#block_op_type').val("2");
                            $('#block_user_name').val("散客");
                            return [];
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var memberMobile = elm.data('label');
                    var memberId = elm.data('id');
                    var memberName = elm.data('value');

                    $('#block_user_phone').val(memberMobile);
                    $('#block_user_Id').val(memberId);
                    $('#block_op_type').val("1");
                    $('#block_user_name').val(memberName.replace('(' + memberMobile + ')', ""));
                }
            });

            $(".user-search").on("click", function (e) {
                e.preventDefault();

                var $keywords = $("#block_user_phone");

                $.post('member/searchMember', {
                    search: $keywords.val().trim()
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            $('#block_user_phone').val(data.members[0].memberMobile);
                            $('#block_user_Id').val(data.members[0].memberId);
                            $('#block_op_type').val("1");
                            $('#block_user_name').val(data.members[0].memberName);
                        } else {
                            $('#block_user_Id').val("");
                            $('#block_op_type').val("2");
                            $('#block_user_name').val("散客");
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                    }
                });
            });
        },
        initEvents2: function () {
            var content = this;

            // 场地类型改变
            $("#block_user_degree").on("change", function (e) {
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

                        $("#block_venue_name").html(html);
                    } else {
                        console.log(res.message || "查询场地失败, 请稍后重试");
                        alert(res.message || "查询场地失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".reservations-list").on("click", ".reservations-delete", function (e) {
                e.preventDefault();

                var $list = $(this).parents("tr");
                var date = $list.attr("data-date");
                var site = $list.attr("data-site");
                var list = content.opts.data.siteReserveDateList;

                for (var i = 0; i < list.length; i++) {
                    if (list[i].reserveStartDate == date && list[i].siteReserveTimeList[0].siteId == site) {
                        content.opts.data.siteReserveDateList.splice(i, 1);
                        break;
                    }
                }
                $list.remove();
            });

            // 加场
            $(".booking-add").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_fixed_form");
                var $list = $(".reservations-list");
                var data = {};

                if (!$form.valid()) {
                    return false;
                }

                data.reserveStartDate = $("#block_date").val();
                data.reserveEndDate = $("#block_date").val();
                data.reserveWeek = moment(data.reserveStartDate).format("e");
                data.siteReserveTimeList = [{
                    siteStartTime: $("#block_time_start").val(),
                    siteEndTime: $("#block_time_end").val(),
                    siteId: $("#block_venue_name").val()
                }];
                content.opts.data.siteReserveDateList.push(data);

                $list.append(content.tpl.BlockBooking()
                    .replace("#BOOKING_SPORT#", $("#block_user_degree").find("option:selected").text().trim())
                    .replace(/#BOOKING_START_DATE#/g, $("#block_date").val())
                    .replace("#BOOKING_START_TIME#", $("#block_time_start").val())
                    .replace("#BOOKING_END_TIME#", $("#block_time_end").val())
                    .replace("#BOOKING_AREA#", $("#block_venue_name").find("option:selected").text().trim())
                    .replace("#BOOKING_SITE#", $("#block_venue_name").val()));
            });

            // 预订
            $(".booking-pay").on("click", function (e) {
                e.preventDefault();

                var $list = $(".reservations-list");
                if ($list.find("tr").size() == 1) {
                    alert("请先加场");
                    return false;
                }

                var data = content.opts.data;
                data.mobile = $("#block_user_phone").val();
                data.name = $("#block_user_name").val();
                data.memberId = $("#block_user_Id").val();
                data.opType = $("#block_op_type").val();

                $.post('site/saveReservationSite', {
                    siteOperationJson: JSON.stringify(content.opts.data)
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_order_id").val(data.orderId);
                        $("#reservations_order_no").val(data.orderNo);
                        $("#zhifuModal").modal({backdrop: false, show: true});
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
                        $("#zhifuModal").modal({backdrop: false, show: false});
                        alert("预订支付成功");
                    } else {
                        alert(res.message || "确认订单失败, 请稍后重试");
                    }
                });
            });
        },






        initEvents: function () {
            var content = this;

            //this.queryMembers();
            //this.querySportsArea();
            //this.bookingVenue();

            /*var $txtStartTime = $("#block_time_start");
            var $txtEndTime = $("#block_time_end");
            //var $txtBookingWeek = $("#block_booking_week");

            // 起始时间改变
            $txtStartTime.on("change", function (e) {
                e.preventDefault();

                //var week = $txtBookingWeek.val();
                //var mayTime = $txtBookingWeek.find('option[value=' + week + ']').attr("data-time");
                var endTime = $txtEndTime.val();
                var startTime = $txtStartTime.val();

                var tmp = parseInt(startTime.replace(/^(\d+):00$/, "$1"));
                tmp++;
                tmp = (tmp > 9 ? "" + tmp : "0" + tmp) + ":00";

                if (startTime >= endTime) {
                    $txtEndTime.val(tmp);
                }
            });

            // 终止时间改变
            $txtEndTime.on("change", function (e) {
                e.preventDefault();

                //var week = $txtBookingWeek.val();
                //var mayTime = $txtBookingWeek.find('option[value=' + week + ']').attr("data-time");
                var endTime = $txtEndTime.val();
                var startTime = $txtStartTime.val();

                var tmp = parseInt(endTime.replace(/^(\d+):00$/, "$1"));
                tmp--;
                tmp = (tmp > 9 ? "" + tmp : "0" + tmp) + ":00";

                if (startTime >= endTime) {
                    alert("结束时间大于起始时间!!");
                    $txtStartTime.val(tmp);
                }
            });

            var $txtStartDate = $("#block_start_date");
            var $txtEndDate = $("#block_end_date");

            // 起始日期改变
            $txtStartDate.on("change", function (e) {
                e.preventDefault();

                var endDate = $txtEndDate.val();
                var startDate = $txtStartDate.val();

                if (startDate > endDate) {
                    $txtEndDate.val($(this).val());
                }
            });

            // 终止日期改变
            $txtEndDate.on("change", function (e) {
                e.preventDefault();

                var endDate = $txtEndDate.val();
                var startDate = $txtStartDate.val();

                if (startDate > endDate) {
                    alert("终止日期不能小于起始日期!!");
                    $txtStartDate.val($(this).val());
                }
            });*/

            var $uiBookingVenue = $(".sc-booking-venue");
            var $txtPayType = $("#block_pay_type");

            // 付款方式改变
            if ($txtPayType.val() == 1) {
                $uiBookingVenue.find(".booking-pay").parents(".form-group").show();
                $uiBookingVenue.find(".booking-confirm").parents(".form-group").hide();
            } else {
                $uiBookingVenue.find(".booking-pay").parents(".form-group").hide();
                $uiBookingVenue.find(".booking-confirm").parents(".form-group").show();
            }
            $txtPayType.on("change", function (e) {
                e.preventDefault();

                if ($txtPayType.val() == 1) {
                    $uiBookingVenue.find(".booking-pay").parents(".form-group").show();
                    $uiBookingVenue.find(".booking-confirm").parents(".form-group").hide();
                } else {
                    $uiBookingVenue.find(".booking-pay").parents(".form-group").hide();
                    $uiBookingVenue.find(".booking-confirm").parents(".form-group").show();
                }
            });

            var clickable = true;
            // 删除加场的场次
            $uiBookingVenue.on("click", ".booking-cancel", function (e) {
                e.preventDefault();

                var $this = $(this);
                var conditions = {
                    fieldnumber: $this.parents("tr").attr("data-id")
                };

                if (!clickable) {
                    return;
                }
                clickable = false;

                $.post('/venue/CancelVenueBookingsAdd', conditions, function (res) {
                    if (res.status == 200) {
                        $this.parents("tr").remove();
                    } else {
                        console.log(res);
                    }
                    clickable = true;
                }).fail(function (err) {
                    console.log(err);
                    clickable = true;
                });
            });

            var $bookingVenueForm = $("#user_venue_info_form");
            // 加场
            $uiBookingVenue.on("click", ".booking-add", function (e) {
                e.preventDefault();

                var $listVenues = $uiBookingVenue.find(".sc-booking-venues");
                var conditions = $bookingVenueForm.serialize();

                if (!clickable || !$bookingVenueForm.validate().form()) {
                    return;
                }
                clickable = false;

                $.post('/venue/AddVenueBookings', conditions, function (res) {
                    var data = res.data;

                    if (res.status == 200) {
                        $("#batch_number").val(data.batchnumber);
                        $listVenues.append(content.tpl.BlockBooking()
                            .replace("#BOOKING_ID#", data.fieldnumber)
                            .replace("#BOOKING_SPORT#", $("#block_user_degree").find("option:selected").text().trim())
                            .replace("#BOOKING_START_DATE#", $("#block_start_date").val())
                            .replace("#BOOKING_END_DATE#", $("#block_end_date").val())
                            .replace("#BOOKING_START_TIME#", $("#block_time_start").find("option:selected").text().trim())
                            .replace("#BOOKING_END_TIME#", $("#block_time_end").find("option:selected").text().trim())
                            .replace("#BOOKING_AREA#", $("#block_venue_name").find("option:selected").text().trim())
                            .replace("#BOOKING_WEEK#", "(" + $("#block_booking_week").find("option:selected").text().trim() + ")"));
                    } else {
                        $bookingVenueForm.find(".sc-submit-tips").show().html(res.message).addClass("text-danger");
                    }
                    clickable = true;
                }).fail(function (err) {
                    console.log(err);
                    $bookingVenueForm.find(".sc-submit-tips").show().html("网络异常, 提交预订失败!!")
                        .addClass("text-danger");
                    clickable = true;
                });
            });
        },
        // 查询会员[未完成]
        queryMembers: function () {
            $(".user-search").on("click", function (e) {
                e.preventDefault();

                var $keywords = $("#block_user_phone");

                $.getJSON('/users/Search', {
                    name: $keywords.val().trim()
                }, function (result) {
                    var data = result.data;

                    if (result.status == 200) {
                        $('[name="name"]').val(data.name);
                        $('[name="fitphone"]').val(data.phone);
                    } else {
                        alert(result.message);
                    }
                });
            });
        },
        // 场地列表
        querySportsArea: function () {
            $.getJSON('/venue/getVenueSportsArea', {
                sport: 1
            }, function (result) {
                var data = result.data;
                var html = "";

                if (result.status == 200) {
                    for (var i = 0; i < data.length; i++) {
                        html += '<option value="' + data[i].sitenumber + '">' + data[i].sitename + '</option>';
                    }

                    $("#block_venue_name").html(html);
                } else {
                    alert(result.message);
                }
            });
        },
        // 场地预订和付款
        bookingVenue: function () {
            var $bookingVenue = $(".sc-booking-venue");
            var $bookingVenueForm = $("#user_venue_info_form");
            var clickable = true;

            // 预订不付款
            $bookingVenue.on("click", ".booking-confirm", function (e) {
                e.preventDefault();

                $bookingVenueForm.find(".sc-submit-tips").hide().removeClass("text-success,text-danger");
                if (!clickable) {
                    return;
                }
                clickable = false;

                $.post('/venue/SubmitVenueBookingsBlock', {"batchnumber": $("#batch_number").val()}, function (res) {
                    var data = res.data;

                    if (res.status == 200) {
                        $bookingVenueForm.find(".sc-submit-tips").show().html("提交预订成功!!").addClass("text-success");
                        setTimeout(function () {
                            location.reload();
                        }, 3000);
                        $.Web_Print.printBookingSheet(data);
                    } else {
                        $bookingVenueForm.find(".sc-submit-tips").show().html(res.message).addClass("text-danger");
                    }
                    clickable = true;
                }).fail(function (err) {
                    console.log(err);
                    $bookingVenueForm.find(".sc-submit-tips").show().html("网络异常, 提交预订失败!!")
                        .addClass("text-danger");
                    clickable = true;
                });
            });

            // 预订付款
            $bookingVenue.on("click", ".booking-pay", function (e) {
                e.preventDefault();

                $bookingVenueForm.find(".sc-submit-tips").hide().removeClass("text-success,text-danger");
                if (!clickable) {
                    return;
                }
                clickable = false;

                $.post('/venue/SubmitVenueBookingsBlock', {"batchnumber": $("#batch_number").val()}, function (res) {
                    var data = res.data;

                    if (res.status == 200) {
                        $bookingVenueForm.find(".sc-submit-tips").show().html("提交预订成功!!").addClass("text-success");

                        setTimeout(function () {
                            location.reload();
                        }, 3000);
                        $.Web_Print.printBookingSheet(data);
                    } else {
                        $bookingVenueForm.find(".sc-submit-tips").show().html(res.message).addClass("text-danger");
                    }
                    clickable = true;
                }).fail(function (err) {
                    console.log(err);
                    $bookingVenueForm.find(".sc-submit-tips").show().html("网络异常, 提交预订失败!!")
                        .addClass("text-danger");
                    clickable = true;
                });
            });
        }
    };

    Venue_Bookings.init();
})(jQuery, moment);