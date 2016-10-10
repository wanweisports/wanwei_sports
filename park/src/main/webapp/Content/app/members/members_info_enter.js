(function ($) {
    // 配置表单校验
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

    // 注册用户提交
    var ajaxLock = false;
    $(".register-member").on("click", function (e) {
        e.preventDefault();

        var $form = $("#member_form");
        var conditions = $form.serialize();

        if (ajaxLock || !$form.valid()) {
            return false;
        }
        ajaxLock = true;

        $.post('member/saveMember', conditions, function (res) {
            var data = res.data;

            if (res.code == 1) {
                location.assign('member/membersInfoCar?memberId=' + data.memberId); // + '&cardNo=' + $("#cardNo").val()
            } else {
                alert("会员信息保存失败, 请稍后重试");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
