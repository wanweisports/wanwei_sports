(function ($) {
    var Good_Settings = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 提交iframe加载
            $("#good_form_target").on('load', function () {
                var content = document.getElementById("good_form_target").contentDocument;
                var element = content.body;

                try {
                    var res = JSON.parse(element.innerText.trim());

                    if (res.code == 1) {
                        $("#tips_success_modal").modal({show: true, backdrop: false})
                            .find(".text-content").text(res.message || "商品类别设置保存成功");
                        setTimeout(function () {
                            $("#tips_success_modal").modal("hide");
                            location.assign('/good/getGoods');
                        }, 3000);
                    } else {
                        $("#tips_error_modal").modal({show: true, backdrop: false})
                            .find(".text-content").text(res.message || "商品设置提交失败, 请稍后重试");
                        console.log(res.message || "商品设置提交失败, 请稍后重试");
                    }
                } catch (e) {
                    $("#tips_error_modal").modal({show: true, backdrop: false})
                        .find(".text-content").text("商品设置提交错误, 请稍后重试");
                    console.log(e);
                }

                $("#good_form").attr("submitting", "");
            });

            // 商品设置提交
            $(".goods-setting").on("click", function (e) {
                e.preventDefault();

                var $form = $("#good_form");

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $form.submit();
            });
        }
    };

    Good_Settings.init();
})(jQuery);
