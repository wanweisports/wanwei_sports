(function ($) {
    var Members_Children = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 删除子会员
            $(".member-children-list").on("click", ".children-delete", function (e) {
                e.preventDefault();

                $.post('member/delChildrenMember', {"memberId": $(this).attr("data-id")}, function (res) {
                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "子会员删除失败, 请稍后重试");
                        alert(res.message || "子会员删除失败, 请稍后重试");
                    }
                });
            });

            // 用户提交
            $(".confirm-member").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/saveChildrenMember', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        console.log(res.message || "子会员保存失败, 请稍后重试");
                        alert(res.message || "子会员保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_Children.init();
})(jQuery);
