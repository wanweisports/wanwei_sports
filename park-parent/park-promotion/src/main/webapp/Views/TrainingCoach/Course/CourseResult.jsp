<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webContainerBox" class="webContainerBox moveAnimation">
    <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
        <div id="module310" class="form Handle  formStyle2 ">
            <div class="formMiddle formMiddle310">
                <div class="middleLeft middleLeft310"></div>
                <div class="middleCenter middleCenter310">
                    <div class="formMiddleContent formMiddleContent310 moduleContent">
                        <div class="J_richContentPanel310 f-contentPanel">
                            <div class="textImg3">
                                <img src="/Content/images/training/banners/banner4.jpg?v=${static_resource_version}" style="width:100%">
                            </div>
                            <div class="richContent richContent3 richContent310">
                                <p style="text-align: center;text-indent: 0">您已经成功预约某某课程！稍后课程责任老师会电话与您沟通，以便更好地指导您；祝您上课愉快！</p>
                                <p style="text-align: center;text-indent: 0"><span style="color: #f00; margin-right: .4rem">5</span>秒后会自动跳转会员中心，或者直接点击返回首页</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="middleRight middleRight310"></div>
            </div>
        </div>
        <div class="">
            <a class="g_button sendIcon" href="/training/coach/v1/home/index">返回首页</a>
        </div>
        <div id="module308" class="form Handle  formStyle41">
            <div class="formBannerTitle formBannerTitle308" style="height: 2rem;">
                <div class="titleLeft titleLeft308"></div>
                <div class="titleCenter titleCenter308">
                    <div class="titleText titleText308">
                        <div class="titleTextIcon icon-titleText">&nbsp;</div>
                        <div class="textContent">更多推荐</div>
                    </div>
                    <div class="formBannerMore formBannerMore308"></div>
                </div>
                <div class="titleRight titleRight308"></div>
            </div>
            <div class="formMiddle formMiddle308">
                <div class="middleLeft middleLeft308"></div>
                <div class="middleCenter middleCenter308">
                    <div class="formMiddleContent formMiddleContent308 moduleContent">
                        <div class="photoModule styleForm1">
                            <div class="g_background photoDiv photoBg">
                                <a href="/training/coach/v1/course/detail?courseId=121">
                                    <div class="imgClass_160">
                                        <img class="photoListImg" src="/Content/images/training/banners/banner4.jpg?v=${static_resource_version}">
                                    </div>
                                </a>
                            </div>
                            <div class="g_background photoDiv photoBg">
                                <a href="/training/coach/v1/course/detail?courseId=121">
                                    <div class="imgClass_160">
                                        <img class="photoListImg" src="/Content/images/training/banners/banner5.jpg?v=${static_resource_version}">
                                    </div>
                                </a>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </div>
                <div class="middleRight middleRight308"></div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="报名反馈"/>
</c:import>
