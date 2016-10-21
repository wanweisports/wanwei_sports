(function ($) {
    /* 全局事件 */

    // 退出登录
    $(".user-logout").on("click", function (e) {
        e.preventDefault();

        //alert("成功登出");
        location.assign('/passport/login');
    });

    // 导航切换
    $(".navigator-container").on("click", ".list-nav-header", function (e) {
        e.preventDefault();

        var $this = $(this);
        var item = $this.attr("data-item");

        if ($this.hasClass("active")) {
            return false;
        }

        $(".navigator-container").find(".list-nav-header").removeClass("active");
        $this.addClass("active");

        $(".navigator-container").find(".list-nav-list").hide();
        $(".navigator-container").find(".list-nav-list." + item).show();
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
