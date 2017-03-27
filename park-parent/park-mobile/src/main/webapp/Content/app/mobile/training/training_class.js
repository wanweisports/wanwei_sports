(function ($) {

    $(".class-status-select").on('click', ".class-status", function (e) {
        e.preventDefault();

        location.assign('/mobile/training/list?classStatus=' + ($(this).attr("data-status") || ""));
    });

})(Zepto);
