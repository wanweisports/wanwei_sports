(function ($, moment) {
    var Goods_Stock_Detail = {
        opts: {
            URL: 'good/getGoodsStockDetails'
        },
        init: function () {
            this.initEvents();

            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#createTimeStart').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });

            $('#createTimeEnd').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });
        },
        initEvents: function () {
            var content = this;

            // 筛选库存明细列表
            $(".goods-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#goods_filter_form").serialize();
                var startDate = $('#createTimeStart').val() || moment().format("YYYY-MM-DD");
                var endDate = $('#createTimeEnd').val() || moment().format("YYYY-MM-DD");

                if (endDate < startDate) {
                    return $.tipsWarningAlert("开始日期不能大于结束日期");
                }

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
        }
    };

    Goods_Stock_Detail.init();
})(jQuery, moment);
