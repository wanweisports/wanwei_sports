<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-cells__title">修改密码</div>
        <form class="weui-cells weui-cells_form" onsubmit="return false;" novalidate>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">原密码</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" placeholder="原密码">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">新密码</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" placeholder="新密码">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">确认密码</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" placeholder="确认密码">
                </div>
            </div>
        </form>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:;">确定修改</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="修改密码"/>
</c:import>
