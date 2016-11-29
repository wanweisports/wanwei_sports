(function ($) {
    var Sports_List = {
        init: function () {
            this.initEvents();
            this.initTimePicker();
        },
        initTimePicker: function () {
            $.datetimepicker.setLocale('zh');

            $.post("/settings/getBusinessTime", {}, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    // 营业开始时间
                    $('#start_time').datetimepicker({
                        datepicker: false,
                        format: "H:i",
                        step: 60,
                        value: data.businessStartTime,
                        minTime: data.businessStartTime,
                        maxTime: data.businessEndTime
                    });

                    // 营业结束时间
                    $('#end_time').datetimepicker({
                        datepicker: false,
                        format: "H:i",
                        step: 60,
                        value: data.businessEndTime,
                        minTime: data.businessStartTime,
                        maxTime: data.businessEndTime
                    });
                } else {
                    console.log(res.message || "运营时间查询失败, 请稍后重试");
                    alert(res.message || "运营时间查询失败, 请稍后重试");
                    // 营业开始时间
                    $('#start_time').datetimepicker({
                        datepicker: false,
                        format: "H:i",
                        step: 60,
                        value: "06:00"
                    });

                    // 营业结束时间
                    $('#end_time').datetimepicker({
                        datepicker: false,
                        format: "H:i",
                        step: 60,
                        value: "22:00"
                    });
                }
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
                        location.reload();
                    } else {
                        console.log(res.message || "场地运动类型设置失败, 请稍后重试");
                        alert(res.message || "场地运动类型设置失败, 请稍后重试");
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
                $("#settingModal").modal({backdrop: false, show: true});
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

                        $("#settingModal").modal({backdrop: false, show: true});
                    } else {
                        console.log(res.message || "场地运动类型查询失败, 请稍后重试");
                        alert(res.message || "场地运动类型查询失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Sports_List.init();
})(jQuery);
