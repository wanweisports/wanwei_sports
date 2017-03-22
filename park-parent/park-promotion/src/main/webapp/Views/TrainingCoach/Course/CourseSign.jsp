<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <style type="text/css">
        .captchaImg {
            width: 4.5rem;
            height: 1.5rem;
            position: absolute;
            right: .4rem;
            z-index: 2;
        }

        .g_button.captchaImg {
            background: #fff;
            border: 1px solid #2FAEF6;
            height: 1.5rem;
            margin: 0;
            color: #2FAEF6;
            font-size: .7rem;
            line-height: 1;
        }
    </style>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module8" class="form Handle  formStyle12 ">
                <div class="formMiddle formMiddle8">
                    <div class="middleLeft middleLeft8"></div>
                    <div class="middleCenter middleCenter8">
                        <div class="textImg3">
                            <img src="/Content/images/training/banners/banner4.jpg?v=${static_resource_version}" style="width:100%">
                        </div>
                        <div class="formMiddleContent formMiddleContent8 moduleContent">
                            <div id="mLogin">
                                <div class="loginContent">
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="20" id="name"
                                               class="itemEdit g_input mustItem" placeholder="请输入姓名">
                                        <span class="icon-userIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="user" class="itemEdit g_input mustItem"
                                               placeholder="请输入手机号">
                                        <span class="icon-phoneIcon g_mainColor"></span>
                                    </div>
                                    <div class="loginCaptchaCtrl g_globalLine">
                                        <input id="loginCaptcha" type="text" class="captchaText g_input" maxlength="4"
                                               placeholder="请输入验证码">
                                        <img id="loginCaptchaImg" class="captchaImg"
                                             src="/Content/images/training/student/captcha.jpg">
                                    </div>
                                    <div class="loginCaptchaCtrl g_globalLine">
                                        <input id="loginSmsCaptcha" type="text" class="captchaText g_input" maxlength="4"
                                               placeholder="请输入验证码">
                                        <input type="button" class="g_button captchaImg" value="获取验证码">
                                    </div>
                                    <div class="loginProtocol g_globalLine" style="margin: .4rem 0 1rem; text-align: left;">
                                        <p style="color: #888">阅读并同意《<a class="g_mainColor" href="/training/coach/v1/course/protocol">万为培训用户报名协议</a>》</p>
                                    </div>
                                    <div class="g_globalLine">
                                        <a class="g_button sendIcon" href="/training/coach/v1/course/result" style="color: #fff">立即报名</a>
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

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="课程报名"/>
</c:import>
