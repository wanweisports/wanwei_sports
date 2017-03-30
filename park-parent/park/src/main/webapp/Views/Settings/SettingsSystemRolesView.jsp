<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jsTree/themes/default/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/common/style.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jsTree/jstree.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/settings/settings_roles_view.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#roles_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="roles_form" class="form-horizontal" novalidate onsubmit="return false;">
            <input type="hidden" name="roleId" value="${role.roleId}">
            <input type="hidden" name="menuIds" value="${menuIds}">
            <div class="panel panel-default">
                <div class="panel-heading">员工权限设置</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="role_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 角色名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="role_name" name="roleName"
                                       placeholder="权限名称" autocomplete="off" value="${role.roleName}"
                                       data-val="true" data-val-required="角色名称不能为空">
                                <div data-valmsg-for="roleName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role_remark" class="col-sm-4 control-label">角色说明</label>

                            <div class="col-sm-8">
                                <textarea class="form-control" rows="3" id="role_remark" name="roleDescribe"
                                          placeholder="角色说明">${role.roleDescribe}</textarea>
                                <div data-valmsg-for="roleDescribe" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role_status1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 状态
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="roleStatus" id="role_status1" value="1"
                                           <c:if test="${role.roleStatus == 1}">checked</c:if>> 正常
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="roleStatus" id="role_status2" value="2"
                                           <c:if test="${role.roleStatus == 2}">checked</c:if>> 锁定
                                </label>
                                <div data-valmsg-for="roleStatus" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <a class="btn btn-default" href="/settings/getRoles">
                                    <span class="glyphicon glyphicon-chevron-left"></span> 返回
                                </a>
                                <button type="button" class="btn btn-success roles-save">
                                    <span class="glyphicon glyphicon-ok"></span> 保存
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
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="员工权限设置"/>
</c:import>
