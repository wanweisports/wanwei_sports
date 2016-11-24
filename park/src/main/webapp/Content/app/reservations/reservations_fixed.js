(function ($) {
    var Venue_Bookings = {
        tpl: {
            BlockBooking: function () {
                return '<tr>' +
                    '<td>#BOOKING_SPORT#</td><td>#BOOKING_START_DATE# ~ #BOOKING_END_DATE#</td>' +
                    '<td>#BOOKING_WEEK#</td><td>#BOOKING_START_TIME# ~ #BOOKING_END_TIME#</td><td>#BOOKING_AREA#</td>' +
                    '<td><a href="javascript:;" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>' +
                    '</tr>';
            }
        },
        opts: {
            data: {
                name: "散客",
                mobile: "",
                //memberId: "",
                opType: "2",
                reserveType: "1",
                reserveModel: "2",
                siteReserveDateList: []
            }
        },
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#block_start_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0
            });

            $(".start-date-select").on("click", function (e) {
                e.preventDefault();

                $('#block_start_date').datetimepicker("show");
            });

            $('#block_end_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0
            });

            $(".end-date-select").on("click", function (e) {
                e.preventDefault();

                $('#block_end_date').datetimepicker("show");
            });

            this.initEvents2();
            this.searchMembers();
        },
        // 查询会员
        searchMembers: function () {
            $(".user-search").on("click", function (e) {
                e.preventDefault();

                var $keywords = $("#block_user_phone");

                $.post('member/searchMember', {
                    search: $keywords.val().trim()
                }, function (res) {
                    console.log(res);
                });
            });
        },
        initEvents2: function () {
            var content = this;

            // 加场
            $(".booking-add").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_batch_form");
                var $list = $(".reservations-list");
                var data = {};

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

                data.reserveStartDate = $("#block_start_date").val();
                data.reserveEndDate = $("#block_end_date").val();
                data.reserveWeek = __getCheckbox().value.join(",");
                data.siteReserveTimeList = [{
                    siteStartTime: $("#block_time_start").val(),
                    siteEndTime: $("#block_time_end").val(),
                    siteId: $("#block_venue_name").val()
                }];
                content.opts.data.siteReserveDateList.push(data);

                $list.append(content.tpl.BlockBooking()
                    .replace("#BOOKING_SPORT#", $("#block_user_degree").find("option:selected").text().trim())
                    .replace("#BOOKING_START_DATE#", $("#block_start_date").val())
                    .replace("#BOOKING_END_DATE#", $("#block_end_date").val())
                    .replace("#BOOKING_START_TIME#", $("#block_time_start").find("option:selected").text().trim())
                    .replace("#BOOKING_END_TIME#", $("#block_time_end").find("option:selected").text().trim())
                    .replace("#BOOKING_AREA#", $("#block_venue_name").find("option:selected").text().trim())
                    .replace("#BOOKING_WEEK#", "(" + __getCheckbox().text + ")"));
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
                data.mobile = "11012345678";

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
})(jQuery);