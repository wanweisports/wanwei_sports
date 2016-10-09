<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
<link href="/public/lib/jquery/jsTree/themes/default/style.css" rel="stylesheet" type="text/css">

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li><a href="/settings/systemRoles">角色设置</a></li>
            <li class="active">角色编辑</li>
        </ol>
        <form id="users_form" class="form-horizontal" action="/settings/submitSystemRoles" method="post" novalidate>
            <div class="panel panel-default">
                <div class="panel-heading">角色信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="role_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 角色名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="role_name" name="role_name"
                                       placeholder="角色名称" autocomplete="off"
                                       data-val="true" data-val-required="角色名称不能为空">
                                <div data-valmsg-for="role_name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role_remark" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 角色说明
                            </label>

                            <div class="col-sm-8">
                                <textarea class="form-control" rows="3" id="role_remark" name="role_remark"
                                          placeholder="角色说明" autocomplete="off"
                                          data-val="true" data-val-required="角色说明不能为空"></textarea>
                                <div data-valmsg-for="role_remark" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role_priority" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 显示优先级
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="role_priority" name="role_priority"
                                       placeholder="显示优先级" autocomplete="off"
                                       data-val="true" data-val-required="显示优先级不能为空"
                                       value="100">
                                <div data-valmsg-for="role_priority" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role_status1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 状态
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="role_status" id="role_status1" value="1" checked> 正常
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="role_status" id="role_status2" value="2"> 锁定
                                </label>
                                <div data-valmsg-for="role_status" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-ok"></span> 设置角色
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div id="role_tree" class="ww-tree"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/lib/jquery/jsTree/jstree.js"></script>
<script>
    // lazy demo
    $('#role_tree').jstree({
        "plugins" : ["wholerow", "checkbox"],
        'core' : {
            'data' : [{
                "id": "node",
                "text" : "全部功能",
                "state" : {"opened" : true },
                "children" : [{
                    "id": "node_1",
                    "text" : "会员管理",
                    "children" : [{
                        "id": "node_1_1",
                        "text" : "新会员注册"
                    }, {
                        "id": "node_1_2",
                        "text" : "会员查询"
                    }, {
                        "id": "node_1_3",
                        "text" : "发票登记"
                    }, {
                        "id": "node_1_4",
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
</script>
<jsp:include page="/Views/Shared/Footer.jsp" />
