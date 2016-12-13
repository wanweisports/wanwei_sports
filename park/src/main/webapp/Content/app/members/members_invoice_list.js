(function ($) {
    var Members_Invoince_List = {
        opts: {
            URL: '/member/getInvoices'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 筛选会员类型
            $(".ticket-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#ticket_filter_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 分页
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;
                var pageIndex = $(this).attr("data-index");

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(content.opts.URL + '?' + conditions + '&page=' + pageIndex);
                    } else {
                        location.assign(content.opts.URL + '?' + conditions.replace(/(page=)\d+/, '$1' + pageIndex));
                    }
                } else {
                    location.assign(content.opts.URL + '?page=' + pageIndex);
                }
            });

            // 领取发票状态改变
            $(".invoice-list").on("click", ".invoice-get-confirm", function (e) {
                e.preventDefault();

                var $this = $(this);
                var invoiceIds = $this.attr("data-id");

                if ($this.attr("working") == "working") {
                    return false;
                }
                $this.attr("working", "working");

                $.post('/member/updateGetInvoices', {invoiceIds: invoiceIds}, function (res) {
                    $this.attr("working", "");

                    if (res.code == 1) {
                        $("#tips_message_modal").modal({backdrop: false, show: true})
                            .find(".text-message").text("发票领取成功！");
                        setTimeout(function () {
                            $("#tips_message_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        console.log(res.message || "发票领取状态改变失败, 请稍后重试");
                        alert(res.message || "发票领取状态改变失败, 请稍后重试");
                    }
                });
            });

            // 领取发票状态改变
            $(".ticket-print").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);
                var $tickets = $("[name='ticket_id']:checked");

                if ($tickets.size() === 0) {
                    return alert("请选择已领取的发票");
                }

                if ($this.attr("working") == "working") {
                    return false;
                }
                $this.attr("working", "working");

                var val = [];
                for (var i = 0; i < $tickets.size(); i++) {
                    val.push($tickets.eq(i).val());
                }

                $.post('/member/updateGetInvoices', {invoiceIds: val.join(",")}, function (res) {
                    $this.attr("working", "");

                    if (res.code == 1) {
                        $("#tips_message_modal").modal({backdrop: false, show: true})
                            .find(".text-message").text("发票领取成功！");
                        setTimeout(function () {
                            $("#tips_message_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        console.log(res.message || "发票领取状态改变失败, 请稍后重试");
                        alert(res.message || "发票领取状态改变失败, 请稍后重试");
                    }
                });
            });

            // 开具发票状态改变
            $(".invoice-list").on("click", ".invoice-open-confirm", function (e) {
                e.preventDefault();

                var $this = $(this);
                var invoiceIds = $this.attr("data-id");

                if ($this.attr("working") == "working") {
                    return false;
                }
                $this.attr("working", "working");

                $.post('/member/updateOpenInvoices', {invoiceIds: invoiceIds}, function (res) {
                    $this.attr("working", "");

                    if (res.code == 1) {
                        $("#tips_message_modal").modal({backdrop: false, show: true})
                            .find(".text-message").text("发票开具成功！");
                        setTimeout(function () {
                            $("#tips_message_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        console.log(res.message || "发票开具状态改变失败, 请稍后重试");
                        alert(res.message || "发票开具状态改变失败, 请稍后重试");
                    }
                });
            });

            // 开具发票状态改变
            $(".ticket-open").on("click", function (e) {
                e.preventDefault();

                var $this = $(this);
                var $tickets = $("[name='ticket_id']:checked");

                if ($tickets.size() === 0) {
                    return alert("请选择已开具的发票");
                }

                if ($this.attr("working") == "working") {
                    return false;
                }
                $this.attr("working", "working");

                var val = [];
                for (var i = 0; i < $tickets.size(); i++) {
                    val.push($tickets.eq(i).val());
                }

                $.post('/member/updateOpenInvoices', {invoiceIds: val.join(",")}, function (res) {
                    $this.attr("working", "");

                    if (res.code == 1) {
                        $("#tips_message_modal").modal({backdrop: false, show: true})
                            .find(".text-message").text("发票开具成功！");
                        setTimeout(function () {
                            $("#tips_message_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        console.log(res.message || "发票开具状态改变失败, 请稍后重试");
                        alert(res.message || "发票开具状态改变失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Invoince_List.init();
})(jQuery);
