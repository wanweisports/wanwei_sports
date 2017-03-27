(function ($) {
    var Teachers_Meal_Data = {
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#createTimeStart').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                maxDate: 0
            });

            $('#createTimeEnd').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date(),
                maxDate: 0
            });

            this.initEvents();
        },
        getMealsOrderToday: function (memberId) {
            $.post('/order/getMealsOrderToday', {memberId: memberId}, function (res) {
                var data = res.data;
                if (res.code == 1 && data && data.orders && data.orders.length) {
                    $('#teacher_meal_orderId').val(data.orders[0].orderId);
                    $('#teacher_meal_orderNo').val(data.orders[0].orderNo);
                } else {
                    $('#teacher_meal_orderId').val("");
                    $('#teacher_meal_orderNo').val("");
                    alert("对不起，您今天没有预订场地，无法订餐");
                }
            });
        },
        initEvents: function () {
            var content = this;

            $("#teacher_meal_mealOpName").autosuggest({
                url: '/member/searchMember',
                method: 'post',
                queryParamName: 'search',
                dataCallback: function (res) {
                    var data = res.data;
                    var json = [];

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            for (var i = 0; i < data.members.length; i++) {
                                json.push({
                                    id: data.members[i].memberMobile,
                                    label: data.members[i].memberId,
                                    value: data.members[i].memberName + "(" + data.members[i].cardTypeName + ")"
                                });
                            }
                            return json;
                        } else {
                            $('#teacher_meal_memberId').val("0");
                            $('#teacher_meal_mealOpName').val("");
                            $('#teacher_meal_mealOpMobile').val("");
                            $('#teacher_meal_orderNo').val("");
                            return [];
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                        return [];
                    }
                },
                onSelect: function (elm) {
                    var memberId = elm.data('label');
                    var mobile = elm.data('id');
                    var memberName = elm.data('value');

                    $('#teacher_meal_memberId').val(memberId);
                    $('#teacher_meal_mealOpMobile').val(mobile);
                    $('#teacher_meal_mealOpName').val(memberName.replace(/\(.+\)/, ""));

                    content.getMealsOrderToday(memberId);
                }
            });

            // 保存信息
            $("#teacher_meal_confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#teacher_meal_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/site/saveMeal', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_success_modal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        console.log(res.message || "订餐信息保存失败, 请稍后重试");
                        alert(res.message || "订餐信息保存失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".teachers-meals-list").on("click", ".teachers-delete", function () {
                var $this = $(this);

                $("#delete_teacherId").val($this.attr("data-id"));
                $("#tips_delete_modal").modal({backdrop: false, show: true});
            });

            // 删除
            $("#tips_delete_modal .confirm-delete").on("click", function (e) {
                e.preventDefault();

                var mealId = $("#delete_teacherId").val();

                $.post('/site/deleteMeal', {mealId: mealId}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "订餐信息删除失败, 请稍后重试");
                        alert(res.message || "订餐信息删除失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Teachers_Meal_Data.init();
})(jQuery);
