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
    <script src="/Content/app/data/data_business_income.js?v=${static_resource_version}"></script>
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
                        <select class="form-control" style="width: 160px;">
                            <option value="0">今日数据</option>
                            <option value="1">昨日数据</option>
                            <option value="2">本周数据</option>
                            <option value="3">本月数据</option>
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
                    <div class="form-group pull-right">
                        <a href="javascript:;" class="btn btn-primary goods-filter">
                            <span class="glyphicon glyphicon-export"></span> 导出数据
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
                        <tr>
                            <th>项目</th>
                            <th>现金</th>
                            <th>POS机</th>
                            <th>支付宝</th>
                            <th>微信</th>
                            <th>支票</th>
                            <th>项目小计</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="card" items="${cardCounts.countList}">
                            <tr>
                                <td>${card.name}</td>
                                <td>${card.xianjin > 0 ? card.xianjin : "--"}</td>
                                <td>--</td>
                                <td>${card.zhifubao > 0 ? card.zhifubao : "--"}</td>
                                <td>${card.weixin > 0 ? card.weixin : "--"}</td>
                                <td>--</td>
                                <td>${card.sumPrice > 0 ? card.sumPrice : "--"}</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th>金额小计</th>
                            <th>${cardCounts.xianjinSumPrice}</th>
                            <th>--</th>
                            <th>${cardCounts.zhifubaoSumPrice}</th>
                            <th>${cardCounts.weixinSumPrice}</th>
                            <th>--</th>
                            <th>${cardCounts.sumPrice}</th>
                        </tr>
                        <c:forEach var="site" items="${siteCounts.countList}">
                            <tr>
                                <td>${site.name}</td>
                                <td>${site.xianjin > 0 ? site.xianjin : "--"}</td>
                                <td>--</td>
                                <td>${site.zhifubao > 0 ? site.zhifubao : "--"}</td>
                                <td>${site.weixin > 0 ? site.weixin : "--"}</td>
                                <td>--</td>
                                <td>${site.sumPrice > 0 ? site.sumPrice : "--"}</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th>金额小计</th>
                            <th>${siteCounts.xianjinSumPrice}</th>
                            <th>--</th>
                            <th>${siteCounts.zhifubaoSumPrice}</th>
                            <th>${siteCounts.weixinSumPrice}</th>
                            <th>--</th>
                            <th>${siteCounts.sumPrice}</th>
                        </tr>
                        <c:forEach var="good" items="${goodsCounts.countList}">
                            <tr>
                                <td>${good.name}</td>
                                <td>${good.xianjin > 0 ? good.xianjin : "--"}</td>
                                <td>--</td>
                                <td>${good.zhifubao > 0 ? good.zhifubao : "--"}</td>
                                <td>${good.weixin > 0 ? good.weixin : "--"}</td>
                                <td>--</td>
                                <td>${good.sumPrice > 0 ? good.sumPrice : "--"}</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th>金额小计</th>
                            <th>${goodsCounts.xianjinSumPrice}</th>
                            <th>--</th>
                            <th>${goodsCounts.zhifubaoSumPrice}</th>
                            <th>${goodsCounts.weixinSumPrice}</th>
                            <th>--</th>
                            <th>${goodsCounts.sumPrice}</th>
                        </tr>
                        <tr class="info">
                            <th>金额总计</th>
                            <th>--</th>
                            <th>--</th>
                            <th>--</th>
                            <th>--</th>
                            <th>--</th>
                            <th>--</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-body">
                    <div class="col-sm-6">值班经理签字: <span class="text-success">李洪旭</span></div>
                    <div class="col-sm-6">财务经理签字: <span class="text-success">李洪旭</span></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="business"/>
</c:import>
