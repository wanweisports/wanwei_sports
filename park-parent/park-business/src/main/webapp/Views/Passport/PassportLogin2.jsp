<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/passport/passport_login.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="login"></div>
    <div class="login_bg">
        <div id="logo">
            <img src="Content/images/new1/logo.png?v=${static_resource_version}" alt="">
        </div>
        <form id="login_form" novalidate onsubmit="return false;">
            <div class="userName">
                <lable>用户名：</lable>
                <input type="text" name="name" placeholder="请输入用户名" autocomplete="off">
            </div>
            <div class="passWord">
                <lable>密&nbsp;&nbsp;&nbsp;码：</lable>
                <input type="password" name="pwd" placeholder="请输入密码" autocomplete="off">
            </div>
            <div class="choose_box">
                <div>
                    <input type="checkbox" checked="checked" name="checkbox">
                    <lable>记住密码</lable>
                </div>
                <a href="#">忘记密码</a>
            </div>
            <button class="login_btn login-btn">登&nbsp;&nbsp;录</button>
        </form>
        <div class="other_login">
            <div class="other"></div>
            <span>其他方式登录</span>
            <div class="other"></div>
        </div>
        <div class="other_choose">
            <a href="http://www.17sucai.com/preview/622817/2016-12-15/app_demo/login.html">
                <img src="Content/images/new1/qq.png?v=${static_resource_version}" alt="">
            </a>
            <a href="http://www.17sucai.com/preview/622817/2016-12-15/app_demo/login.html">
                <img src="Content/images/new1/wx.png?v=${static_resource_version}" alt="">
            </a>
            <a href="http://www.17sucai.com/preview/622817/2016-12-15/app_demo/login.html">
                <img src="Content/images/new1/wb.png?v=${static_resource_version}" alt="">
            </a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout3.jsp">
    <c:param name="title" value="万为场馆"/>
</c:import>
