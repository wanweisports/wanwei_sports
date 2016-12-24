<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/business/schedule/office_schedule.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/business/schedule/office_schedule.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <c:forEach var="data" items="${schedules}">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>${data.week}（${data.date}）</p>
                    </div>
                </div>
            </div>
            <div class="weui-cells">
                <c:forEach var="schedule" items="${data.schedule}">
                <a class="weui-cell weui-cell_access schedule-job" href="javascript:;" data-id="${schedule.schedulingId}"
                   data-job="${schedule.schedulingJob}">
                    <div class="weui-cell__bd">
                        <p>${schedule.operatorName}</p>
                    </div>
                    <div class="weui-cell__ft">${schedule.startTime} - ${schedule.endTime}</div>
                </a>
                </c:forEach>
            </div>
        </c:forEach>
    </div>

    <div id="tips_alert" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__hd"><strong class="weui-dialog__title">工作内容</strong></div>
            <div class="weui-dialog__bd tips-content"></div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary tips-ok">我知道了</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="值班安排"/>
</c:import>
