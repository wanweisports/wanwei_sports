<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webCustomerServiceBox" class="webCustomerServiceBox" style="display: block; opacity: 1;">
        <div id="webContainerBox" class="webContainerBox moveAnimation">
            <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
                <div id="module315" class="form Handle  formStyle28">
                    <div class="formBannerTitle formBannerTitle315" style="height: 2rem;">
                        <div class="titleLeft titleLeft315">
                        </div>
                        <div class="titleCenter titleCenter315">
                            <div class="titleText titleText315">
                                <div class="titleTextIcon icon-titleText">&nbsp;</div>
                                <div class="textContent">上周课程</div>
                            </div>
                            <div class="formBannerMore formBannerMore315"></div>
                        </div>
                        <div class="titleRight titleRight315"></div>
                    </div>
                    <div class="formMiddle formMiddle315">
                        <div class="middleLeft middleLeft315"></div>
                        <div class="middleCenter middleCenter315">
                            <div class="formMiddleContent formMiddleContent315 moduleContent">
                                <div class="sortPanelList" id="ngList315">
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周一<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight active">篮球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周二<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight active">足球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周三<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight active">篮球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                </div>
                            </div>
                        </div>
                        <div class="middleRight middleRight315"></div>
                    </div>
                </div>
                <div id="module316" class="form Handle  formStyle28">
                    <div class="formBannerTitle formBannerTitle316" style="height: 2rem;">
                        <div class="titleLeft titleLeft316">
                        </div>
                        <div class="titleCenter titleCenter316">
                            <div class="titleText titleText316">
                                <div class="titleTextIcon icon-titleText">&nbsp;</div>
                                <div class="textContent">本周课程</div>
                            </div>
                            <div class="formBannerMore formBannerMore316"></div>
                        </div>
                        <div class="titleRight titleRight316"></div>
                    </div>
                    <div class="formMiddle formMiddle316">
                        <div class="middleLeft middleLeft316"></div>
                        <div class="middleCenter middleCenter316">
                            <div class="formMiddleContent formMiddleContent316 moduleContent">
                                <div class="sortPanelList" id="ngList316">
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周一<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight active">篮球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周二<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight">足球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周三<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight">篮球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                </div>
                            </div>
                        </div>
                        <div class="middleRight middleRight316"></div>
                    </div>
                </div>
                <div id="module317" class="form Handle formStyle28">
                    <div class="formBannerTitle formBannerTitle317" style="height: 2rem;">
                        <div class="titleLeft titleLeft317"></div>
                        <div class="titleCenter titleCenter317">
                            <div class="titleText titleText317">
                                <div class="titleTextIcon icon-titleText">&nbsp;</div>
                                <div class="textContent">下周课程</div>
                            </div>
                            <div class="formBannerMore formBannerMore317"></div>
                        </div>
                        <div class="titleRight titleRight317"></div>
                    </div>
                    <div class="formMiddle formMiddle317">
                        <div class="middleLeft middleLeft317"></div>
                        <div class="middleCenter middleCenter317">
                            <div class="formMiddleContent formMiddleContent317 moduleContent">
                                <div class="sortPanelList" id="ngList317">
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周一<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight">篮球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周二<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight">足球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                    <div class="line j-lineH J_lineH">
                                        <div class="pgName">周三<span style="margin-left: .4rem">08:00-10:00</span></div>
                                        <div class="pgRight">篮球训练班</div>
                                    </div>
                                    <div class="g_separator separatorLine"></div>
                                </div>
                            </div>
                        </div>
                        <div class="middleRight middleRight317"></div>
                    </div>
                </div>
                <div class="g_globalLine" style="margin-top: 2rem; text-align: center">
                    <a class="g_button sendIcon" href="/training/mobile/v1/center/sign/log">全部上课记录</a>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="近三周记录"/>
</c:import>
