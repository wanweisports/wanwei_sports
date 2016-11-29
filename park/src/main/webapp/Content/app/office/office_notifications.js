(function ($) {
    var Office_Notifications = {
        opts: {
            URL: '/office/notifications'
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

            function setNotificationInfo(data, isEdit) {
                if (isEdit == 2) {
                    $("#senderModal").find("#note_receiver1").val(data.noteReceiver).attr("disabled", "disabled");
                    $("#senderModal").find(".note-title").text(data.noteTitle);
                    $("#senderModal").find(".note-content").text(data.noteContent);
                } else {
                    $("#fasongModal").find("#note_id").val(data.noteId);
                    $("#fasongModal").find("#note_receiver").val(data.noteReceiver);
                    $("#fasongModal").find("#note_title").val(data.noteTitle);
                    $("#fasongModal").find("#note_content").val(data.noteContent);
                }
            }

            // 查询
            $(".notifications-list").on("click", ".notifications-view", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");
                var isEdit = $(this).attr("data-edit");

                $.post('office/viewNotifications', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setNotificationInfo(data, isEdit);

                        if (isEdit == 1) {
                            $("#fasongModal").find(".save-notification").hide();
                            $("#fasongModal").find(".send-notification").send();
                        }
                    } else {
                        console.log(res.message || "查询通知详情失败, 请稍后重试");
                        alert(res.message || "查询通知详情失败, 请稍后重试");
                    }
                });
            });

            // 转发
            $(".notifications-list").on("click", ".notifications-resend", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");
                var isEdit = $(this).attr("data-edit");

                $.post('office/viewNotifications', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setNotificationInfo(data, isEdit);

                        if (isEdit == 1) {
                            $("#fasongModal").find(".save-notification").hide();
                            $("#fasongModal").find(".send-notification").send();
                        }
                    } else {
                        console.log(res.message || "查询通知详情失败, 请稍后重试");
                        alert(res.message || "查询通知详情失败, 请稍后重试");
                    }
                });
            });

            // 增加通知
            $(".add-notification").on("click", function (e) {
                e.preventDefault();

                setNotificationInfo({}, 1);
                $("#fasongModal").find(".save-notification").show();
                $("#fasongModal").find(".send-notification").hide();
            });

            // 保存
            $(".save-notification").on("click", function (e) {
                e.preventDefault();

                var $form = $("#notification_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/saveNotifications', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "通知信息保存失败, 请稍后重试");
                    }
                });
            });

            // 发送
            $(".send-notification").on("click", function (e) {
                e.preventDefault();

                var $form = $("#notification_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/sendNotifications', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "通知信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Office_Notifications.init();
})(jQuery);
