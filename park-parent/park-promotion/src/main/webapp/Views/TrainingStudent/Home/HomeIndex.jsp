<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html style="font-size: 23.4375px;">
<head>
    <base href="<%= basePath %>">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">

    <title>${param.title == null ? "万为培训" : param.title}</title>

    <meta name="keywords"
          content="${param.keyword == null ? "万为培训, 约课系统, 体育培训, 培训，万为, wanwei.com" : param.keyword}">
    <meta name="description"
          content="${param.desc == null ? "万为培训 - 提供智能化的培训管理服务平台。" : param.desc}">
    <meta name="author" content="北体高科（北京）科技有限公司">

    <meta name="renderer" content="webkit">
    <meta name="layoutmode" content="standard">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="mobileOptimized" content="width">
    <meta name="handheldFriendly" content="true">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!--uc浏览器判断到页面上文字居多时，会自动放大字体优化移动用户体验。添加以下头部可以禁用掉该优化-->
    <meta name="wap-font-scale" content="no">

    <meta name="flexible" content="initial-dpr=1">
    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon"/>

    <script type="text/javascript">
        // html root的字体计算应该放在最前面，这样计算就不会有误差了
        // 之所以要加个判断返回一个20.5，是因为当用户在谷歌等浏览器直接输入手机端网站网址时，
        // 如果用户设置模块自定义样式的高度比较小，由于这时候的clientWidth为1920px，
        // 及返回的_htmlFontSize为40，这时候就会使模块太小，展示不完全，
        // 因此先取一个较为准确的值去展示。Mobi.resetHtmlFontSize()顺便也加了
        var _htmlFontSize = (function () {
            var clientWidth = document.documentElement ? document.documentElement.clientWidth : document.body.clientWidth;
            if (clientWidth > 768) clientWidth = 768;
            document.documentElement.style.fontSize = clientWidth / 16 + "px";
            return clientWidth / 16;
        })();
    </script>

    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/fontsIco.min.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/base.min.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/bannerAnimation.min.css?v=${static_resource_version}">
    <link rel="stylesheet" id="mobiStyleTemplateCss" type="text/css"
          href="Content/style/training/student/1003_1.min.css?v=${static_resource_version}">
    <link rel="stylesheet" id="mobiCubeNavigationCss" type="text/css"
          href="Content/style/training/student/cubeNavigation.min.css?v=${static_resource_version}">

    <!-- //输出模块样式css -->
    <style type="text/css">
        #module303 {
            border: none;
            padding: 0.5% 0;
            background: none;
            overflow: hidden;
        }

        #module303 .formMiddle303 {
            border: none;
            padding: 0;
            background: none;
        }

        #module303 .formBannerTitle303 {
            border: none;
            padding: 0;
        }

        #module303 .formMiddleContent303 {
            background: none;
        }
    </style>

    <style id="mobiCubeStyleModule">
        #cubeNavigation303_cubeLink1 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/AD0IpdPPBRACGAAg-_TwwAUoisrx8QYwsAI43AE.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink2 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/AD0IpdPPBRACGAAg-uTwwAUo-MmK7AcwsAI43AE.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink3 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/AD0IpdPPBRACGAAg5_7wwAUo-oLpvQcw3AI4tAE.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink4 .cubeLink_bg {
            background: #000 url(/Content/images/training/student/AD0IpdPPBRACGAAgrsfwwAUotP-s1gYwyQE4yQE.jpg) no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }
    </style>
</head>

<body id="g_body" class="g_locale2052 mobiCol3">

<div class="webLeft"></div>

<div id="g_web" class="g_web">
    <!-- this is loading  -->
    <div id="webLoading" class="loading" style="display:none;">
        <div id="splashscreen" class="splashscreen ui-loader">
            <span class="ui-icon ui-icon-loading spin"></span>
        </div>
    </div>

    <div id="webBannerBox" class="webBannerBox moveAnimation">
        <div id="webBanner" style="display:block;" class="webBanner hiddenDefaultBanner">
            <div id="bannerSwipe" class="swipe" style="height: 176px; visibility: visible;">
                <div id="bannerSwipeContainer" class="bannerSwipeContainer defaultBanner">
                    <div>
                        <a href="javascript:;" class="bannerImageDiv customBanner"
                           style="display:block; background-image:url('/Content/images/training/student/banners/banner3.jpg');"></a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv customBanner"
                           style="display:block; background-image:url('/Content/images/training/student/banners/banner1.jpg');"></a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv customBanner"
                           style="display:block; background-image:url('/Content/images/training/student/banners/banner2.jpg');"></a>
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
                                        <div class="imgClass_160" style="height: 5.4rem;">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher1.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">张怡宁</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160" style="height: 5.4rem;">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher4.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">张继科</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160" style="height: 5.4rem;">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher3.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">田亮</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160" style="height: 5.4rem;">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/student/teacher2.jpg" alt="">
                                        </div>
                                        <div class="imgName g_link">易建联</div>
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
                                                    <img src="/Content/images/training/student/timg1.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>某某课程</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">
                                                            报名时间：2017-03-19
                                                        </div>
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
                                                    <img src="/Content/images/training/student/timg2.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>某某课程</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">
                                                            报名时间：2017-03-19
                                                        </div>
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
                                                    <img src="/Content/images/training/student/timg3.jpg"
                                                         class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>某某课程</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">
                                                            报名时间：2017-03-19
                                                        </div>
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

    <div id="webFooterBox" class="webFooterBox ">
        <!--图片详情Div -->
        <div id="webFooter" class="webFooter moveAnimation">
            <div id="footer" class="footer mallThemeFooter">
                <div class="technical">
                    <div class="technicalSupport footerInfo">
                        <p>北体高科（北京）科技有限公司</p>
                    </div>
                    <div class="technicalSupport">
                        <p>京ICP备15016022号-1</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="webRight"></div>

</body>
</html>
