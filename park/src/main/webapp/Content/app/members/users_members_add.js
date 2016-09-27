(function ($) {
    var ajaxLock = false;
    $(".register-member").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#member_form").serialize();

        if (ajaxLock) {
            return false;
        }
        ajaxLock = true;

        $.post('/users/submitMembersAdd', conditions, function (res) {
            if (res.status == 200) {
                location.assign('/users/membersRecharge')
            } else {
                alert("注册失败");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
