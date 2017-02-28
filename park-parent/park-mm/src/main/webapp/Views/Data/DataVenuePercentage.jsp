<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/data/data_venue_percentage.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".venue-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".venue-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>数据统计</span> &gt;&gt; <span>场地使用率</span>
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
                    <div class="form-group">
                        <select class="form-control" name="sportName">
                            <option>场地类型</option>
                            <option>羽毛球</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart" placeholder="开始日期"
                               value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd" placeholder="结束日期"
                               value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary data-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">场地使用率总计:</li>
                <c:forEach var="item" items="${sportCountList}">
                    <li style="margin-right: 15px;">${item.sportName}
                        <span class="badge">1000时</span>
                        <span class="badge">${item.siteUsePercentage * 100}%</span></li>
                </c:forEach>
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger" onclick="window.open('/data/exportVenuePercentage?'+$('#data_form').serialize());">
                    <span class="glyphicon glyphicon-export"></span> 导出数据
                </a>
                <a href="javascript:;" class="btn btn-primary" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">羽毛球场地</div>
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>统计项</th>
                            <th>场地1</th>
                            <th>场地2</th>
                            <th>场地3</th>
                            <th>场地4</th>
                            <th>场地5</th>
                            <th>场地6</th>
                            <th>场地7</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>总场次</td>
                                <td>98时</td>
                                <td>98时</td>
                                <td>98时</td>
                                <td>98时</td>
                                <td>98时</td>
                                <td>98时</td>
                                <td>98时</td>
                            </tr>
                            <tr>
                                <td>预订场次</td>
                                <td>18时(18.36%)</td>
                                <td>18时(18.36%)</td>
                                <td>18时(18.36%)</td>
                                <td>18时(18.36%)</td>
                                <td>18时(18.36%)</td>
                                <td>18时(18.36%)</td>
                                <td>18时(18.36%)</td>
                            </tr>
                            <tr>
                                <td>使用场次</td>
                                <td>18时(100%)</td>
                                <td>18时(100%)</td>
                                <td>18时(100%)</td>
                                <td>18时(100%)</td>
                                <td>18时(100%)</td>
                                <td>18时(100%)</td>
                                <td>18时(100%)</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">篮球场地</div>
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>统计项</th>
                            <th>场地1</th>
                            <th>场地2</th>
                            <th>场地3</th>
                            <th>场地4</th>
                            <th>场地5</th>
                            <th>场地6</th>
                            <th>场地7</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>总场次</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                        </tr>
                        <tr>
                            <td>预订场次</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                        </tr>
                        <tr>
                            <td>使用场次</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">乒乓球场地</div>
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>统计项</th>
                            <th>场地1</th>
                            <th>场地2</th>
                            <th>场地3</th>
                            <th>场地4</th>
                            <th>场地5</th>
                            <th>场地6</th>
                            <th>场地7</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>总场次</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                            <td>98时</td>
                        </tr>
                        <tr>
                            <td>预订场次</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                            <td>18时(18.36%)</td>
                        </tr>
                        <tr>
                            <td>使用场次</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                            <td>18时(100%)</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="percent"/>
</c:import>
