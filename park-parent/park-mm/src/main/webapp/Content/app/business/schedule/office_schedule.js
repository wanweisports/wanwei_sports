(function ($) {
    $(".schedule-job").on("click", function (e) {
        e.preventDefault();

        var $this = $(this);
        var job = $this.attr("data-job") || '无工作内容。';

        $("#tips_alert").show().find(".tips-content").html(job.replace(/\n/g, "<br>"));
    });

    $("#tips_alert .tips-ok").on("click", function (e) {
        e.preventDefault();

        $("#tips_alert").hide();
    });

    $(".schedules-select").on('click', ".schedules-week", function (e) {
        e.preventDefault();

        location.assign('business/office/schedule?countNum=' + ($(this).attr("data-status") || ""));
    });
})(Zepto);
