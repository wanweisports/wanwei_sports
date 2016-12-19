(function ($) {
    var Office_Notifications = {
        opts: {
            URL: '/office/notifications',
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

            function setNotificationInfo(data, isEdit) {
                if (isEdit == 2) {
                    $("#fasongModal").find("#note_receiver1").val(data.noteReceiver).attr("disabled", "disabled");
                    $("#fasongModal").find(".note-title").text(data.noteTitle).attr("disabled", "disabled");
                    $("#fasongModal").find(".note-content").text(data.noteContent).attr("disabled", "disabled");
                    $("#fasongModal").find(".send-notification").hide();
                    $("#fasongModal").find(".resend-notification").show();
                } else {
                    $("#fasongModal").find("#note_id").val(data.noteId);
                    $("#fasongModal").find("#note_receiver").val(data.noteReceiver);
                    $("#fasongModal").find("#note_title").val(data.noteTitle);
                    $("#fasongModal").find("#note_content").val(data.noteContent);
                    $("#fasongModal").find(".send-notification").show();
                    $("#fasongModal").find(".resend-notification").hide();
                }
            }

            // 写通知
            $(".add-notification").on("click", function (e) {
                e.preventDefault();

                setNotificationInfo({}, 1);
            });

            // 收件人选项改变
            /*$("#note_receiver").on("change", function (e) {
                e.preventDefault();

                var $this = $(this);
                var reveiverId = $this.val();
                var receiverName = $this.find("option:selected").text().trim();

                var $receivers = $(".note-receivers");

                if ($receivers.find('[data-id="' + reveiverId + '"]').size() === 0) {
                    $receivers.append(
                        content.opts.RECEIVER_TPL.replace(/#RECEIVERID#/g, reveiverId)
                            .replace(/#RECEIVERNAME#/g, receiverName)
                    );
                }
            });*/

            // 收件人标签删除
            $(".note-receivers").on("click", ".note-receiver .remove", function (e) {
                e.preventDefault();

                var $this = $(this);

                $this.parents(".note-receiver").remove();
            });

            function setReceivers() {
                var $receivers = $(".note-receivers");
                var receiverIds = [];

                $receivers.find(".note-receiver").each(function (index, item) {
                    receiverIds.push($(item).attr("data-id"));
                });

                $("#note_receivers").val(receiverIds.join(","));
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

                var $form = $("#notification_form");
                var conditions = $form.serializeObject();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('office/sendNotifications', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "通知信息发送失败, 请稍后重试");
                        alert(res.message || "通知信息发送失败, 请稍后重试");
                    }
                });
            });

            // 查询
            $(".notifications-list").on("click", ".notifications-view", function (e) {
                e.preventDefault();

                var noteId = $(this).attr("data-id");

                $.post('office/viewNotifications', {noteId: noteId}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        setNotificationInfo(data, 2);
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
        }
    };

    Office_Notifications.init();
})(jQuery);
