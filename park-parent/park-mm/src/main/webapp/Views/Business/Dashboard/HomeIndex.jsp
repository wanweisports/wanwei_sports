<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/banner_animation.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/cubeNavigation.min.css?v=${static_resource_version}">
    <style type="text/css">
        #cubeNavigation327_cubeLink1 .cubeLink_bg {
            background: #00af50 url(/Content/images/training/entrance/bar.png) no-repeat center;
            background-size: 60%;
            opacity: 1.0;
        }

        #cubeNavigation327_cubeLink1 .cubeLink_ico {
            background: none;
        }

        #cubeNavigation327_cubeLink1 .icon-cube:before {
            content: none;
        }

        #cubeNavigation327_cubeLink2 .cubeLink_bg {
            background: #65C0E7 url(/Content/images/training/entrance/line_chart.png) no-repeat center;
            background-size: 60%;
            opacity: 1.0;
        }

        #cubeNavigation327_cubeLink2 .cubeLink_ico {
            background: none;
        }

        #cubeNavigation327_cubeLink2 .icon-cube:before {
            content: none;
        }

        #cubeNavigation327_cubeLink3 .cubeLink_bg {
            background: #D2691E url(/Content/images/training/entrance/info.png) no-repeat center;
            background-size: 60%;
            opacity: 1.0;
        }

        #cubeNavigation327_cubeLink3 .cubeLink_ico {
            background: none;
        }

        #cubeNavigation327_cubeLink3 .icon-cube:before {
            content: none;
        }

        #cubeNavigation327_cubeLink4 .cubeLink_bg {
            background: #FFA500 url(/Content/images/training/entrance/calendar.png) no-repeat center;
            background-size: 60%;
            opacity: 1.0;
        }

        #cubeNavigation327_cubeLink4 .cubeLink_ico {
            background: none;
        }

        #cubeNavigation327_cubeLink4 .icon-cube:before {
            content: none;
        }

        #cubeNavigation327_cubeLink5 .cubeLink_bg {
            background: #9932CC url(/Content/images/training/entrance/medal.png) no-repeat center;
            background-size: 60%;
            opacity: 1.0;
        }

        #cubeNavigation327_cubeLink5 .cubeLink_ico {
            background: none;
        }

        #cubeNavigation327_cubeLink5 .icon-cube:before {
            content: none;
        }

        #cubeNavigation327_cubeLink6 .cubeLink_bg {
            background: #008B8B url(/Content/images/training/entrance/contacts.png) no-repeat center;
            background-size: 60%;
            opacity: 1.0;
        }

        #cubeNavigation327_cubeLink6 .cubeLink_ico {
            background: none;
        }

        #cubeNavigation327_cubeLink6 .icon-cube:before {
            content: none;
        }
    </style>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webBannerBox" class="webBannerBox moveAnimation">
        <div id="webBanner" class="webBanner hiddenDefaultBanner">
            <div id="bannerSwipe" class="swipe" style="height: 176px; visibility: visible;">
                <div id="bannerSwipeContainer" class="bannerSwipeContainer defaultBanner">
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/banners/banner3.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/banners/banner2.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/banners/banner1.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                </div>
                <div id="bannerBullet" class="bannerBullet">
                    <ul id="bullets" class="bullets">
                        <li class="on"></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module327" class="form Handle template1004 formStyle31 moduleStyle13">
                <div class="formMiddle formMiddle327">
                    <div class="middleLeft middleLeft327">
                    </div>
                    <div class="middleCenter middleCenter327">
                        <div class="formMiddleContent formMiddleContent327 moduleContent">
                            <div class="cubeNavigationArea cubeNavigationArea13" value="13" id="cubeNavigation327">
                                <div class="cubeLink cubeLink1 " id="cubeNavigation327_cubeLink1" linkid="1">
                                    <a class="cubeLink_a" href="/business/data/income?countNum=11" id="cubeLink_a1_cubeNav327">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">营业数据<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a></div>
                                <div class="cubeLink cubeLink2 " id="cubeNavigation327_cubeLink2" linkid="2">
                                    <a class="cubeLink_a" href="/business/data/venuePercentage?countNum=11" id="cubeLink_a2_cubeNav327">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">场地数据<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a></div>
                                <div class="cubeLink cubeLink3 " id="cubeNavigation327_cubeLink3" linkid="3">
                                    <a class="cubeLink_a" href="/business/oa/getNotifications?type=2" id="cubeLink_a3_cubeNav327">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">消息通知<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a></div>
                                <div class="cubeLink cubeLink4 " id="cubeNavigation327_cubeLink4" linkid="4">
                                    <a class="cubeLink_a " href="/business/office/schedule?countNum=21" id="cubeLink_a4_cubeNav327">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">值班安排<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a></div>
                                <div class="cubeLink cubeLink5 " id="cubeNavigation327_cubeLink5" linkid="5">
                                    <a class="cubeLink_a" href="/business/training/list" id="cubeLink_a5_cubeNav327">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">培训管理<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a></div>
                                <div class="cubeLink cubeLink6 " id="cubeNavigation327_cubeLink6" linkid="6">
                                    <a class="cubeLink_a" href="/business/passport/profile" id="cubeLink_a6_cubeNav327">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">会员中心<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight327">
                    </div>
                </div>
            </div>
            <div id="module309" class="form Handle  formStyle42 ">
                <div class="formBannerTitle formBannerTitle309" style="height: 2rem;">
                    <div class="titleLeft titleLeft309"></div>
                    <div class="titleCenter titleCenter309">
                        <div class="titleText titleText309">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">场馆全景</div>
                        </div>
                        <div class="formBannerMore formBannerMore309"></div>
                    </div>
                    <div class="titleRight titleRight309"></div>
                </div>
                <div class="formMiddle formMiddle309">
                    <div class="middleLeft middleLeft309"></div>
                    <div class="middleCenter middleCenter309">
                        <div class="formMiddleContent formMiddleContent309 moduleContent">
                            <div class="photoModule styleForm7 g_background">
                                <div id="photoModuleImageSwipe309" class="swipe"
                                     style="height: 271px; visibility: visible;">
                                    <div class="bannerSwipeContainer photoModuleImageSwipeContainer">
                                        <div class="photoImageItem" data-index="0">
                                            <a href="javascript:;">
                                                <img src="/Content/images/training/student/school2.jpg">
                                            </a>
                                        </div>
                                        <div class="photoImageItem" data-index="1">
                                            <a href="javascript:;">
                                                <img src="/Content/images/training/student/school1.jpg">
                                            </a>
                                        </div>
                                        <div class="photoImageItem" data-index="2">
                                            <a href="javascript:;">
                                                <span class="imageMiddleSpan"></span>
                                                <img src="/Content/images/training/student/school3.jpg">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="nextAndPreviousIcon imageSliderNext" style="top: 118px;"></div>
                                    <div class="nextAndPreviousIcon imageSliderPrevious" style="top: 118px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight309">
                    </div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Custom/Layout.jsp">
    <c:param name="title" value="万为场馆"/>
    <c:param name="footer" value="true"/>
</c:import>
