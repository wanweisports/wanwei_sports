(function ($) {
    var Settings_Roles_List = {
        opts: {
            URL: '/settings/getRoles'
        },
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 检索显示角色列表
            $(".roles-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#roles_filter_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });
        }
    };

    Settings_Roles_List.init();
})(jQuery);
