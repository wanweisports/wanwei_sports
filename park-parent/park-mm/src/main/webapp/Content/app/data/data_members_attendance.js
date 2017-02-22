(function ($) {
    var Members_Attendance = {
        opts: {
            URL: '/data/getMembersRegister'
        },
        init: function () {
            this.initEvents();

            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#dateSelect').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });
        },
        initEvents: function () {
            var content = this;

            // 筛选列表
            $(".data-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#data_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });
        }
    };

    Members_Attendance.init();
})(jQuery);
