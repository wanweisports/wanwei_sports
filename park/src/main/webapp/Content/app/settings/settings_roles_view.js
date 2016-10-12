(function ($) {
    var Settings_Roles_View = {
        init: function () {
            this.initEvents();
            this.initTree();
        },
        // 初始化树
        initTree: function () {
            // lazy demo
            $('#role_tree').jstree({
                "plugins" : ["wholerow", "checkbox"],
                'core' : {
                    'data' : [{
                        "id": "root",
                        "text" : "全部功能",
                        "state" : {"opened": true, "selected": true },
                        "children" : [{
                            "id": "member",
                            "text" : "会员管理",
                            "children" : [{
                                "id": "member_reg",
                                "text" : "新会员注册"
                            }, {
                                "id": "member_query",
                                "text" : "会员查询"
                            }, {
                                "id": "member_invoice",
                                "text" : "发票登记"
                            }, {
                                "id": "member_settings",
                                "text" : "会员类型设置"
                            }]
                        }, {
                            "id": "node_2",
                            "text" : "场地预订",
                            "children" : [{
                                "id": "node_2_1",
                                "text" : "现场预订"
                            }, {
                                "id": "node_2_2",
                                "text" : "批量预订"
                            }, {
                                "id": "node_2_3",
                                "text" : "热点概率分析"
                            }, {
                                "id": "node_2_4",
                                "text" : "场地类型"
                            }, {
                                "id": "node_2_5",
                                "text" : "场地设置"
                            }]
                        }, {
                            "id": "node_3",
                            "text" : "商品管理",
                            "children" : [{
                                "id": "node_3_1",
                                "text" : "商品设置"
                            }, {
                                "id": "node_3_2",
                                "text" : "进销存管理"
                            }, {
                                "id": "node_3_3",
                                "text" : "商品销售"
                            }]
                        }, {
                            "id": "node_4",
                            "text" : "数据统计",
                            "children" : [{
                                "id": "node_4_1",
                                "text" : "会员注册统计"
                            }, {
                                "id": "node_4_2",
                                "text" : "营业收入统计"
                            }, {
                                "id": "node_4_3",
                                "text" : "签到记录"
                            }]
                        }, {
                            "id": "node_5",
                            "text" : "系统设置",
                            "children" : [{
                                "id": "node_5_1",
                                "text" : "用户设置"
                            }, {
                                "id": "node_5_2",
                                "text" : "角色设置"
                            }, {
                                "id": "node_5_3",
                                "text" : "基础设置"
                            }, {
                                "id": "node_5_4",
                                "text" : "通知设置"
                            }]
                        }]
                    }]
                }
            });
        },
        initEvents: function () {
            // 角色设置
            $(".roles-save").on("click", function (e) {
                e.preventDefault();

                var $form = $("#roles_form");
                var conditions = $form.serializeObject();

                conditions.limit = $("#role_tree").jstree("get_selected");

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                if (conditions.limit.length == 0) {
                    alert("请选择权限");
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/settings/roles', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal("show");
                    } else {
                        alert("设置角色失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Settings_Roles_View.init();
})(jQuery);
