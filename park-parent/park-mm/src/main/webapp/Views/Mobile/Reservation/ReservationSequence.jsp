<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/mobile/reservation/reservation_sequence.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/mobile/reservation/reservation_sequence.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <form class="weui-cells weui-cells_form" id="form">
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label class="weui-label">场地类型</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="sportId">
                        <c:forEach var="sport" items="${siteSports}">
                            <option <c:if test='${sport.sportId==sportId}'>selected</c:if> value="${sport.sportId}">${sport.sportName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">预订日期</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="date" placeholder="预订日期" value="${siteDate}" name="siteDate">
                </div>
            </div>
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">开始时间</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="startTime">
                        <c:forEach var="time" items="${timePeriod}">
                            <option <c:if test='${time.startTime==startTime}'>selected</c:if> value="${time.startTime}">${time.startTime}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">结束时间</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="endTime">
                        <c:forEach var="time" items="${timePeriod}">
                            <option <c:if test='${time.endTime==endTime}'>selected</c:if> value="${time.endTime}">${time.endTime}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </form>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_warn" href="javascript:" onclick="window.location.href='/mobile/reservation/quick?'+$('#form').serialize()">确定</a>
        </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_warn" href="javascript:" id="showIOSActionSheet">查看选择结果</a>
        </div>
        <div class="weui-grids">
            <c:forEach var="site" items="${sites}">
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="Content/images/mobile/stadium.png?v=${static_resource_version}">
                    </div>
                    <p class="weui-grid__label">${site.siteName}-${site.sportName}</p>
                </a>
            </c:forEach>
        </div>
    </div>

    <div>
        <div class="weui-mask" style="display: none;" id="iosMask"></div>
        <div class="weui-actionsheet" id="iosActionsheet">
            <div class="weui-actionsheet__btns">
                <div class="weui-actionsheet__btn">
                    <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_warn">删 除</a>
                </div>
                <div class="weui-actionsheet__btn">
                    <a href="<%=basePath%>mobile/reservation/confirm"
                       class="weui-btn weui-btn_mini weui-btn_primary float-right">支 付</a>
                </div>
            </div>
            <div class="weui-actionsheet__menu">
                <div class="weui-cells weui-cells_checkbox">
                    <label class=" weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s11" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>场地1</p>
                        </div>
                        <div class="weui-cell__ft">11:00-12:00</div>
                    </label>
                    <label class=" weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s11" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>场地1</p>
                        </div>
                        <div class="weui-cell__ft">11:00-12:00</div>
                    </label>
                </div>
            </div>
            <div class="weui-actionsheet__action">
                <div class="weui-actionsheet__cell" id="iosActionsheetCancel">继续选择</div>
            </div>
        </div>
    </div>

</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地预订"/>
</c:import>
