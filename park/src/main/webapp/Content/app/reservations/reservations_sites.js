(function ($) {
    var Sites_List = {
        opts: {
            URL: '/site/getSiteInfos'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 分页
            $(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click", function (e) {
                e.preventDefault();

                var conditions = location.search;
                var pageIndex = $(this).attr("data-index");

                if (conditions) {
                    if (conditions.indexOf("page=") == -1) {
                        location.assign(content.opts.URL + conditions + '&page=' + pageIndex);
                    } else {
                        location.assign(content.opts.URL + conditions.replace(/(page=)\d+/, '$1' + pageIndex));
                    }
                } else {
                    location.assign(content.opts.URL + '?page=' + pageIndex);
                }
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
                $("#setting_modal").modal({backdrop: false, show: true});
            });

            // 更改场地类型
            $(".site-list").on("click", ".site-update", function (e) {
                e.preventDefault();

                var $this = $(this);

                _resetSitesForm();

                $.post("/site/getSiteInfo", {siteId: $this.attr("data-id")}, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $.each(data, function (key, item) {
                            $("#site_form").find("*[name='" + key + "']").not(":radio").val(item);
                        });
                        $("#site_form").find("input[name='siteStatus'][value='" + data.siteStatus + "']")
                            .prop("checked", true);
                        $("#setting_modal").modal({backdrop: false, show: true});
                    } else {
                        $.logConsole('场地查询失败', res.message);
                        $.tipsWarningAlert('场地查询失败');
                    }
                });
            });

            // 提交类型
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
                        $.tipsSuccessAlert('场地设置成功！', function () {
                            location.reload();
                        });
                    } else {
                        $.logConsole('场地设置失败', res.message);
                        $.tipsWarningAlert('场地设置失败');
                    }
                });
            });
        }
    };

    Sites_List.init();
})(jQuery);
