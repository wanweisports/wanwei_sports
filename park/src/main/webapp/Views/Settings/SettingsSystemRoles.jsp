<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/dist/settings/settings_roles.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="ww-wrapper">
        <div class="wrapper">
            <ol class="breadcrumb">
                <li><a href="/">工作平台</a></li>
                <li class="active">角色查询</li>
            </ol>
            <div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form id="roles_filter_form" class="form-inline" onsubmit="return false;">
                            <div class="form-group">
                                <select class="form-control" id="role_state" name="roleState" style="width:200px;">
                                    <option value="">所有状态</option>
                                    <option value="1">正常</option>
                                    <option value="2">锁定</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <a href="javascript:;" class="btn btn-primary roles-filter">
                                    <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                                </a>
                            </div>
                            <div class="form-group pull-right">
                                <a href="/settings/getRolesView" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-plus"></span> 添加用户角色
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>角色名称</th>
                                    <th>角色说明</th>
                                    <th>状态</th>
                                    <th>最后操作人</th>
                                    <th>创建时间</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>经理</td>
                                    <td>管理营业</td>
                                    <td class="text-success">正常</td>
                                    <td>李小安</td>
                                    <td>2016-08-21 12:23:25</td>
                                    <td>
                                        <a class="btn btn-primary" href="/settings/getRolesView?roleId=2">
                                            <span class="glyphicon glyphicon-share-alt"></span>  查看
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>收银</td>
                                    <td>日常工作</td>
                                    <td class="text-success">正常</td>
                                    <td>李小安</td>
                                    <td>2016-08-21 12:23:25</td>
                                    <td>
                                        <a class="btn btn-primary" href="/settings/getRolesView?roleId=1">
                                            <span class="glyphicon glyphicon-share-alt"></span>  查看
                                        </a>
                                    </td>
                                </tr>
                                <c:forEach var="roles" items="${roles}">
                                    <tr>
                                        <td>${loop.index}</td>
                                        <td>${role.role_name}</td>
                                        <td>${role.role_remark}</td>
                                        <c:if test="${role.role_status == 1}">
                                            <td class="text-success">正常</td>
                                        </c:if>
                                        <c:if test="${role.role_status == 2}">
                                            <td class="text-danger">锁定</td>
                                        </c:if>
                                        <td>李小安</td>
                                        <td>2016-08-21 12:23:25</td>
                                        <td>
                                            <a class="btn btn-primary" href="/settings/getRolesView?roleId=${role.role_id}">
                                                <span class="glyphicon glyphicon-share-alt"></span>  查看
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="role"/>
</c:import>
