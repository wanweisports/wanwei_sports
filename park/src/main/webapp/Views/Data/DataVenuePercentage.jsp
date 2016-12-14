<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
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
                <form class="form-inline" id="data_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/data/getVenuePercentage?countNum=10" data-count="10" class="btn btn-primary member-date">全部</a>
                            <a href="/data/getVenuePercentage?countNum=1" data-count="1" class="btn btn-default member-date">今日</a>
                            <a href="/data/getVenuePercentage?countNum=3" data-count="3" class="btn btn-default member-date">本周</a>
                            <a href="/data/getVenuePercentage?countNum=4" data-count="4" class="btn btn-default member-date">本月</a>
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
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">场地预订率总计:</li>
                <c:forEach var="item" items="${sportCountList}">
                    <li style="margin-right: 15px;">${item.sportName} <span class="badge">${item.percentage * 100}%</span></li>
                </c:forEach>
                <li style="margin-right: 15px;">场地使用率总计:</li>
                <c:forEach var="item" items="${sportCountList}">
                    <li style="margin-right: 15px;">${item.sportName} <span class="badge">${item.percentage * 100}%</span></li>
                </c:forEach>
                <!--<li style="margin-right: 15px;">全部类型 <span class="badge">30%</span></li>
                <li style="margin-right: 15px;">羽毛球 <span class="badge">20%</span></li>
                <li style="margin-right: 15px;">篮球 <span class="badge">42%</span></li>-->
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger">
                    <span class="glyphicon glyphicon-export"></span> 导出数据
                </a>
                <a href="javascript:;" class="btn btn-primary" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>场地类型</th>
                            <th>场地编号</th>
                            <th>总场次数</th>
                            <th>使用场次数</th>
                            <th>使用率</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="data" items="${pageBean.list}">
                            <tr>
                                <td>${data.sportName}</td>
                                <td>${data.siteName}</td>
                                <td>${data.useCount}次</td>
                                <td>${data.sumCount}次</td>
                                <td>${data.percentage * 100}%</td>
                            </tr>
                        </c:forEach>
                        <!--<tr>
                            <td>羽毛球</td>
                            <td>场地1</td>
                            <td>42</td>
                            <td>21</td>
                            <td>50%</td>
                        </tr>-->
                        </tbody>
                    </table>
                    <nav class="pull-right" <c:if test="${pageBean.count <= pageBean.pageSize}">style="display: none;"</c:if> >
                        <p class="pull-left" style="margin: 12px 14px;">
                            <span>${pageBean.pageSize}条/页</span>
                            <span>总${pageBean.count}条</span>
                        </p>
                        <ul class="pagination pull-right">
                            <c:if test="${pageBean.currentPage == 1}">
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
                            <c:if test="${pageBean.currentPage != 1}">
                                <li>
                                    <a class="page-first" href="javascript:;" data-index="1">
                                        <span>首页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-prev" href="javascript:;" data-index="${pageBean.currentPage - 1}">
                                        <span>上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${pageBean.lastPage}">
                                <c:if test="${i == pageBean.currentPage}">
                                    <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                                <c:if test="${i != pageBean.currentPage}">
                                    <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageBean.currentPage == pageBean.lastPage}">
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
                            <c:if test="${pageBean.currentPage != pageBean.lastPage}">
                                <li>
                                    <a class="page-next" href="javascript:;" data-index="${pageBean.currentPage + 1}">
                                        <span>下一页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-last" href="javascript:;" data-index="${pageBean.lastPage}">
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
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="percent"/>
</c:import>
