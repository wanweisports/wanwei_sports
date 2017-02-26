(function ($) {

    $(".class-status-select").on('click', ".class-status", function (e) {
        e.preventDefault();

        location.assign('business/training/list?classStatus=' + ($(this).attr("data-status") || ""));
    });

})(Zepto);
