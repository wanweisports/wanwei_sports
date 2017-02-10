<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/mobile/reservation/reservation_sequence.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label class="weui-label">场地类型</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <c:forEach var="sport" items="${siteSports}">
                            <option value="${sport.sportId}">${sport.sportName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">预订日期</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="date" placeholder="预订日期" value="${curDate}">
                </div>
            </div>
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">开始时间</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <c:forEach var="time" items="${timePeriod}">
                            <option value="${time.startTime}">${time.startTime}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">结束时间</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <c:forEach var="time" items="${timePeriod}">
                            <option value="${time.endTime}">${time.endTime}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:">筛选场地</a>
        </div>
        <div class="weui-grids">
            <c:forEach var="site" items="${sites}">
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/Content/images/mobile/stadium.png?v=${static_resource_version}">
                    </div>
                    <p class="weui-grid__label">${site.siteName}</p>
                </a>
            </c:forEach>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地预订"/>
</c:import>
