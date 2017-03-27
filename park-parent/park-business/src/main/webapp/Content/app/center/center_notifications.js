(function ($) {
    var Office_Notifications = {
        opts: {
            URL: '/center/notifications'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索
            $(".notification-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#notification_filter_form").serialize();

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

            // 标记已读

            // 查询
            $(".notifications-list").on("click", ".notifications-view", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('center/viewNotifications', {noteId: noteId}, function (res) {
                    if (res.code == 1) {
                    } else {
                        console.log(res.message || "查询通知详情失败, 请稍后重试");
                        alert(res.message || "查询通知详情失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".notifications-list").on("click", ".notifications-del", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('center/deleteNotifications', {noteId: noteId}, function (res) {
                    console.log(res);
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "删除通知失败, 请稍后重试");
                        alert(res.message || "删除通知失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Office_Notifications.init();
})(jQuery);
