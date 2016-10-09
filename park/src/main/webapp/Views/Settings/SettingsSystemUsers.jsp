<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">用户设置</li>
        </ol>
        <div class="settings-filter">
            <form class="form-inline">
                <div class="form-group">
                    <select class="form-control" id="user_role" name="user_role">
                        <option value="">所有角色</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" id="user_part" name="user_department">
                        <option value="">所有部门</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" id="user_state" name="user_state">
                        <option value="">所有状态</option>
                    </select>
                </div>
                <div class="form-group">
                    <a href="javascript:;" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span> 检索用户
                    </a>
                </div>
                <div class="form-group">
                    <a href="javascript:;" class="btn btn-primary">
                        <span class="glyphicon glyphicon-flash"></span> 激活用户
                    </a>
                    <a href="javascript:;" class="btn btn-warning">
                        <span class="glyphicon glyphicon-lock"></span> 锁定用户
                    </a>
                </div>
                <div class="form-group pull-right">
                    <a href="/settings/systemUsersAdd" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> 添加用户
                    </a>
                </div>
            </form>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr class="">
                        <th><label><input type="checkbox" name="user_status" value="0"></label></th>
                        <th>#</th>
                        <th>姓名</th>
                        <th>账号</th>
                        <th>所属部门</th>
                        <th>所属角色</th>
                        <th>生效日期</th>
                        <th>截止日期</th>
                        <th>最近登录时间</th>
                        <th>状态</th>
                        <th>创建时间</th>
                    </tr>
                    </thead>
                    <tbody>
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
                <nav class="pull-right">
                    <p class="pull-left" style="margin: 24px 14px;">
                        <span>${pageSize }条/页</span>
                        <span>总${count}条</span>
                    </p>
                    <ul class="pagination pull-right">
                        <c:if test="${isFirstPage}">
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
                        <c:if test="${!isFirstPage}">
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
                        <c:if test="${isLastPage}">
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
                        <c:if test="${!isLastPage}">
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

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
