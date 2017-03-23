<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/banner_animation.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/entrance.css?v=${static_resource_version}">
    <style type="text/css">
        #cubeNavigation303_cubeLink1 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/enter/enter1.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink2 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/enter/enter2.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink3 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/enter/enter3.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink4 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/enter/enter4.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
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
            <div id="module303" class="form Handle template1003 formStyle31 moduleStyle15">
                <div class="formBannerTitle formBannerTitle303">
                    <div class="titleLeft titleLeft303"></div>
                    <div class="titleCenter titleCenter303">
                        <div class="titleText titleText303">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">服务项</div>
                        </div>
                        <div class="formBannerMore formBannerMore303"></div>
                    </div>
                    <div class="titleRight titleRight303"></div>
                </div>
                <div class="formMiddle formMiddle303">
                    <div class="middleLeft middleLeft303"></div>
                    <div class="middleCenter middleCenter303">
                        <div class="formMiddleContent formMiddleContent303 moduleContent">
                            <div class="cubeNavigationArea cubeNavigationArea15" id="cubeNavigation303">
                                <div class="cubeLink cubeLink1 " id="cubeNavigation303_cubeLink1">
                                    <a class="cubeLink_a" href="/training/mobile/v1/course/list"
                                       id="cubeLink_a1_cubeNav303">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p ">课程预约<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink cubeLink2 " id="cubeNavigation303_cubeLink2">
                                    <a class="cubeLink_a" href="/training/mobile/v1/center/index"
                                       id="cubeLink_a2_cubeNav303">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p ">会员中心<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink cubeLink3 " id="cubeNavigation303_cubeLink3">
                                    <a class="cubeLink_a " href="/training/mobile/v1/pp/login"
                                       id="cubeLink_a3_cubeNav303">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p ">登录注册<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink cubeLink4 " id="cubeNavigation303_cubeLink4">
                                    <a class="cubeLink_a " href="tel:400-998-9898" id="cubeLink_a4_cubeNav303">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p ">客服咨询<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight303"></div>
                </div>
            </div>
            <div id="module309" class="form Handle  formStyle42 ">
                <div class="formBannerTitle formBannerTitle309" style="height: 2rem;">
                    <div class="titleLeft titleLeft309"></div>
                    <div class="titleCenter titleCenter309">
                        <div class="titleText titleText309">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">学习园地</div>
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
            <div id="module308" class="form Handle  formStyle41">
                <div class="formBannerTitle formBannerTitle308" style="height: 2rem;">
                    <div class="titleLeft titleLeft308"></div>
                    <div class="titleCenter titleCenter308">
                        <div class="titleText titleText308">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">师资力量</div>
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
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher1.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">张怡宁</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher4.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">张继科</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher2.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">易建联</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher3.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">田亮</div>
                                    </a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight308"></div>
                </div>
            </div>
            <div id="module302" class="form Handle  formStyle6">
                <div class="formBannerTitle formBannerTitle302" style="height: 2rem;">
                    <div class="titleLeft titleLeft302"></div>
                    <div class="titleCenter titleCenter302">
                        <div class="titleText titleText302">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">课程推荐</div>
                        </div>
                        <div class="formBannerMore formBannerMore302">
                            <a class="titleMoreLink titleMoreLink302" href="/training/mobile/v1/course/list">
                                <span class="titleMoreIcon icon-titleMore titleMoreIcon302">&nbsp;</span>
                                <span class="titleMore titleMore302">更多</span>
                            </a>
                        </div>
                    </div>
                    <div class="titleRight titleRight302"></div>
                </div>
                <div class="formMiddle formMiddle302">
                    <div class="middleLeft middleLeft302"></div>
                    <div class="middleCenter middleCenter302">
                        <div class="formMiddleContent formMiddleContent302 moduleContent">
                            <div class="newsList " id="newsList302">
                                <div id="newsLine8" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody8" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link"
                                               href="/training/mobile/v1/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg1.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>足球兴趣班</div>
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
                                            <a class="f_mixNewsStyleImgBox6_link"
                                               href="/training/mobile/v1/course/detail?courseId=121">
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
                                               href="/training/mobile/v1/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg3.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>篮球培训班</div>
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
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="万为培训"/>
    <c:param name="footer" value="true"/>
</c:import>
