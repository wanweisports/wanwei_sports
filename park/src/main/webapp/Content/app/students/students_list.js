(function ($) {
    var Teachers_List = {
        opts: {
            URL: '/students/list'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索显示列表
            $(".student-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#student_filter_form").serialize();

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
            $(".students-list").on("click", ".students-refresh", function () {
                var $this = $(this);

                $("#refresh_cardId").val($this.attr("data-cardId"));
                $("#refresh_cardNo").val($this.attr("data-cardNo"));

                // 生成新会员卡号
                $.post('/member/getNewCardNo', function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#refresh_newNo").val(data.newCardNo);
                    } else {
                        console.log(res.message || "新会员卡号生成失败, 请稍后重试");
                        alert(res.message || "新会员卡号生成失败, 请稍后重试");
                    }
                });
            });

            // 补办
            $(".confirm-refresh").on("click", function (e) {
                e.preventDefault();

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

                $.post('/students/studentCardBuBan', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#refreshModal").modal({backdrop: false, show: true});
                        setTimeout(function () {
                            $("#refreshModal").modal("hide");
                            location.reload();
                        }, 3000);
                    } else {
                        console.log(res.message || "学生卡补办失败, 请稍后重试");
                        alert(res.message || "学生卡补办失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".students-list").on("click", ".students-delete", function () {
                var $this = $(this);

                $("#delete_studentId").val($this.attr("data-id"));
                $("#deleteModal").modal({backdrop: false, show: true});
            });

            // 删除
            $(".confirm-delete").on("click", function (e) {
                e.preventDefault();

                var studentId = $("#delete_studentId").val();

                $.post('/students/lockStudent', {studentId: studentId}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "学生删除失败, 请稍后重试");
                        alert(res.message || "学生删除失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Teachers_List.init();
})(jQuery);
