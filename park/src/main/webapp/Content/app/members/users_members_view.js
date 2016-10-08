(function ($) {
    $(document).ready(function () {
        $('#member_form').validate({
            ignore: ":hidden"
        });
    });

    // 注册用户
    var ajaxLock = false;
    $(".gengxin-modal").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_form").serialize();

        if (ajaxLock || !$("#member_form").valid()) {
            return false;
        }
        ajaxLock = true;

        $.post('member/saveMember', conditions, function (res) {
            if (res.code == 1) {
                $("#gengxinModal").modal("show");
                ajaxLock = false;
            } else {
                alert("更新失败");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
