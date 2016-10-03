(function ($) {
    $(document).ready(function () {
        $('#member_form').validate({
            ignore: ":hidden"
        });
    });

    // 注册用户
    var ajaxLock = false;
    $(".register-member").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_form").serialize();

        if (ajaxLock || !$("#member_form").valid()) {
            return false;
        }
        ajaxLock = true;

        $.post('member/saveMember', conditions, function (res) {
            if (res.code == 1) {
                location.assign('member/membersInfoCar?memberId=' + res.data.memberId +
                    '&cardNo=' + $("#cardNo").val());
            } else {
                alert("注册失败");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
