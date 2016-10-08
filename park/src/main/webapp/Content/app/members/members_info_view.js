(function ($) {
    // 表单校验设置
    $(document).ready(function () {
        $('#member_form').validate({
            ignore: ":hidden"
        });
    });

    // 表单时间控件设置
    $(".form_datetime").datepicker({
        format: "yyyy-mm-dd",
        todayBtn: true,
        language: "zh-CN",
        orientation: "bottom auto"
    });

    // 更新会员信息
    var ajaxLock = false;
    $(".gengxin-modal").on("click", function (e) {
        e.preventDefault();

        var $form = $("#member_form");
        var conditions = $form.serialize();

        if ($form.attr("submitting") == "submitting" || !$form.valid()) {
            return false;
        }
        $form.attr("submitting", "submitting");

        $.post('member/saveMember', conditions, function (res) {
            $form.attr("submitting", "");

            if (res.code == 1) {
                $("#gengxinModal").modal("show");
            } else {
                alert("会员信息更新失败, 请稍后重试");
            }
        });
    });

    // 会员卡充值

    // 会员卡补办

    // 会员卡升级
})(jQuery);
