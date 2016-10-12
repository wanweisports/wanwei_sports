(function ($) {
    // 配置表单校验
    $(document).ready(function () {
        $('#good_form').validate({
            ignore: ":hidden"
        });
    });

    $("#good_form_target").on('load', function () {
        var content = document.getElementById("good_form_target").contentDocument;
        var element = content.body;

        console.log(element);

        try {
            var res = JSON.parse(element.innerText.trim());

            if (res.code == 1) {
                location.assign('good/getGoods');
            } else {
                alert("商品设置提交失败, 请稍后重试");
            }
        } catch (e) {
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
})(jQuery);
