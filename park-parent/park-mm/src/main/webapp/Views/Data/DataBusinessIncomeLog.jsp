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
    <script src="/Content/app/data/data_business_income_log.js?v=${static_resource_version}"></script>
    <script>
        $(".member-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
        $(".member-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>数据统计</span> &gt;&gt; <span>营业收支统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">营业收支统计</div>
            <div class="panel-body">
                <form id="data_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/data/getBusinessIncomeLog?countNum=1000" data-count="1000" class="btn btn-primary member-date">全部</a>
                            <a href="/data/getBusinessIncomeLog?countNum=11" data-count="11" class="btn btn-default member-date">今日</a>
                            <a href="/data/getBusinessIncomeLog?countNum=10" data-count="10" class="btn btn-default member-date">昨日</a>
                            <a href="/data/getBusinessIncomeLog?countNum=21" data-count="21" class="btn btn-default member-date">本周</a>
                            <a href="/data/getBusinessIncomeLog?countNum=31" data-count="31" class="btn btn-default member-date">本月</a>
                            <a href="/data/getBusinessIncomeLog?countNum=41" data-count="41" class="btn btn-default member-date">本年</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" name="balanceServiceType">
                            <option value="">订单类型</option>
                            <c:forEach var="map" items="${balanceServiceTypes}">
                            	<option value="${map.key}">${map.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"
                               placeholder="开始日期" value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd"
                               placeholder="结束日期" value="${createTimeEnd}">
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
                <li style="margin-right: 15px;">支付方式:</li>
                <c:forEach var="c" items="${balancesCount}">
                	<li style="margin-right: 15px;">${c.payStyle} <span class="badge">${c.realAmountSum}元</span></li>
                </c:forEach>
                
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger" onclick="window.open('/data/exportBusinessIncomeLog?'+$('#data_form').serialize());">
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
                        <tr class="bg-info">
                            <th>交易流水号</th>
                            <th>会员卡号</th>
                            <th>会员姓名</th>
                            <th>订单类型</th>
                            <th>支付方式</th>
                            <th>金额(元)</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="d" items="${list}">
                        	<tr>
	                            <td>${d.balanceNo}</td>
	                            <td>${d.cardNo}</td>
	                            <td>${d.memberName}</td>
	                            <td>${d.balanceServiceType}</td>
	                            <td>${d.payStyle}</td>
	                            <td>${d.realAmount}</td>
	                            <td>${d.operatorName}</td>
	                            <td>${d.createTime}</td>
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

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="businessLog"/>
</c:import>
