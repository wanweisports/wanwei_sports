(function ($) {
    var ajaxLock = false;
    $(".login-btn").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#login_form").serialize();

        if (ajaxLock) {
            return false;
        }
        ajaxLock = true;

        $.post('/passport/submitUserLogin', conditions, function (res) {
            if (res.status == 200) {
                location.assign($('[name="return_url"]').val());
            } else {
                ajaxLock = false;
                alert("登录失败");
            }
        });
    });
})(jQuery);
