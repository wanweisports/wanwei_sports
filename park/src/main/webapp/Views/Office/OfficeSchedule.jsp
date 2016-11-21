<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/settings/settings_notification.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>排班管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">排班表</div>
            <div class="panel-body">
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#settingsModal" data-backdrop="false">
                    <span class="glyphicon glyphicon-cog"></span> 设置值班段
                </button>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#addModal" data-backdrop="false">
                    <span class="glyphicon glyphicon-plus"></span> 添加值班老师
                </button>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>周一</th>
                            <th>周二</th>
                            <th>周三</th>
                            <th>周四</th>
                            <th>周五</th>
                            <th>周六</th>
                            <th>周日</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>上午</th>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                        </tr>
                        <tr>
                            <th>下午</th>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                        </tr>
                        <tr>
                            <th>晚上</th>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                            <td>张老师</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="schedule"/>
</c:import>
