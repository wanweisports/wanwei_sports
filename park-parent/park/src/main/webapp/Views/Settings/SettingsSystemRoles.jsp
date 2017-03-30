<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/common/style.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/settings/settings_roles.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".role-status.btn-success").addClass("btn-default").removeClass("btn-success");
            if (${status == 1 || status == 2}) {
                $(".role-status[data-count='${status}']").addClass("btn-success").removeClass("btn-default");
            } else {
                $(".role-status[data-count='0']").addClass("btn-success").removeClass("btn-default");
            }
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">员工权限查询</div>
            <div class="panel-body">
                <form id="roles_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/settings/getRoles" data-count="0" class="btn btn-success role-status">全部</a>
                            <a href="/settings/getRoles?status=1" data-count="1" class="btn btn-default role-status">正常</a>
                            <a href="/settings/getRoles?status=2" data-count="2" class="btn btn-default role-status">锁定</a>
                        </div>
                    </div>
                    <div class="form-group pull-right">
                        <a href="/settings/getRolesView" class="btn btn-success">
                            <span class="glyphicon glyphicon-plus"></span> 添 加
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
                        <tr class="bg-info">
                            <th>编号</th>
                            <th>权限名称</th>
                            <th>权限说明</th>
                            <th>权限状态</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="role" items="${list}" varStatus="loop">
                            <tr>
                                <td>#${loop.index + 1}</td>
                                <td>
                                    <a href="/settings/getRolesView?roleId=${role.roleId}">${role.roleName}</a>
                                </td>
                                <td>${role.roleDescribe}</td>
                                <c:if test="${role.roleStatus == 1}">
                                    <td>正常</td>
                                </c:if>
                                <c:if test="${role.roleStatus == 2}">
                                    <td class="text-danger">锁定</td>
                                </c:if>
                                <td>${role.createTime}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                        <p class="pull-left" style="margin: 12px 14px;">
                            <span>${pageSize}条/页</span>
                            <span>总${count}条</span>
                        </p>
                        <ul class="pagination pull-right">
                            <c:if test="${currentPage == 1}">
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>首页</span>
                                    </a>
                                </li>
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage != 1}">
                                <li>
                                    <a class="page-first" href="javascript:;" data-index="1">
                                        <span>首页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-prev" href="javascript:;" data-index="${currentPage - 1}">
                                        <span>上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${lastPage}">
                                <c:if test="${i == currentPage}">
                                    <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                                <c:if test="${i != currentPage}">
                                    <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${currentPage == lastPage}">
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>下一页</span>
                                    </a>
                                </li>
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>末页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage != lastPage}">
                                <li>
                                    <a class="page-next" href="javascript:;" data-index="${currentPage + 1}">
                                        <span>下一页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-last" href="javascript:;" data-index="${lastPage}">
                                        <span>末页</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                    <c:if test="${fn:length(list) == 0}">
                        <p class="text-muted no-list-count">没有检索到记录！</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="员工权限设置"/>
</c:import>
