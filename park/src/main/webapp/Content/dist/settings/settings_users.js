(function ($) {
    var Settings_Users_List = {
        opts: {
            URL: '/settings/getUsers'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索显示用户列表
            $(".users-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#users_filter_form").serialize();

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

            // 激活用户
            $(".user-active").on("click", function (e) {
                e.preventDefault();

                var operatorId = $(this).attr("data-id");

                $.post('settings/lockEmployee', {
                    operatorId: operatorId,
                    lock: false
                }, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || '激活员工用户失败, 请稍后重试');
                    }
                });
            });

            // 锁定用户
            $(".user-lock").on("click", function (e) {
                e.preventDefault();

                $("#tips_modal").modal({show: true, backdrop: false});

                $("#tips_modal").find(".lock-confirm").attr("data-id", $(this).attr("data-id"));
            });

            // 锁定用户确认
            $(".lock-confirm").on("click", function (e) {
                e.preventDefault();

                $("#tips_success_modal").modal("hide");

                var operatorId = $(this).attr("data-id");

                $.post('settings/lockEmployee', {
                    operatorId: operatorId,
                    lock: true
                }, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || '锁定员工用户失败, 请稍后重试');
                    }
                });
            });
        }
    };

    Settings_Users_List.init();
})(jQuery);
