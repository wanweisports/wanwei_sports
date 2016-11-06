<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/settings/settings_users.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $("#user_role").val('${roleId}');
            $("#user_state").val('${status}');
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>系统设置</span> &gt;&gt; <span>员工信息查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">员工信息查询</div>
            <div class="panel-body">
                <form id="users_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="user_role" name="roleId" style="width:160px;">
                            <option value="">员工权限</option>
                            <c:forEach var="role" items="${roleNames}">
                                <option value="${role.roleId}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="user_state" name="status" style="width:160px;">
                            <option value="">员工状态</option>
                            <option value="1">正常</option>
                            <option value="2">锁定</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary users-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="/settings/getUsersView" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus"></span> 添加员工
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>员工编号</th>
                            <th>登录账号</th>
                            <th>员工姓名</th>
                            <th>权限类别</th>
                            <th>生效日期</th>
                            <th>截止日期</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${list}">
                            <tr>
                                <td>${user.operatorNo}</td>
                                <td>${user.operatorId}</td>
                                <td>${user.operatorName}</td>
                                <td>${user.roleName}</td>
                                <td>${user.operatorEffectDate}</td>
                                <td>${user.operatorEndDate}</td>
                                <c:if test="${user.status == 1}">
                                    <td class="text-success">正常</td>
                                </c:if>
                                <c:if test="${user.status != 1}">
                                    <td class="text-danger">锁定</td>
                                </c:if>
                                <td>
                                    <a class="btn btn-primary" href="/settings/getUsersView?operatorId=${user.operatorId}">
                                        <span class="glyphicon glyphicon-share-alt"></span>  查看
                                    </a>
                                    <c:if test="${user.status == 1}">
                                        <a href="javascript:;" class="btn btn-warning user-lock" data-id="${user.operatorId}">
                                            <span class="glyphicon glyphicon-lock"></span> 锁定
                                        </a>
                                    </c:if>
                                    <c:if test="${user.status != 1}">
                                        <a href="javascript:;" class="btn btn-primary user-active" data-id="${user.operatorId}">
                                            <span class="glyphicon glyphicon-flash"></span> 激活
                                        </a>
                                    </c:if>
                                </td>
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
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">确认框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-danger text-message">锁定员工后，会导致此员工无法登陆系统；您确定要锁定此用户吗? </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">取 消</button>
                    <button type="button" class="btn btn-warning lock-confirm">确 认</button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="user"/>
</c:import>
