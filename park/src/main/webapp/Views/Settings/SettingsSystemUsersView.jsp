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

            $("#user_role").val('${roleId}');
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>系统设置</span> &gt;&gt; <span>员工信息查询</span> &gt;&gt; <span>员工信息设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="users_form" class="form-horizontal" novalidate onsubmit="return false;">
            <input type="hidden" name="id" value="${id}">
            <div class="panel panel-default">
                <div class="panel-heading">员工信息设置</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工编号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_no" name="operatorNo"
                                       placeholder="员工编号" autocomplete="off" value="${operatorNo}"
                                       data-val="true" data-val-required="员工编号不能为空">
                                <div data-valmsg-for="operatorNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 真实姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_name" name="operatorName"
                                       placeholder="用户姓名" autocomplete="off" value="${operatorName}"
                                       data-val="true" data-val-required="用户姓名不能为空">
                                <div data-valmsg-for="operatorName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="start_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 生效日期
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="start_date" name="operatorEffectDate"
                                       placeholder="生效时间" autocomplete="off" value="${operatorEffectDate}"
                                       data-val="true" data-val-required="生效时间不能为空">
                                <div data-valmsg-for="operatorEffectDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="data_birthday" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工生日
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="data_birthday" name="operatorBirthday"
                                       placeholder="生效时间" autocomplete="off" value="${operatorBirthday}"
                                       data-val="true" data-val-required="生效时间不能为空">
                                <div data-valmsg-for="operatorBirthday" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contact_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系人
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="contact_name" name="operatorContact"
                                       placeholder="联系人" autocomplete="off" value="${operatorContact}"
                                       data-val="true" data-val-required="联系人不能为空">
                                <div data-valmsg-for="operatorContact" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_account" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 登录账户
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_account" name="operatorId"
                                       placeholder="登录账户" autocomplete="off" value="${operatorId}"
                                       data-val="true" data-val-required="登录账户不能为空">
                                <div data-valmsg-for="operatorId" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_role" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工权限
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="user_role" name="roleId"
                                        data-val="true" data-val-required="请选择员工权限">
                                    <option value="">请选择</option>
                                    <c:forEach var="role" items="${roleNames}">
                                        <option value="${role.roleId}">${role.roleName}</option>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="roleId" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="end_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 截止日期
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="end_date" name="operatorEndDate"
                                       placeholder="截止日期" autocomplete="off" value="${operatorEndDate}"
                                       data-val="true" data-val-required="截止日期不能为空">
                                <div data-valmsg-for="operatorEndDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contact_phone" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系电话
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="contact_phone" name="operatorMobile"
                                       placeholder="联系电话" autocomplete="off" value="${operatorMobile}"
                                       data-val="true" data-val-required="联系电话不能为空">
                                <div data-valmsg-for="operatorMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contact_address" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系地址
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="contact_address" name="operatorAddress"
                                       placeholder="联系电话" autocomplete="off" value="${operatorAddress}">
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
