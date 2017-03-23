<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webCustomerServiceBox" class="webCustomerServiceBox" style="display: block; opacity: 1;">
        <div class="customerServiceDiv moveAnimation" id="customerServiceDiv">
            <div id="customServiceLine_1" class="customServiceLine"></div>
            <div class="service serviceClass_1" id="customerServiceType_1" style="width: 33.333%;background-color: #0657a9;">
                <div id="navItem_1" class="navItem navItem_1 icon-navItem">
                    <a id="numberHref_1" href="/training/coach/v1/center/sign/log">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_1">
                                <div id="describeName_1" class="describe">全部</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="customServiceLine_3" class="customServiceLine"></div>
            <div class="service serviceClass_3" id="customerServiceType_3" style="width: 33.333%;">
                <div id="navItem_3" class="navItem navItem_3 icon-navItem">
                    <a id="numberHref_3" href="/training/coach/v1/center/sign/log?status=1">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_3">
                                <div id="describeName_3" class="describe">未上课</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="customServiceLine_4" class="customServiceLine"></div>
            <div class="service serviceClass_4" id="customerServiceType_4" style="width: 33.333%;">
                <div id="navItem_4" class="navItem navItem_4 icon-navItem">
                    <a id="numberHref_4" href="/training/coach/v1/center/sign/log?status=2">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_4">
                                <div id="describeName_4" class="describe">已上课</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module315" class="form Handle  formStyle28">
                <div class="formBannerTitle formBannerTitle315" style="height: 2rem;">
                    <div class="titleLeft titleLeft315">
                    </div>
                    <div class="titleCenter titleCenter315">
                        <div class="titleText titleText315">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">2017-03-01 <span style="margin-left: .4rem">周一</span></div>
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
                                    <div class="pgName">篮球训练班</div>
                                    <div class="pgRight active">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">足球训练班</div>
                                    <div class="pgRight active">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">游泳训练班</div>
                                    <div class="pgRight active">08:00-10:00</div>
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
                            <div class="textContent">2017-03-02 <span style="margin-left: .4rem">周二</span></div>
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
                                    <div class="pgName">篮球训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">足球训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">游泳训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight316"></div>
                </div>
            </div>
            <div id="module317" class="form Handle  formStyle28">
                <div class="formBannerTitle formBannerTitle316" style="height: 2rem;">
                    <div class="titleLeft titleLeft316">
                    </div>
                    <div class="titleCenter titleCenter316">
                        <div class="titleText titleText316">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">2017-03-02 <span style="margin-left: .4rem">周三</span></div>
                        </div>
                        <div class="formBannerMore formBannerMore316"></div>
                    </div>
                    <div class="titleRight titleRight316"></div>
                </div>
                <div class="formMiddle formMiddle316">
                    <div class="middleLeft middleLeft316"></div>
                    <div class="middleCenter middleCenter316">
                        <div class="formMiddleContent formMiddleContent316 moduleContent">
                            <div class="sortPanelList" id="ngList317">
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">篮球训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">足球训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">游泳训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight316"></div>
                </div>
            </div>
            <div id="module318" class="form Handle  formStyle28">
                <div class="formBannerTitle formBannerTitle316" style="height: 2rem;">
                    <div class="titleLeft titleLeft316">
                    </div>
                    <div class="titleCenter titleCenter316">
                        <div class="titleText titleText316">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">2017-03-02 <span style="margin-left: .4rem">周四</span></div>
                        </div>
                        <div class="formBannerMore formBannerMore316"></div>
                    </div>
                    <div class="titleRight titleRight316"></div>
                </div>
                <div class="formMiddle formMiddle316">
                    <div class="middleLeft middleLeft316"></div>
                    <div class="middleCenter middleCenter316">
                        <div class="formMiddleContent formMiddleContent316 moduleContent">
                            <div class="sortPanelList" id="ngList318">
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">篮球训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">足球训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div class="line j-lineH J_lineH">
                                    <div class="pgName">游泳训练班</div>
                                    <div class="pgRight">08:00-10:00</div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight316"></div>
                </div>
            </div>

            <div class="g_globalLine" style="margin: 1.2rem 0; text-align: center">
                <a class="g_mainColor" href="javascript:;">更多记录加载...</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="全部记录"/>
</c:import>
