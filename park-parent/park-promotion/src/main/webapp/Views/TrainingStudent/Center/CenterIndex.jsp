<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module311" class="form Handle formStyle6">
                <div class="textImg3" style="height: 7rem; background: #0657a9;">
                    <div class="textImg3" style="height: 7rem; background: #0657a9;">
                        <div style="float: left; width: 4rem; height: 4rem; margin-top: 1.5rem; margin-left: .5rem; border-radius: 2.5rem; background: #FAFAFA;">
                            <img src="/Content/images/training/female.png"
                                 style="width: 3rem; height: 3rem; margin-top: .5rem; margin-left: .14rem;">
                        </div>
                        <div style="display: block; float: left; margin-top: 2.4rem; margin-left: .8rem; color: #FAFAFA;">
                            <p style="margin-bottom: .6rem; font-size: .8rem;">张教练</p>
                            <p>110****1234</p>
                        </div>
                        <div style="display: block; float: right; margin-top: 2.7rem; margin-right: .6rem">
                            <a href="/training/mobile/v1/center/profile">
                                <img src="/Content/images/training/settings.png" style="width: 1.6rem;">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="formBannerTitle formBannerTitle311" style="height: 2rem;">
                    <div class="titleLeft titleLeft311"></div>
                    <div class="titleCenter titleCenter311">
                        <div class="titleText titleText311">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">个人中心</div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
                <div class="formMiddle formMiddle311">
                    <div class="middleLeft middleLeft311"></div>
                    <div class="middleCenter middleCenter311">
                        <div class="formMiddleContent formMiddleContent311 moduleContent">
                            <div class="newsList" id="newsList311">
                                <div id="newsLine8" class="newsLine line icon-gline  wWLine  firstClass  wholeLine J_lineH j-lineH">
                                    <div id="lineBody8" class="lineBody lineBodyTable">
                                        <div class="linkTableCell">
                                            <div class="linkTable">
                                                <a href="/training/mobile/v1/center/course/list">已预约课程</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel"></div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div id="newsLine7" class="newsLine line icon-gline  wWLine  firstClass  wholeLine J_lineH j-lineH">
                                    <div id="lineBody7" class="lineBody lineBodyTable">
                                        <div class="linkTableCell">
                                            <div class="linkTable">
                                                <a href="/training/mobile/v1/center/sign/weekLog">上课记录</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel"></div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div id="newsLine6" class="newsLine line icon-gline  wWLine  firstClass  wholeLine J_lineH j-lineH">
                                    <div id="lineBody6" class="lineBody lineBodyTable">
                                        <div class="linkTableCell">
                                            <div class="linkTable">
                                                <a href="/training/mobile/v1/center/about">关于万维培训</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel"></div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div id="newsLine5" class="newsLine line icon-gline  wWLine  firstClass  wholeLine J_lineH j-lineH">
                                    <div id="lineBody5" class="lineBody lineBodyTable">
                                        <div class="linkTableCell">
                                            <div class="linkTable">
                                                <a href="tel:400-998-9898">客服联系</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel"></div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight311"></div>
                </div>
            </div>
            <div class="">
                <a class="g_button sendIcon" href="/training/mobile/v1/pp/login">退出登录</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="个人中心"/>
    <c:param name="footer" value="true"/>
</c:import>

