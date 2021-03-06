<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/common/style.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/data/data_venue_percentage.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".venue-date.btn-success").addClass("btn-default").removeClass("btn-success");
            $(".venue-date[data-count='${countNum}']").addClass("btn-success").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">场地使用率</div>
            <div class="panel-body">
                <form class="form-inline" id="data_form" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/data/getVenuePercentage?countNum=10" data-count="10" class="btn btn-default venue-date">昨日</a>
                            <a href="/data/getVenuePercentage?countNum=20" data-count="20" class="btn btn-default venue-date">上周</a>
                            <a href="/data/getVenuePercentage?countNum=21" data-count="21" class="btn btn-default venue-date">本周</a>
                            <a href="/data/getVenuePercentage?countNum=30" data-count="30" class="btn btn-default venue-date">上月</a>
                            <a href="/data/getVenuePercentage?countNum=40" data-count="40" class="btn btn-default venue-date">去年</a>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart" placeholder="开始日期"
                               value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd" placeholder="结束日期"
                               value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="countNum" value="${countNum}" />
                        <a href="javascript:;" class="btn btn-success data-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索
                        </a>
                    </div>--%>
                    <div class="pull-right">
                        <a href="javascript:;" class="btn btn-danger" onclick="window.open('/data/exportVenuePercentage?'+$('#data_form').serialize());">
                            <span class="glyphicon glyphicon-export"></span> 导出
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">场地使用率:</li>
                <c:forEach var="item" items="${sumCountList}">
                    <li style="margin-right: 15px;">${item.sportName}
                        <span class="badge">${item.sumCount}时</span>
                        <span class="badge">${item.sumUsePercentage}%</span></li>
                </c:forEach>
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-success" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
            </div>
        </div>
        <c:forEach var="c" items="${sports}">
            <div class="panel panel-default">
            <div class="panel-heading">${c.sportName}场地</div>
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>统计项</th>
                            <c:forEach var="s" items="${c.sites}">
                                <th>${s.siteName}</th>
                            </c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>总场次</td>
                                <c:forEach var="s" items="${c.sites}">
                                    <th>${c.sumSiteCount}时</th>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td>预订场次</td>
                                <c:forEach var="s" items="${c.sites}">
                                    <th>${s.ydCount}时(${s.ydPercentage}%)</th>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td>使用场次</td>
                                <c:forEach var="s" items="${c.sites}">
                                    <th>${s.useCount}时(${s.usePercentage}%)</th>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地使用率"/>
</c:import>
