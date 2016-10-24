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

                $.post('', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert("商品类别设置保存失败, 请稍后重试");
                    }
                });
            });

            // 商品类型详情
            $(".good-type-list").on("click", ".type-item", function (e) {
                e.preventDefault();

                var id = $(this).attr("data-id");

                $.post('', {goodTypeId: id}, function (res) {
                    if (res.code == 1) {
                        $("#good_type_id").val("");
                        $("#good_type_name").val("");
                        $("#good_type_remark").val("");
                    } else {
                        alert(res.message || "商品类别信息查询失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Good_Type_Settings.init();
})(jQuery);
