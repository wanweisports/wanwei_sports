(function ($) {
    $(".schedule-job").on("click", function (e) {
        e.preventDefault();

        var $this = $(this);
        var job = $this.attr("data-job") || '无工作内容。';

        console.log($this.attr("data-job"))

        $("#tips_alert").show().find(".tips-content").text(job);
    });

    $("#tips_alert .tips-ok").on("click", function (e) {
        e.preventDefault();

        $("#tips_alert").hide();
    });
})(Zepto);
