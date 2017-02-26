(function ($) {
    var Business_Income = {
        opts: {
            URL: 'data/getBusinessIncomeLog'
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

            // 筛选
            $(".data-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#data_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 分页点击
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(location.href + '&page=' + $(this).attr("data-index"));
                    } else {
                        location.assign(location.href.replace(/page=\d+/, "") + '&page=' + $(this).attr("data-index"));
                    }
                } else {
                    location.assign('data/getBusinessIncomeLog?page=' + $(this).attr("data-index"));
                }
            });
        }
    };

    Business_Income.init();
})(jQuery);
