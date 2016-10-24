<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/dist/settings/settings_users.js?v=${static_resource_version}"></script>
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
                        <select class="form-control" id="user_role" name="userRole" style="width:160px;">
                            <option value="">员工权限</option>
                            <option value="1">经理</option>
                            <option value="1">收银</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="user_state" name="userState" style="width:160px;">
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
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-flash"></span> 激活员工
                        </a>
                        <a href="javascript:;" class="btn btn-warning">
                            <span class="glyphicon glyphicon-lock"></span> 锁定员工
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
                        <tr class="">
                            <th>员工编号</th>
                            <th>登录账号</th>
                            <th>员工姓名</th>
                            <th>权限类别</th>
                            <th>生效日期</th>
                            <th>截止日期</th>
                            <th>状态</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>00000</td>
                            <td>xiaoan.li@wanwei.com</td>
                            <td>李小安</td>
                            <td>收银</td>
                            <td>2016-01-01</td>
                            <td>--</td>
                            <td class="text-success">正常</td>
                            <td>
                                <a class="btn btn-primary" href="/settings/getUsersView?userId=1">
                                    <span class="glyphicon glyphicon-share-alt"></span>  查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>00012</td>
                            <td>xiaoan.li@wanwei.com</td>
                            <td>李晓丹</td>
                            <td>收银</td>
                            <td>2016-01-01</td>
                            <td>--</td>
                            <td class="text-success">正常</td>
                            <td>
                                <a class="btn btn-primary" href="/settings/getUsersView?userId=2">
                                    <span class="glyphicon glyphicon-share-alt"></span>  查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>00032</td>
                            <td>xiaoan.li@wanwei.com</td>
                            <td>李晓丹</td>
                            <td>收银</td>
                            <td>2016-01-01</td>
                            <td>2016-10-13</td>
                            <td class="text-danger">锁定</td>
                            <td>
                                <a class="btn btn-primary" href="/settings/getUsersView?userId=3">
                                    <span class="glyphicon glyphicon-share-alt"></span>  查看
                                </a>
                            </td>
                        </tr>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td><label><input type="checkbox" name="user_status" value="${loop.index}"></label></td>
                                <td>${loop.index}</td>
                                <td><a href="/settings/systemUsers/${user.user_id}">${user.user_name}</a></td>
                                <td>${user.user_account}</td>
                                <td>${user.user_department}</td>
                                <td>${user.user_role}</td>
                                <td>2016-01-01</td>
                                <td>2016-12-31</td>
                                <td>2016-08-21 12:23:25</td>
                                {% if user.user_status == 1 %}
                                <td class="text-success">正常</td>
                                {% else %}
                                <td class="text-danger">锁定</td>
                                {% endif %}
                                <td>2016-08-21 12:23:25</td>
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="user"/>
</c:import>
