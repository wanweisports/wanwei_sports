<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/mobile/passport/passport_login.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/mobile/passport/passport_login.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-flex">
            <div class="weui-flex__item">
                <div class="placeholder">
                    <img src="/Content/images/new/logo.png?v=${static_resource_version}" alt="LOGO">
                </div>
            </div>
        </div>
        <div class="weui-flex">
            <div class="weui-flex__item">
                <form id="login_form" novalidate onsubmit="return false;">
                    <div class="weui-cells weui-cells_form">
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="text" placeholder="手机号码" name="mobile"
                                       autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="password" placeholder="密码" name="pwd"
                                       autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="password" placeholder="确认密码" name="pwd"
                                       autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell weui-cell_vcode">
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="number" placeholder="验证码">
                            </div>
                            <div class="weui-cell__ft">
                                <img class="weui-vcode-img" src="/Content/images/mobile/vcode.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="weui-btn-area">
                        <a class="weui-btn weui-btn_primary" href="/mobile/passport/profile">立即注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="万为体育"/>
</c:import>
