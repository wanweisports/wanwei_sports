(function ($) {
    /* 全局事件 */

    // 退出登录
    $(".ww-logout").on("click", function (e) {
        e.preventDefault();

        //alert("成功登出");
        location.assign('passport/login');
    });

    // 导航切换
    $(".ww-nav > li").not(".nav-home").hover(function () {
        $(this).addClass("nav-moon");
    }, function () {
        $(this).removeClass("nav-moon");
    });

    /* jQuery扩展 */

    // 将form表单数据序列化为json
    $.fn.serializeObject = function () {
        var data = {};

        this.serializeArray().map(function (x) {
            data[x.name] = x.value;
        });

        return data;
    };
})(jQuery);
