(function ($) {
    var Good_Type_Settings = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 增加会员类型
            $(".good-type-add").on("click", function (e) {
                e.preventDefault();

                $("#good_type_id").val("");
                $("#good_type_name").val("");
                $("#good_type_remark").val("");
            });

            $("#save_good_type").on("click", function (e) {
                e.preventDefault();

                var $form = $("#good_type_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/good/saveGoodType', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_success_modal").modal({show: true, backdrop: false})
                            .find(".text-content").text(res.message || "商品类别设置保存成功");
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        $("#tips_error_modal").modal({show: true, backdrop: false})
                            .find(".text-content").text(res.message || "商品类别设置保存失败, 请稍后重试");
                        console.log(res.message || "商品类别设置保存失败, 请稍后重试");
                    }
                });
            });

            // 商品类型详情
            $(".good-type-list").on("click", ".type-item", function (e) {
                e.preventDefault();

                var id = $(this).attr("data-id");

                $.post('/good/goodTypeInfo', {goodTypeId: id}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#good_type_id").val(data.goodTypeId);
                        $("#good_type_name").val(data.goodTypeName);
                        $("#good_type_remark").val(data.goodTypeDescribe);
                    } else {
                        $("#tips_error_modal").modal({show: true, backdrop: false})
                            .find(".text-content").text(res.message || "商品类别信息查询失败, 请稍后重试");
                        console.log(res.message || "商品类别信息查询失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Good_Type_Settings.init();
})(jQuery);
