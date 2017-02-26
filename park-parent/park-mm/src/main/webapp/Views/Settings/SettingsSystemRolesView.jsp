<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jsTree/themes/default/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
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

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>系统设置</span> &gt;&gt; <span>员工权限查询</span> &gt;&gt; <span>员工权限设置</span>
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
                                <span class="text-danger">*</span> 权限名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="role_name" name="roleName"
                                       placeholder="权限名称" autocomplete="off" value="${role.roleName}"
                                       data-val="true" data-val-required="角色名称不能为空">
                                <div data-valmsg-for="roleName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role_remark" class="col-sm-4 control-label">权限说明</label>

                            <div class="col-sm-8">
                                <textarea class="form-control" rows="3" id="role_remark" name="roleDescribe"
                                          placeholder="权限说明">${role.roleDescribe}</textarea>
                                <div data-valmsg-for="roleDescribe" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <!-- 未用到 -->
                        <div class="form-group">
                            <label for="role_priority" class="col-sm-4 control-label">显示优先级</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="role_priority" name="rolePriority"
                                       placeholder="显示优先级" autocomplete="off"
                                       data-val-regex-pattern="^\d{1,3}$" value="${role.roleLevel}"
                                       data-val-regex="显示优先级只能是1~3位数字">
                                <div data-valmsg-for="roleLevel" data-valmsg-replace="true"></div>
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
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary col-sm-4 roles-save">
                                    <span class="glyphicon glyphicon-ok"></span> 设置权限
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

    <div class="modal fade" id="tips_modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">员工权限设置保存成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="role"/>
</c:import>
