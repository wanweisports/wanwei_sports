(function ($) {
    var Office_Notifications = {
        opts: {
            URL: location.pathname,
            RECEIVER_TPL: '<button type="button" class="btn btn-info note-receiver" data-id="#RECEIVERID#" style="margin: 6px">' +
                '#RECEIVERNAME# <span class="glyphicon glyphicon-remove text-danger remove"></span>' +
                '</button>'
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

            function setNotificationInfo(data, isSend) {
                if (isSend == 2) {
                    $("#notifications_send_modal").find("#notification_send_id").val(data.noteId);
                    $("#notifications_send_modal").find("#notification_send_receiver").val(data.noteReceiver || '');
                    $("#notifications_send_modal").find("#notification_send_title").val(data.noteTitle || '');
                    $("#notifications_send_modal").find("#notification_send_content").val(data.noteContent || '');
                } else {
                    $("#notifications_view_modal").find("#notification_view_id").val(data.noteId);
                    $("#notifications_view_modal").find("#notification_view_receiver").val(data.noteReceiver || '');
                    $("#notifications_view_modal").find("#notification_view_title").val(data.noteTitle || '');
                    $("#notifications_view_modal").find("#notification_view_content").val(data.noteContent || '');
                }
            }

            // 写通知
            $(".add-notification").on("click", function (e) {
                e.preventDefault();

                setNotificationInfo({}, 1);
            });

            // 收件人选项改变
            $("#notification_view_receiver").on("change", function (e) {
                e.preventDefault();

                return false;

                var $this = $(this);
                var receiverId = $this.val();
                var receiverName = $this.find("option:selected").text().trim();

                var $receivers = $(".note-view-receivers");

                if ($receivers.find('[data-id="' + receiverId + '"]').size() === 0) {
                    $receivers.append(
                        content.opts.RECEIVER_TPL.replace(/#RECEIVERID#/g, receiverId)
                            .replace(/#RECEIVERNAME#/g, receiverName)
                    );
                }
            });

            // 收件人标签删除
            $(".note-view-receivers").on("click", ".note-receiver .remove", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.parents(".note-receiver").remove();
            });

            function setReceivers() {
                var $receivers = $(".note-view-receivers");
                var receiverIds = [];

                $receivers.find(".note-receiver").each(function (index, item) {
                    receiverIds.push($(item).attr("data-id"));
                });

                return receiverIds;
            }

            function sendNotifications(conditions) {
                $.post('office/sendNotifications', conditions, function (res) {
                    if (res.code != 1) {
                        alert(res.message || "通知信息发送失败, 请稍后重试");
                    }
                });
            }

            // 发送
            $(".send-notification").on("click", function (e) {
                e.preventDefault();

                var $form = $("#notification_send_form");
                var conditions = $form.serializeObject();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/sendNotifications', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.assign(content.opts.URL + '?type=2');
                    } else {
                        $.logConsole("通知信息发送失败", res.message);
                        $.tipsWarningAlert("通知信息发送失败");
                    }
                });
            });

            // 保存草稿
            $(".save-notification").on("click", function (e) {
                e.preventDefault();

                var $form = $("#notification_view_form");
                var conditions = $form.serializeObject();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }

                $form.attr("submitting", "submitting");

                $.post('office/saveNotifications', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole("通知详情保存失败", res.message);
                        $.tipsWarningAlert("通知详情保存失败");
                    }
                });
            });

            // 查询详情
            $(".notifications-list").on("click", ".notifications-view", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('office/viewNotifications', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setNotificationInfo(data, 1);
                    } else {
                        $.logConsole("查询通知详情失败", res.message);
                        $.tipsWarningAlert("通知详情查询失败");
                    }
                });
            });

            // 查询详情
            $(".notifications-list").on("click", ".notifications-send", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('office/viewNotifications', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setNotificationInfo(data, 2);
                    } else {
                        $.logConsole("查询通知详情失败", res.message);
                        $.tipsWarningAlert("通知详情查询失败");
                    }
                });
            });
        }
    };

    Office_Notifications.init();
})(jQuery);
