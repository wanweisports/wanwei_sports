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
                                    <img src="/Content/images/training/courses/timg1.jpg" style="width:100%">
                                </div>
                                <div class="formBannerTitle formBannerTitle310" style="height: 2rem;">
                                    <div class="titleLeft titleLeft310"></div>
                                    <div class="titleCenter titleCenter310">
                                        <div class="titleText titleText310">
                                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                                            <div class="textContent">万维培训</div>
                                        </div>
                                        <div class="formBannerMore formBannerMore310"></div>
                                    </div>
                                    <div class="titleRight titleRight310"></div>
                                </div>
                                <div class="richContent richContent3 richContent310">
                                    <p>我们学校是当地地区最权威的教育平台之一。学校创办于二零零五年，以丰富的教育资源背景为强大的依托，以“一切为了求知者”为经营理念致力于为广大的求知者提供全面的、权威的。</p>
                                    <p>我们学校是当地地区最权威的教育平台之一。学校创办于二零零五年，以丰富的教育资源背景为强大的依托，以“一切为了求知者”为经营理念致力于为广大的求知者提供全面的、权威的。</p>
                                    <p>我们学校是当地地区最权威的教育平台之一。学校创办于二零零五年，以丰富的教育资源背景为强大的依托，以“一切为了求知者”为经营理念致力于为广大的求知者提供全面的、权威的。</p>
                                    <p>我们学校是当地地区最权威的教育平台之一。学校创办于二零零五年，以丰富的教育资源背景为强大的依托，以“一切为了求知者”为经营理念致力于为广大的求知者提供全面的、权威的。</p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight310"></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="关于我们"/>
</c:import>
