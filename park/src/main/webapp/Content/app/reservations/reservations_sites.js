(function ($) {
    var Sites_List = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            //新建/修改类型
            $(".site-confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#site_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post("/site/saveSiteInfo", conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.reload();
                    } else {
                        alert(res.message || "场地设置失败, 请稍后重试");
                    }
                });
            });

            function _resetSitesForm () {
                $("#site_id").val("");
                $("#site_type").val("");
                $("#site_name").val("");
                $("#site_remark").val("");
                $("#site_status1").prop("checked", true);
            }

            // 增加场地类型
            $(".site-add").on("click", function (e) {
                e.preventDefault();

                _resetSitesForm();
                $("#settingModal").modal("show");
            });

            // 查询场地详情
            $(".site-list").on("click", ".site-update", function (e) {
                e.preventDefault();

                var $this = $(this);

                _resetSitesForm();

                $.post("/site/getSiteInfo", {
                    siteId: $this.attr("data-id")
                }, function (res) {
                    var data = res.data;

                    $.each(data, function (key, item) {
                        $("#site_form").find("*[name='"+key+"']").not(":radio").val(item);
                    });
                    $("#site_form").find("input[name='siteStatus'][value='"+data.siteStatus+"']")
                        .prop("checked", true);
                });
            });
        }
    };

    Sites_List.init();
})(jQuery);