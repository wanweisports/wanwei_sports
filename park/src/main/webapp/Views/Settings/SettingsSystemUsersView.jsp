<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/settings/settings_users.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/settings/settings_users_view.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#users_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>
<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="users_form" class="form-horizontal" action="" method="post" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">用户信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_account" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 用户账户
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_account" name="userAccount"
                                       placeholder="用户账户" autocomplete="off"
                                       data-val="true" data-val-required="用户账户不能为空">
                                <div data-valmsg-for="userAccount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 用户姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_name" name="userName"
                                       placeholder="用户姓名" autocomplete="off"
                                       data-val="true" data-val-required="用户姓名不能为空">
                                <div data-valmsg-for="userName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="start_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 生效日期
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="start_date" name="startDate"
                                       placeholder="生效时间" autocomplete="off"
                                       data-val="true" data-val-required="生效时间不能为空">
                                <div data-valmsg-for="startDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 用户密码
                            </label>

                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="user_password" name="userPassword"
                                       placeholder="用户密码" autocomplete="off"
                                       data-val="true" data-val-required="用户密码不能为空">
                                <div data-valmsg-for="userPassword" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_role" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 所属角色
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="user_role" name="userRole">
                                    <option value="1">经理</option>
                                    <option value="2">前台收银</option>
                                </select>
                                <div data-valmsg-for="userRole" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="end_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 截止日期
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="end_date" name="endDate"
                                       placeholder="截止日期" autocomplete="off"
                                       data-val="true" data-val-required="截止日期不能为空">
                                <div data-valmsg-for="endDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="button" class="btn btn-primary col-sm-4">
                                    <span class="glyphicon glyphicon-ok"></span> 设置用户
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="user"/>
</c:import>
