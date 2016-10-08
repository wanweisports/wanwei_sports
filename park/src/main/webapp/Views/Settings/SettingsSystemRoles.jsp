<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">角色设置</li>
        </ol>
        <div class="settings-filter">
            <form class="form-inline">
                <div class="form-group">
                    <select class="form-control" id="user_state" name="user_state">
                        <option value="">所有状态</option>
                    </select>
                </div>
                <div class="form-group">
                    <a href="javascript:;" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span> 检索角色
                    </a>
                </div>
                <div class="form-group pull-right">
                    <a href="/settings/systemRolesAdd" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> 添加用户角色
                    </a>
                </div>
            </form>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr class="">
                        <th>#</th>
                        <th>角色名称</th>
                        <th>角色说明</th>
                        <th>状态</th>
                        <th>最后操作人</th>
                        <th>创建时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="roles" items="${roles}">
                        <tr>
                            <td>${loop.index}</td>
                            <td><a href="/settings/systemRoles/${role.role_id}">${role.role_name}</td>
                            <td>${role.role_remark}</td>
                            <c:if test="${role.role_status == 1}">
                                <td class="text-success">正常</td>
                            </c:if>
                            <c:if test="${role.role_status == 2}">
                                <td class="text-danger">锁定</td>
                            </c:if>
                            <td>李小安</td>
                            <td>2016-08-21 12:23:25</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
