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
            $(".teachers-list").on("click", ".teachers-refresh", function () {
                var $this = $(this);

                $("#refresh_cardId").val($this.attr("data-cardId"));
                $("#refresh_cardNo").val($this.attr("data-cardNo"));

                // 生成新会员卡号
                $.post('/teachers/getNewCardNo', function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#refresh_newNo").val(data.newCardNo);
                    } else {
                        $.logConsole('新会员卡号生成失败', res1.message);
                        $.tipsWarningAlert('新会员卡号生成失败');
                    }
                });
            });

            // 补办
            $(".confirm-refresh").on("click", function (e) {
                e.preventDefault();

                var $btn = $(this).button('loading');

                var $form = $("#refresh_form");
                var conditions = $form.serialize();

                if ($("#refresh_cardId").val() === "") {
                    alert("请先选择会员卡");
                    return false;
                }

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/teachers/teacherCardBuBan', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#refresh_modal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#refresh_modal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        $.logConsole('教师卡补办失败', res.message);
                        $.tipsWarningAlert('教师卡补办失败');
                    }

                    $btn.button('reset');
                });
            });

            // 删除
            $(".teachers-list").on("click", ".teachers-delete", function () {
                var $this = $(this);

                $("#delete_teacherId").val($this.attr("data-id"));
                $("#delete_modal").modal({backdrop: false, show: true});
            });

            // 删除
            $(".confirm-delete").on("click", function (e) {
                e.preventDefault();

                var teacherId = $("#delete_teacherId").val();

                $.post('/teachers/lockTeacher', {memberId: teacherId}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        $.logConsole('教师删除失败', res.message);
                        $.tipsWarningAlert('教师删除失败');
                    }
                });
            });
        }
    };

    Teachers_List.init();
})(jQuery);
