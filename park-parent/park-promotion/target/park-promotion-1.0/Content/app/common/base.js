(function ($, moment) {
    /* 全局事件 */

    $.isDebug = true;
    $.logConsole = function (tag, message) {
        if ($.isDebug) {
            console.log(moment().format("YYYYMMDDHHmmss -- ") + tag + "：" + message);
        }
    };

    $.tipsWarningAlert = function (message) {
        $("#tips_failure_modal").modal({show: true, backdrop: false}).find(".tips-content").text(message);

        var timeout = setTimeout(function () {
            $("#tips_failure_modal").modal("hide");
            clearTimeout(timeout);
        }, 3000);
    };

    $.tipsSuccessAlert = function (message, callback) {
        if (!callback) {
            callback = new Function();
        }

        $("#tips_success_modal").modal({show: true, backdrop: false}).find(".tips-content").text(message);

        var timeout = setTimeout(function () {
            $("#tips_success_modal").modal("hide");
            clearTimeout(timeout);
            callback();
        }, 3000);
    };
})(jQuery, moment);
