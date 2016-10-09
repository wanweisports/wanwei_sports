(function ($) {
    // 配置表单校验
    $(document).ready(function () {
        $('#good_form').validate({
            ignore: ":hidden"
        });
    });

    // 商品设置提交
    $(".goods-setting").on("click", function (e) {
        e.preventDefault();

        var $form = $("#good_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('good/saveGood', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                location.assign('good/getGoods');
            } else {
                alert("商品设置提交失败, 请稍后重试");
            }
        });
    });
})(jQuery);
