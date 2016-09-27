(function ($) {
    // 切换tab
    $(".tab-card").on("click", function (e) {
        e.preventDefault();

        var $this = $(this);

        if ($this.hasClass("btn-info")) {
            return;
        }

        $(".tab-card.btn-info").removeClass("btn-info").addClass("btn-primary");
        $this.addClass("btn-info").removeClass("btn-primary");

        $(".refresh-card-panel").hide();
        $(".recharge-card-panel").hide();
        $(".upgrade-card-panel").hide();
        $("." + $this.attr("data-tab") + "-panel").show();
    });

    // 补办
    $(".refresh-card-submit").on("click", function (e) {
        e.preventDefault();

        var conditions = $(".refresh-card-form").serialize();

        if ($(this).attr("working")) {
            return;
        }
        $(this).attr("working", "working");

        $.post('/users/submitMembersRefreshCard', conditions, function (res) {
            $(this).attr("working", "");
            if (res.status == 200) {
                alert("补办成功!");
            }
        }).fail(function () {
            $(this).attr("working", "");
            alert("补办错误!");
        });
    });

    // 充值
    $(".recharge-card-submit").on("click", function (e) {
        e.preventDefault();

        var conditions = $(".recharge-card-form").serialize();

        if ($(this).attr("working")) {
            return;
        }
        $(this).attr("working", "working");

        $.post('/users/submitMembersRecharge', conditions, function (res) {
            $(this).attr("working", "");
            if (res.status == 200) {
                alert("充值成功!");
            }
        }).fail(function () {
            $(this).attr("working", "");
            alert("充值错误!");
        });
    });

    // 升级
    $(".upgrade-card-submit").on("click", function (e) {
        e.preventDefault();

        var conditions = $(".upgrade-card-form").serialize();

        if ($(this).attr("working")) {
            return;
        }
        $(this).attr("working", "working");

        $.post('/users/submitMembersUpgradeCard', conditions, function (res) {
            $(this).attr("working", "");
            if (res.status == 200) {
                alert("升级成功!");
            }
        }).fail(function () {
            $(this).attr("working", "");
            alert("升级错误!");
        });
    });
})(jQuery);
