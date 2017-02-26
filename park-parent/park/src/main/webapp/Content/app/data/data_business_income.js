(function ($) {
    var Business_Income = {
        opts: {
            URL: '/data/getBusinessIncome'
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
        }
    };

    $(".confirm-check-money").on("click", function(e){
        e.preventDefault();

        if(!window.confirm("确认吗？")) return false;

        var $this = $(this);

        var collateCountNum = $("#countNum").val();
        var collateType = $this.attr("data-type");
        var collateStatus = $this.attr("data-status");
        var collateRemark = $this.parent().prev().find("input").val();
        var oldAmount = $this.parent().attr("data-old-amount");
        var collateAmount = $this.parent().prev().prev().find("input").val();
        $.post("/data/saveCollateInfo", {collateCountNum: collateCountNum, collateType: collateType, collateStatus: collateStatus, collateRemark: collateRemark, oldAmount: oldAmount, collateAmount: collateAmount}, function (res) {
            alert(res.message);
            if(res.code == 1){
                window.location.reload(true);
            }
        });
    });

    Business_Income.init();
})(jQuery);
