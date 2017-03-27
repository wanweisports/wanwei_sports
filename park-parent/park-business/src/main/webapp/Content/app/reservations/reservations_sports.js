(function ($) {
    var Sports_List = {
        init: function () {
            this.initEvents();
            this.initTimePicker();
        },
        initTimePicker: function () {
            var allowTimes = JSON.parse($.cookie('wc-business-time'));

            $.datetimepicker.setLocale('zh');

            $('#start_time').datetimepicker({
                datepicker: false,
                format: "H:i",
                allowTimes: allowTimes,
                value: allowTimes[0]
            });

            // 营业结束时间
            $('#end_time').datetimepicker({
                datepicker: false,
                format: "H:i",
                allowTimes: allowTimes,
                value: allowTimes[allowTimes.length - 1]
            });
        },
        initEvents: function () {
            //新建/修改场地类型
            $(".sports-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#sports_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post("/site/saveSiteSport", conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $.tipsSuccessAlert('场地运动类型设置成功！', function () {
                            location.reload();
                        });
                    } else {
                        $.logConsole('场地运动类型设置失败', res.message);
                        $.tipsWarningAlert('场地运动类型设置失败');
                    }
                });
            });

            function _resetSportsForm () {
                $("#sport_id").val("");
                $("#sport_name").val("");
                $("#sport_money").val("");
                $("#sport_deposit").val("");
                $("#start_time").val("");
                $("#end_time").val("");
                $("#sport_status1").prop("checked", true);
            }

            // 增加场地类型
            $(".sports-add").on("click", function (e) {
                e.preventDefault();

                _resetSportsForm();
                $("#setting_modal").modal({backdrop: false, show: true});
            });

            // 查询场地详情
            $(".sports-list").on("click", ".sports-update", function (e) {
                e.preventDefault();

                var $this = $(this);

                _resetSportsForm();

                $.post("/site/getSiteSport", {sportId: $this.attr("data-id")}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $.each(data, function (key, item) {
                            $("#sports_form").find("*[name='" + key + "']").not(":radio").val(item);
                        });
                        $("#sports_form").find("input[name='sportStatus'][value='" + data.sportStatus + "']")
                            .prop("checked", true);

                        $("#setting_modal").modal({backdrop: false, show: true});
                    } else {
                        $.logConsole('运动类型详情查询失败', res.message);
                        $.tipsWarningAlert('运动类型详情查询失败');
                    }
                });
            });
        }
    };

    Sports_List.init();
})(jQuery);
