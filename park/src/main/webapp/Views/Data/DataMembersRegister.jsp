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
    <script src="/Content/app/data/data_members_register.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>数据统计</span> &gt;&gt; <span>会员办理统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">会员办理统计</div>
            <div class="panel-body">
                <form id="data_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;" name="countNum">
                            <option value="1" <c:if test='${countNum==1}'>selected</c:if>>今日数据</option>
                            <option value="2" <c:if test='${countNum==2}'>selected</c:if>>昨日数据</option>
                            <option value="3" <c:if test='${countNum==3}'>selected</c:if>>本周数据</option>
                            <option value="4" <c:if test='${countNum==4}'>selected</c:if>>本月数据</option>
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
                            <th>编号</th>
                            <th>会员类型</th>
                            <th>单价(元)</th>
                            <th>销售数量(个)</th>
                            <th>销售金额(元)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${data.list}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${member.cardTypeName}</td>
                                <td>${member.cardTypeMoney}</td>
                                <td>${member.count}</td>
                                <td>${member.countMoney}</td>
                            </tr>
                        </c:forEach>
                        <!-- <tr>
                            <td>1</td>
                            <td>金卡会员</td>
                            <td>1000.00</td>
                            <td>12</td>
                            <td>12000.00</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>银卡会员</td>
                            <td>100.00</td>
                            <td>23</td>
                            <td>2300.00</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>普通卡会员</td>
                            <td>10.00</td>
                            <td>134</td>
                            <td>1340.00</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>临时卡会员</td>
                            <td>0.00</td>
                            <td>210</td>
                            <td>0.00</td>
                        </tr> -->
                        <tr class="info">
                            <th></th>
                            <th></th>
                            <th>合计</th>
                            <th>${data.sumCount}</th>
                            <th>${data.sumCountMoney}</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="register"/>
</c:import>
