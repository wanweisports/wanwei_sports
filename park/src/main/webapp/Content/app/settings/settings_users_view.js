(function ($) {
    var Settings_Users_View = {
        init: function () {
            this.initEvents();
            this.initDatePicker();
        },
        // 初始时间选择
        initDatePicker: function () {
            // 生效时间
            $('#start_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0
            });

            // 截止时间
            $('#end_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0
            });
        },
        initEvents: function () {
            // 用户设置
            $(".users-save").on("click", function (e) {
                e.preventDefault();

                var $form = $("#users_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({show: true, backdrop: false});
                    } else {
                        alert(res.message || "设置用户失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Settings_Users_View.init();
})(jQuery);
