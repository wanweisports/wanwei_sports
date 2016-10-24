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
                        "text" : "全部权限",
                        "state" : {"opened": true, "selected": true },
                        "children" : [{
                            "id": "member",
                            "text" : "会员管理",
                            "children" : [{
                                "id": "member_reg",
                                "text" : "新会员办理"
                            }, {
                                "id": "member_query",
                                "text" : "会员查询"
                            }, {
                                "id": "member_recharge",
                                "text" : "会员卡充值"
                            }, {
                                "id": "member_upgrade",
                                "text" : "会员卡升级"
                            }, {
                                "id": "member_refresh",
                                "text" : "会员卡补办"
                            }, {
                                "id": "member_loan",
                                "text" : "应收款管理"
                            }, {
                                "id": "member_invoice",
                                "text" : "发票登记查询"
                            }, {
                                "id": "member_settings",
                                "text" : "会员类型设置"
                            }]
                        }, {
                            "id": "site",
                            "text" : "预订管理",
                            "children" : [{
                                "id": "site_sequence",
                                "text" : "场地预订"
                            }, {
                                "id": "site_bath",
                                "text" : "批量预订"
                            }, {
                                "id": "site_order",
                                "text" : "预订订单查询"
                            }, {
                                "id": "site_pda",
                                "text" : "场地热点分析"
                            }, {
                                "id": "site_setting",
                                "text" : "场地设置"
                            }, {
                                "id": "site_sports_setting",
                                "text" : "场地类型设置"
                            }]
                        }, {
                            "id": "good",
                            "text" : "商品管理",
                            "children" : [{
                                "id": "good_setting",
                                "text" : "商品设置"
                            }, {
                                "id": "good_stock",
                                "text" : "进销存管理"
                            }, {
                                "id": "good_market",
                                "text" : "商品销售"
                            }, {
                                "id": "good_detail",
                                "text" : "库存明细日志"
                            }]
                        }, {
                            "id": "data",
                            "text" : "数据统计",
                            "children" : [{
                                "id": "data_register",
                                "text" : "会员办理统计"
                            }, {
                                "id": "data_business",
                                "text" : "营业收支统计"
                            }, {
                                "id": "data_percent",
                                "text" : "场地使用率"
                            }, {
                                "id": "data_attendance",
                                "text" : "签到记录"
                            }]
                        }, {
                            "id": "settings",
                            "text" : "系统设置",
                            "children" : [{
                                "id": "settings_common",
                                "text" : "基础设置"
                            }, {
                                "id": "settings_user",
                                "text" : "员工信息设置"
                            }, {
                                "id": "settings_role",
                                "text" : "员工权限设置"
                            }, {
                                "id": "settings_notification",
                                "text" : "通知管理"
                            }, {
                                "id": "settings_database",
                                "text" : "数据库操作"
                            }, {
                                "id": "settings_logs",
                                "text" : "系统日志"
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
                if (conditions.limit.length === 0) {
                    alert("请选择权限");
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/settings/roles', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#tips_modal").modal({show: true, backdrop: false});
                    } else {
                        alert(res.message || "设置角色失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Settings_Roles_View.init();
})(jQuery);
