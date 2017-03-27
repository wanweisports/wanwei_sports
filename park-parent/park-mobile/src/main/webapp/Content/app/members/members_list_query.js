(function ($) {
    var Members_List = {
        opts: {
            URL: '/member/memberList'
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

            // 删除
            $(".members-list").on("click", ".members-delete", function () {
                var $this = $(this);

                $("#delete_memberId").val($this.attr("data-id"));
                $("#deleteModal").modal({backdrop: false, show: true});
            });

            // 删除
            $(".confirm-delete").on("click", function (e) {
                e.preventDefault();

                var memberId = $("#delete_memberId").val();

                $.post('/teachers/lockTeacher', {memberId: memberId}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "会员删除失败, 请稍后重试");
                        alert(res.message || "会员删除失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_List.init();
})(jQuery);
