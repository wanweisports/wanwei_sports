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
    <div class="weui-flex">
        <div class="weui-flex__item">
            <div>场地总收入(元)</div>
            <div class="placeholder">2200.00</div>
        </div>
        <div class="weui-flex">
            <div class="weui-flex__item">
                <div>场地租赁(元)</div>
                <div class="placeholder">1000.00</div>
            </div>
            <div class="weui-flex__item">
                <div>商品销售(元)</div>
                <div class="placeholder">100.00</div>
            </div>
        </div>
        <div class="weui-flex">
            <div class="weui-flex__item">
                <div>会员储值(元)</div>
                <div class="placeholder">1100.00</div>
            </div>
            <div class="weui-flex__item">
                <div>其他收入(元)</div>
                <div class="placeholder">0.00</div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地收支"/>
</c:import>
