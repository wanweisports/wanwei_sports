<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/mobile/passport/passport_register.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/mobile/passport/passport_register.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-flex reg-logo">
            <div class="weui-flex__item">
                <div class="placeholder">
                    <img src="Content/images/new/logo.png?v=${static_resource_version}" alt="LOGO">
                </div>
            </div>
        </div>
        <div class="weui-flex reg-form">
            <div class="weui-flex__item">
                <form id="register_form" novalidate onsubmit="return false;">
                    <div class="weui-cells weui-cells_form">
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><label class="weui-label">手机号</label></div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="number" placeholder="请输入手机号" id="mobile"
                                       name="mobile" autocomplete="off">
                            </div>
                            <div class="weui-cell__ft">
                                <i class="weui-icon-warn"></i>
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="password" placeholder="请输入6~32位字符的密码"
                                       id="password" name="password" autocomplete="off">
                            </div>
                            <div class="weui-cell__ft">
                                <i class="weui-icon-warn"></i>
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="password" placeholder="请输入确认密码" id="confirm"
                                       name="confirm" autocomplete="off">
                            </div>
                            <div class="weui-cell__ft">
                                <i class="weui-icon-warn"></i>
                            </div>
                        </div>
                    </div>

                    <div class="weui-btn-area">
                        <a class="weui-btn weui-btn_primary reg-btn" href="/mobile/passport/profile">立即注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="万为体育"/>
</c:import>
