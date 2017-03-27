<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/business/passport/passport_login.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module8" class="form Handle  formStyle12 ">
                <div class="formMiddle formMiddle8">
                    <div class="middleLeft middleLeft8"></div>
                    <div class="middleCenter middleCenter8">
                        <div class="formMiddleContent formMiddleContent8 moduleContent">
                            <div id="mLogin">
                                <div class="loginContent">
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="user" class="itemEdit g_input mustItem"
                                               placeholder="请输入账号或手机号">
                                        <span class="icon-userIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="password" maxlength="20" id="password"
                                               class="itemEdit g_input mustItem" placeholder="请输入密码">
                                        <span class="icon-pswIcon g_mainColor"></span>
                                    </div>
                                    <div class="loginCaptchaCtrl g_globalLine">
                                        <input id="loginCaptcha" type="text" class="captchaText g_input" maxlength="4"
                                               placeholder="请输入验证码">
                                        <img id="loginCaptchaImg" class="captchaImg"
                                             src="/Content/images/training/student/captcha.jpg">
                                    </div>
                                    <div class="g_globalLine" style="margin: .4rem 0 1rem; text-align: left; overflow: hidden;">
                                        <a class="g_mainColor" href="/training/mobile/v1/pp/smsLogin" style="float: left;">手机号快捷登录</a>
                                        <a class="g_mainColor" href="/training/mobile/v1/pp/forget" style="float: right;">忘记密码？</a>
                                    </div>
                                    <div class="g_globalLine" style="clear: both">
                                        <input type="button" class="g_button sendIcon login-btn" value="登 录">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight8"></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Custom/Layout.jsp">
    <c:param name="title" value="万为场馆"/>
    <c:param name="footer" value="true"/>
</c:import>
