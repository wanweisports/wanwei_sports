(function ($) {
    $(".ww-logout").on("click", function (e) {
        e.preventDefault();

        //alert("成功登出");
        location.assign('/passport/login');
    });
})(jQuery);
