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
    <script>
        $(".member-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
        $(".member-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
    </script>
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
                        <div class="btn-group">
                            <a href="/data/getMembersRegister?countNum=10" data-count="10" class="btn btn-primary member-date">全部</a>
                            <a href="/data/getMembersRegister?countNum=1" data-count="1" class="btn btn-default member-date">今日</a>
                            <a href="/data/getMembersRegister?countNum=2" data-count="2" class="btn btn-default member-date">昨日</a>
                            <a href="/data/getMembersRegister?countNum=3" data-count="3" class="btn btn-default member-date">本周</a>
                            <a href="/data/getMembersRegister?countNum=4" data-count="4" class="btn btn-default member-date">本月</a>
                        </div>
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
                            <span class="glyphicon glyphicon-danger"></span> 导出数据
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
                            <th>序号</th>
                            <th>会员类型</th>
                            <th>单价</th>
                            <th>销售数量</th>
                            <th>销售金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${data.list}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${member.cardTypeName}</td>
                                <td>${member.cardTypeMoney}元</td>
                                <td>${member.count}个</td>
                                <td>${member.countMoney}元</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th></th>
                            <th></th>
                            <th>合计</th>
                            <th>${data.sumCount}个</th>
                            <th>${data.sumCountMoney}元</th>
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
