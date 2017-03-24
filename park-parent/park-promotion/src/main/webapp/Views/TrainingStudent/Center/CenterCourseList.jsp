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
            <div class="service serviceClass_1" id="customerServiceType_1" style="width: 25%; background-color: #0657a9;">
                <div id="navItem_1" class="navItem navItem_1 icon-navItem">
                    <a id="numberHref_1" href="/training/mobile/v1/center/course/list">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_1">
                                <div id="describeName_1" class="describe">全部</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="customServiceLine_3" class="customServiceLine"></div>
            <div class="service serviceClass_3" id="customerServiceType_3" style="width: 25%;">
                <div id="navItem_3" class="navItem navItem_3 icon-navItem">
                    <a id="numberHref_3" href="/training/mobile/v1/center/course/list?status=1">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_3">
                                <div id="describeName_3" class="describe">已上课</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="customServiceLine_4" class="customServiceLine"></div>
            <div class="service serviceClass_4" id="customerServiceType_4" style="width: 25%;">
                <div id="navItem_4" class="navItem navItem_4 icon-navItem">
                    <a id="numberHref_4" href="/training/mobile/v1/center/course/list?status=2">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_4">
                                <div id="describeName_4" class="describe">已预约</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="customServiceLine_5" class="customServiceLine"></div>
            <div class="service serviceClass_5" id="customerServiceType_5" style="width: 25%;">
                <div id="navItem_5" class="navItem navItem_5 icon-navItem">
                    <a id="numberHref_5" href="/training/mobile/v1/center/course/list?status=3">
                        <div class="serBaseIcon">
                            <div class="icon" id="svebar_5">
                                <div id="describeName_5" class="describe">已完成</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module302" class="form Handle formStyle6">
                <div class="formMiddle formMiddle302">
                    <div class="middleLeft middleLeft302"></div>
                    <div class="middleCenter middleCenter302">
                        <div class="formMiddleContent formMiddleContent302 moduleContent">
                            <div class="newsList " id="newsList302">
                                <div id="newsLine8" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody8" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link" href="/training/mobile/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg1.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>篮球兴趣班</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="newsLine7" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody7" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link" href="/training/mobile/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg2.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>田亮跳水体验课</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="newsLine6" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody6" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link"
                                               href="/training/mobile/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg3.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>篮球提高班</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight302"></div>
                </div>
            </div>

            <div class="g_globalLine" style="margin: 1rem 0; text-align: center">
                <a class="g_mainColor" href="javascript:;">更多课程加载...</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="已预约课程"/>
</c:import>

