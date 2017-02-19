<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/business/dashboard/dashboard.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
<div id="main" class="container">
    <div class="weui-flex">
        <div class="weui-flex__item">
            <div class="placeholder">
                <img src="/Content/images/new/logo.png?v=${static_resource_version}" alt="场地预订">
            </div>
        </div>
    </div>
    <div class="weui-flex">
        <div class="weui-grids">
            <a href="/business/data/income?countNum=21" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/coins.png?v=${static_resource_version}" alt="营业数据">
                </div>
                <p class="weui-grid__label">营业数据</p>
            </a>
            <a href="/business/data/venuePercentage?countNum=21" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/chart.png?v=${static_resource_version}" alt="场地数据">
                </div>
                <p class="weui-grid__label">场地数据</p>
            </a>
            <a href="/business/oa/getNotifications?type=2" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/email.png?v=${static_resource_version}" alt="消息通知">
                </div>
                <p class="weui-grid__label">消息通知</p>
            </a>
            <a href="/business/office/schedule?countNum=21" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/calendar.png?v=${static_resource_version}" alt="值班安排">
                </div>
                <p class="weui-grid__label">值班安排</p>
            </a>
            <a href="/business/training/list" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/classroom.png?v=${static_resource_version}" alt="培训报名">
                </div>
                <p class="weui-grid__label">培训管理</p>
            </a>
            <a href="/business/passport/profile" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/user.png?v=${static_resource_version}" alt="完善信息">
                </div>
                <p class="weui-grid__label">完善信息</p>
            </a>
            <a href="/business/passport/modifyPassword" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/key.png?v=${static_resource_version}" alt="重置密码">
                </div>
                <p class="weui-grid__label">重置密码</p>
            </a>
            <a href="/business/oa/getMessage?type=3" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/message.png?v=${static_resource_version}" alt="我的消息">
                </div>
                <p class="weui-grid__label">我的消息</p>
            </a>
            <a href="/business/passport/logout" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/Content/images/mobile/logout.png?v=${static_resource_version}" alt="退出登录">
                </div>
                <p class="weui-grid__label">退出登录</p>
            </a>
        </div>
    </div>
</div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="万为体育"/>
</c:import>
