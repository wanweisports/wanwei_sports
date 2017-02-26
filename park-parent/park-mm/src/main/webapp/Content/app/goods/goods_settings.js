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
                        $.tipsSuccessAlert('商品设置提交成功！', function () {
                            location.assign('good/getGoods');
                        });
                    } else {
                        $.logConsole('商品设置提交失败', res.message);
                        $.tipsWarningAlert('商品设置提交失败');
                    }
                } catch (e) {
                    $.logConsole('商品设置提交失败', e);
                    $.tipsWarningAlert('商品设置提交失败');
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
