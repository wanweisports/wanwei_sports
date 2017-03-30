/**
 * 通用的功能
 */
(function (Vue, $) {
    // 判断手机系统
    function setMobileOS(userAgent) {
        $.os = {};
        $.os.wechat = userAgent.match(/MicroMessenger/) ? true : false;
        $.os.webkit = userAgent.match(/WebKit\/([\d.]+)/) ? true : false;
        $.os.android = userAgent.match(/(Android)\s+([\d.]+)/) || userAgent.match(/Silk-Accelerated/) ? true : false;
        $.os.ipad = userAgent.match(/(iPad).*OS\s([\d_]+)/) ? true : false;
        $.os.iphone = !$.os.ipad && userAgent.match(/(iPhone\sOS)\s([\d_]+)/) ? true : false;
        $.os.webos = userAgent.match(/(webOS|hpwOS)[\s\/]([\d.]+)/) ? true : false;
        $.os.touchpad = $.os.webos && userAgent.match(/TouchPad/) ? true : false;
        $.os.ios = $.os.ipad || $.os.iphone;
        $.os.blackberry = userAgent.match(/BlackBerry/) || userAgent.match(/PlayBook/) ? true : false;
        $.os.opera = userAgent.match(/Opera Mobi/) ? true : false;
        $.os.fennec = userAgent.match(/fennec/i) ? true : false;
        $.os.isIos4 = ($.os.ios && navigator.appVersion.toLowerCase().indexOf("os 4") > -1) ? true : false;
        $.os.desktop = !($.os.ios || $.os.android || $.os.blackberry || $.os.opera || $.os.fennec);
    }

    setMobileOS(navigator.userAgent);

    $.deepCopy = function (source) {
        var result = {};

        for (var key in source) {
            result[key] = typeof source[key]==="object" ? $.deepCopy(source[key]): source[key];
        }
        return result;
    };

    // 页面后退
    var $pageBack = $('.page-back');
    if ($pageBack.size() > 0) {
        $pageBack.on('click', function (e) {
            e.preventDefault();

            window.history.go(-1);
        });
    }

    $.isDebug = true;
    $.logConsole = function (tag, message) {
        if ($.isDebug) {
            console.log(moment().format("YYYYMMDDHHmmss -- ") + tag + "：" + message);
        }
    };

    $.tipsWarningAlert = function (message) {
        $("#tips_failure_modal").show().find(".tips-content").text(message);

        var timeout = setTimeout(function () {
            $("#tips_failure_modal").hide();
            clearTimeout(timeout);
        }, 3000);
    };

    $.tipsSuccessAlert = function (message, callback) {
        if (!callback) {
            callback = new Function();
        }

        $("#tips_failure_modal").show().find(".tips-content").text(message);

        var timeout = setTimeout(function () {
            $("#tips_failure_modal").hide();
            clearTimeout(timeout);
            callback();
        }, 3000);
    };

    $.tipsSuccessConfirm = function (message, confirm, cancel) {
        $("#tips_confirm_modal").show().find(".tips-content").text(message);

        confirm = confirm || new Function();
        cancel = cancel || new Function();

        $("#tips_confirm_modal").on("click", ".confirm-cancel", function (e) {
            e.preventDefault();

            $("#tips_confirm_modal").hide();
            cancel();
        });

        $("#tips_confirm_modal").on("click", ".confirm-pay", function (e) {
            e.preventDefault();

            $("#tips_confirm_modal").hide();
            confirm();
        });
    };

    $(".tips-know").on("click", function (e) {
        e.preventDefault();

        $("#tips_failure_modal").hide();
    });
})(Vue, Zepto);
