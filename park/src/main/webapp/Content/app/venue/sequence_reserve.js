(function ($) {
    $(document).ready(function () {
        var Timing_Series = {
            init: function () {
                this.freezeHeader();
                this.initEvents();
            },
            // 冻结表头
            freezeHeader: function () {
                var $table = $("#timing_table");
                var $td = $table.find(".timing-header td");
                //var width = 120;
                var offset = $table.offset();

                /*$table.css({
                    "min-width": "100%",
                    "width": width * $td.size() + "px"
                });*/

                $(document).on("scroll", function (e) {
                    e.preventDefault();

                    var scrollTop = $(this).scrollTop();

                    if (scrollTop > (offset.top)) {
                        $table.find(".timing-header").css({
                            "position": "fixed",
                            "top": 0,
                            "width": $table.width() + "px"
                        });
                        $td.css({"width": ($table.width() / $td.size()) + "px"});
                    } else {
                        $table.find(".timing-header").css({"position": "relative"});
                    }
                });
            },
            // 选中
            initEvents: function () {
                var $table = $("#timing_table");

                // 空场地
                $table.on("click", ".timing-body .null", function (e) {
                    e.preventDefault();

                    var $this = $(this);

                    $this.addClass("selected").removeClass("null");
                });

                // 选中取消
                $table.on("click", ".timing-body .selected", function (e) {
                    e.preventDefault();

                    var $this = $(this);

                    $this.addClass("null").removeClass("selected");
                });

                // 预订完成
                $table.on("click", ".timing-body .ordered", function (e) {
                    e.preventDefault();

                    $(".my-model").trigger("click");
                });

                // 未支付
                $table.on("click", ".timing-body .unpaid", function (e) {
                    e.preventDefault();

                    $(".my-model").trigger("click");
                });

                // 锁定
                $table.on("click", ".timing-body .locked", function (e) {
                    e.preventDefault();

                    $(".my-model").trigger("click");
                });

                // 不能
                $table.on("click", ".timing-body .disabled", function (e) {
                    e.preventDefault();

                    $(".my-model").trigger("click");
                });
            }
        };

        Timing_Series.init();
    });
})(jQuery);