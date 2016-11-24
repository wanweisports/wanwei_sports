(function ($) {
    var Members_Loans = {
        opts: {
            URL: '/member/getMembersLoans'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 筛选
            $(".receipt-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#receipt_filter_form").serialize();

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

            // 收款
            $(".receipt-list").on("click", ".receipt-dialog", function () {
                var $this = $(this);

                $('[name="receivableId"]').val($this.attr("data-id"));
                $('#card_receipt_money').val("");
                $('#card_receipt_money2').val("");
                $('#payType').val("");
            });

            // 收款提交
            $(".receipt-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#card_receipt_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/updateMemberReceivable', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "收款失败, 请稍后重试");
                        alert(res.message || "收款失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Loans.init();
})(jQuery);
