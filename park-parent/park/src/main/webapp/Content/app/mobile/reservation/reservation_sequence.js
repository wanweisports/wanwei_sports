(function ($, moment) {

    var Reservation_Sequence = {
        opts: {
            selected: [],
            queryTpl: function () {
                return '<a href="javascript:;" class="weui-grid site-item" data-id="#SITEID#" data-name="#SITENAME#">' +
                    '<div class="weui-grid__icon">' +
                    '<img src="Content/images/mobile/stadium.png">' +
                    '</div>' +
                    '<p class="weui-grid__label">#SITENAME#</p>' +
                    '</a>';
            },
            selectedTpl: function () {
                return '<label class="weui-cell weui-check__label selected-site-item" for="selected_site_#INDEX#" data-id="#SITEID#" data-start="#STARTTIME#" data-end="#ENDTIME#">' +
                    '<div class="weui-cell__hd">' +
                    '<input type="checkbox" class="weui-check" name="selectedSite" id="selected_site_#INDEX#" checked="checked">' +
                    '<i class="weui-icon-checked"></i>' +
                    '</div>' +
                    '<div class="weui-cell__bd">' +
                    '<p>#SITENAME#</p>' +
                    '</div>' +
                    '<div class="weui-cell__ft">#STARTTIME#-#ENDTIME#</div>' +
                    '</label>';
            }
        },
        querySites: function () {
            var content = this;

            var $querySites = $("#site_list");
            var $form = $("#site_form");
            var conditions = $form.serialize();

            if ($form.attr("submitting") === "submitting") {
                return false;
            }
            $form.attr("submitting", "submitting");

            $.post('mobile/reservation/query', conditions, function (res) {
                $form.attr("submitting", "");

                var data = res.data;
                if (res.code == 1) {
                    var sites = data.sites;

                    sites.forEach(function (item) {
                        $querySites.append(
                            content.queryTpl().replace(/#SITENAME#/g, item.siteName)
                                .replace(/#SITEID#/g, item.siteId)
                        );
                    });
                } else {
                    $.logConsole('查询可预订场地失败', res.message);
                    $.tipsWarningAlert('查询可预订场地失败');
                }
            });
        },
        clearSites: function (isSwitch) {
            var $querySites = $("#site_list");
            var $selectedSites = $("#selected_site_list");

            $querySites.html("");
            if (isSwitch) {
                $selectedSites.html("");
            }
        },
        appendSites: function ($selected) {
            var content = this;
            var $selectedSites = $("#selected_site_list");
            var $siteDate = $("#site_date");
            var $siteStart = $("#site_start_time");
            var $siteEnd = $("#site_end_time");
            var siteReserveDateList = [{
                reserveStartDate: $siteDate.val(),
                reserveEndDate: $siteDate.val(),
                reserveWeek: content.formatWeek($siteDate.val()),
                siteReserveTimeList: [{
                    siteStartTime: $siteStart.val(),
                    siteEndTime: $siteEnd.end(),
                    siteId: $selected.attr("data-id"),
                    timeId: $selected.attr("data-reserve")
                }]
            }];

            $selectedSites.append(
                content.selectedTpl().replace(/#SITENAME#/g, $selected.attr("data-name"))
                    .replace(/#STARTTIME#/g, $siteStart.val())
                    .replace(/#ENDTIME#/g, $siteEnd.val())
                    .replace(/#SITEID#/g, $selected.attr("data-id"))
            );
        },
        formatWeek: function () {
            var week = moment(date).format("e");

            return week != "0" ? week : 7;
        },
        init: function () {
            this.initEvents();

            var $selectedSheetAction = $('#show_selected_sheet_action');
            var $selectedSheetMask = $('#show_selected_sheet_mask');

            function hideSelectedSheet() {
                $selectedSheetAction.removeClass('weui-actionsheet_toggle');
                $selectedSheetMask.hide();
            }

            $selectedSheetMask.on('click', hideSelectedSheet);
            $('#cancel_selected_sheet').on('click', hideSelectedSheet);
            $("#show_selected_sheet").on("click", function (e) {
                e.preventDefault();

                $selectedSheetAction.addClass('weui-actionsheet_toggle');
                $selectedSheetMask.show();
            });
        },
        initEvents: function () {
            var content = this;

            var $querySites = $("#site_list");
            var $selectedSites = $("#selected_site_list");
            var $sportId = $("#site_sport_id");
            var $siteDate = $("#site_date");
            var $siteStart = $("#site_start_time");
            var $siteEnd = $("#site_end_time");

            $sportId.on("change", function (e) {
                e.preventDefault();

                content.clearSites(true);
                content.querySites();
            });

            $siteDate.on("change", function (e) {
                e.preventDefault();

                content.clearSites(true);
                content.querySites();
            });
            $siteDate.val(moment().format("YYYY-MM-DD")).change();

            $siteStart.on("change", function (e) {
                e.preventDefault();

                content.clearSites(false);
                content.querySites();
            });

            $siteEnd.on("change", function (e) {
                e.preventDefault();

                content.clearSites(false);
                content.querySites();
            });

            $querySites.on("click", ".site-item", function (e) {
                e.preventDefault();

                var $site = $(this);

                $selectedSites.append(
                    content.selectedTpl().replace(/#SITENAME#/g, $site.attr("data-name"))
                        .replace(/#STARTTIME#/g, $siteStart.val())
                        .replace(/#ENDTIME#/g, $siteEnd.val())
                        .replace(/#SITEID#/g, $site.attr("data-id"))
                );
            });
        }
    };

    Reservation_Sequence.init();
/*
    var queryTpl = '<a href="javascript:;" class="weui-grid site-item" data-id="#SITEID#" data-name="#SITENAME#">' +
        '<div class="weui-grid__icon">' +
        '<img src="Content/images/mobile/stadium.png">' +
        '</div>' +
        '<p class="weui-grid__label">#SITENAME#</p>' +
        '</a>';
    var $querySites = $("#site_list");

    var selectedIndex = 1;
    var selectedTpl = '<label class="weui-cell weui-check__label selected-site-item" for="selected_site_#INDEX#" data-id="#SITEID#" data-start="#STARTTIME#" data-end="#ENDTIME#">' +
        '<div class="weui-cell__hd">' +
        '<input type="checkbox" class="weui-check" name="selectedSite" id="selected_site_#INDEX#" checked="checked">' +
        '<i class="weui-icon-checked"></i>' +
        '</div>' +
        '<div class="weui-cell__bd">' +
        '<p>#SITENAME#</p>' +
        '</div>' +
        '<div class="weui-cell__ft">#STARTTIME#-#ENDTIME#</div>' +
        '</label>';
    var $selectedSites = $("#selected_site_list");

    var $sportId = $("#site_sport_id");
    var $siteDate = $("#site_date");
    var $siteStart = $("#site_start_time");
    var $siteEnd = $("#site_end_time");
    
    function __querySites() {
        var $form = $("#site_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") === "submitting") {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('mobile/reservation/query', conditions, function (res) {
            $form.attr("submitting", "");

            var data = res.data;
            if (res.code == 1) {
                var sites = data.sites;

                sites.forEach(function (item) {
                    $querySites.append(
                        queryTpl.replace(/#SITENAME#/g, item.siteName)
                            .replace(/#SITEID#/g, item.siteId)
                    );
                });
            } else {
                $.logConsole('查询可预订场地失败', res.message);
                $.tipsWarningAlert('查询可预订场地失败');
            }
        });
    }

    function __clearSites(isSwitch) {
        $querySites.html("");
        if (isSwitch) {
            $selectedSites.html("");
        }
    }

    $sportId.on("change", function (e) {
        e.preventDefault();

        __clearSites(true);
        __querySites();
    });

    $siteDate.on("change", function (e) {
        e.preventDefault();

        __clearSites(true);
        __querySites();
    });

    $siteDate.val(moment().format("YYYY-MM-DD")).change();

    $siteStart.on("change", function (e) {
        e.preventDefault();

        __clearSites(false);
        __querySites();
    });

    $siteEnd.on("change", function (e) {
        e.preventDefault();

        __clearSites(false);
        __querySites();
    });

    $querySites.on("click", ".site-item", function (e) {
        e.preventDefault();

        var $site = $(this);

        $selectedSites.append(
            selectedTpl.replace(/#SITENAME#/g, $site.attr("data-name"))
                .replace(/#STARTTIME#/g, $siteStart.val())
                .replace(/#ENDTIME#/g, $siteEnd.val())
                .replace(/#SITEID#/g, $site.attr("data-id"))
                .replace(/#INDEX#/g, selectedIndex + "")
        );
        selectedIndex++;
        __selectedSites();
    });

    var $selectedSheetAction = $('#show_selected_sheet_action');
    var $selectedSheetMask = $('#show_selected_sheet_mask');

    function hideSelectedSheet() {
        $selectedSheetAction.removeClass('weui-actionsheet_toggle');
        $selectedSheetMask.hide();
    }

    $selectedSheetMask.on('click', hideSelectedSheet);

    $('#cancel_selected_sheet').on('click', hideSelectedSheet);

    $("#show_selected_sheet").on("click", function (e) {
        e.preventDefault();

        $selectedSheetAction.addClass('weui-actionsheet_toggle');
        $selectedSheetMask.show();
    });

    function __formatWeek(date) {
        var week = moment(date).format("e");

        return week != "0" ? week : 7;
    }

    function __selectedSites() {
        var $selectedItems = $selectedSites.find(".selected-site-item");
        var selected = [];

        $selectedItems.each(function (index) {
            var $sel = $selectedItems.eq(index);

            selected.push({
                siteStartTime: $sel.attr("data-start"),
                siteEndTime: $sel.attr("data-end"),
                siteId: $sel.attr("data-id")
            });
        });

        return selected;
    }
    
    $("#pay_selected_sheet").on("click", function (e) {
        e.preventDefault();

        var reserveDate = $siteDate.val();

        var siteReserveDateList = [{
            reserveStartDate: reserveDate,
            reserveEndDate: reserveDate,
            reserveWeek: __formatWeek(reserveDate),
            siteReserveTimeList: __selectedSites()
        }];
    });
*/
})(Zepto, moment);
