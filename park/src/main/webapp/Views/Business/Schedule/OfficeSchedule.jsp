<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/mobile/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-grids">
            <a href="javascript:;" class="weui-grid">
                <p class="weui-grid__label">上午</p>
                <p class="weui-grid__label">张老师</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <p class="weui-grid__label">下午</p>
                <p class="weui-grid__label">张老师</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <p class="weui-grid__label">晚上</p>
                <p class="weui-grid__label">张老师</p>
            </a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="值班安排"/>
</c:import>
