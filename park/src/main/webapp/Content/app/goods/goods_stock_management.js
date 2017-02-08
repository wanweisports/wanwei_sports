(function ($) {
    var Good_STOCK = {
        opts: {
            URL: '/good/getGoodsStock'
        },
        init: function () {
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

            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索显示列表
            $(".goods-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#goods_filter_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });
        }
    };

    Good_STOCK.init();
})(jQuery);
