(function ($) {
    var Office_Message = {
        opts: {
            URL: location.pathname
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索
            $(".message-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#message_filter_form").serialize();

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

            // 查询详情
            $(".message-list").on("click", ".message-view", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-note");
                var messageId = $(this).attr("data-id");

                $.post('office/viewNotifications', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#message_content_modal").find("#notification_send_id").val(data.noteId);
                        $("#message_content_modal").find("#notification_send_receiver").val(data.senderId || '');
                        $("#message_content_modal").find("#notification_send_title").val(data.noteTitle || '');
                        $("#message_content_modal").find("#notification_send_content").val(data.noteContent || '');

                        $.post('office/markNotificationRead', {id: messageId}, function (res) {
                            if (res.code != 1) {
                                $.logConsole("标记通知详情已读失败", res.message);
                                $.tipsWarningAlert("标记通知详情已读失败");
                            }
                        });
                    } else {
                        $.logConsole("查询通知详情失败", res.message);
                        $.tipsWarningAlert("通知详情查询失败");
                    }
                });
            });

            // 删除
            $(".message-list").on("click", ".message-delete", function (e) {
                e.preventDefault();

                var messageId = $(this).attr("data-id");

                $.post('office/deleteMessage', {id: messageId}, function (res) {
                    if (res.code == 1) {
                        $.tipsWarningAlert("通知消息删除成功！");
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                    } else {
                        $.logConsole("查询通知详情失败", res.message);
                        $.tipsWarningAlert("通知详情查询失败");
                    }
                });
            });
        }
    };

    Office_Message.init();
})(jQuery);
