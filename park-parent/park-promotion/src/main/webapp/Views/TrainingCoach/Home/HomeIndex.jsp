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
    <link href="Content/images/training/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon"/>

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
          href="Content/style/training/coach/fontsIco.min.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/coach/base.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/coach/bannerAnimation.min.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/coach/entrance.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/coach/style.css?v=${static_resource_version}">

    <style id="mobiCubeStyleModule">
        #cubeNavigation303_cubeLink1 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter1.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink2 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter2.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink3 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter3.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink4 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter4.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }
    </style>
</head>

<body id="g_body" class="g_locale2052">

<div id="g_web" class="g_web">
    <!-- this is loading  -->
    <div class="loading" style="display: none;">
        <div class="splashscreen ui-loader">
            <span class="ui-icon ui-icon-loading spin"></span>
        </div>
    </div>

    <div id="webBannerBox" class="webBannerBox moveAnimation">
        <div id="webBanner" class="webBanner hiddenDefaultBanner">
            <div id="bannerSwipe" class="swipe" style="height: 176px; visibility: visible;">
                <div id="bannerSwipeContainer" class="bannerSwipeContainer defaultBanner">
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/student/banners/banner3.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/student/banners/banner2.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/student/banners/banner1.jpg?v=${static_resource_version}">
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
            <div class="form Handle formStyle31 moduleStyle15">
                <div class="formBannerTitle">
                    <div class="titleLeft"></div>
                    <div class="titleCenter">
                        <div class="titleText">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">服务项</div>
                        </div>
                        <div class="formBannerMore"></div>
                    </div>
                    <div class="titleRight"></div>
                </div>
                <div class="formMiddle">
                    <div class="middleLeft"></div>
                    <div class="middleCenter">
                        <div class="formMiddleContent moduleContent">
                            <div class="cubeNavigationArea cubeNavigationArea15">
                                <div class="cubeLink" id="cubeNavigation303_cubeLink1">
                                    <a class="cubeLink_a" href="/training/coach/v1/course/list">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">课程推荐<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink" id="cubeNavigation303_cubeLink2">
                                    <a class="cubeLink_a" href="/training/coach/v1/center/index">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">个人中心<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink" id="cubeNavigation303_cubeLink3">
                                    <a class="cubeLink_a" href="/training/coach/v1/pp/login">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">登录注册<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink" id="cubeNavigation303_cubeLink4">
                                    <a class="cubeLink_a" href="tel:400-998-9898">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">客服咨询<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight"></div>
                </div>
            </div>
            <div class="form Handle">
                <div class="formBannerTitle">
                    <div class="titleLeft"></div>
                    <div class="titleCenter">
                        <div class="titleText">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">优秀学生</div>
                        </div>
                        <div class="formBannerMore"></div>
                    </div>
                    <div class="titleRight"></div>
                </div>
                <div class="formMiddle">
                    <div class="middleLeft"></div>
                    <div class="middleCenter">
                        <div class="formMiddleContent moduleContent">
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

</body>
</html>
