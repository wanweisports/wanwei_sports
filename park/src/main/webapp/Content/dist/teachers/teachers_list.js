(function ($) {
    var Teachers_List = {
        opts: {
            URL: '/teachers/list'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索显示会员列表
            $(".member-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#member_filter_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 分页
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;
                var pageIndex = $(this).attr("data-index");

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(content.opts.URL + '?' + conditions + '&page=' + pageIndex);
                    } else {
                        location.assign(content.opts.URL + '?' + conditions.replace(/(page=)\d+/, '$1' + pageIndex));
                    }
                } else {
                    location.assign(content.opts.URL + '?page=' + pageIndex);
                }
            });

            // 补办
            $(".teachers-list").on("click", ".teachers-buban", function () {
                var $this = $(this);
            });

            // 确认补办
            $("#kucunModal").on("click", ".confirm-count", function (e) {
                e.preventDefault();

                var $form = $("#buban_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post("/", conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "教师卡补办失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Teachers_List.init();
})(jQuery);
