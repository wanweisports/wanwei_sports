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

    <title>${param.title == null ? "个人中心" : param.title}</title>

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
    <link rel="stylesheet" id="mobiStyleTemplateCss" type="text/css"
          href="Content/style/training/coach/1003_1.min.css?v=${static_resource_version}">
    <link rel="stylesheet" id="mobiCubeNavigationCss" type="text/css"
          href="Content/style/training/coach/cubeNavigation.min.css?v=${static_resource_version}">

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

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module311" class="form Handle formStyle6">
                <div class="textImg3" style="height: 7rem; background: #0657a9;">
                    <div style="float: left; width: 4rem; height: 4rem; margin-top: 1.5rem; margin-left: .5rem; border-radius: 2.5rem; background: #FAFAFA;">
                        <img src="/Content/images/training/student/male.png"
                             style="width: 3rem; height: 3rem; margin-top: .5rem; margin-left: .14rem;">
                    </div>
                    <div style="display: block; float: left; margin-top: 2.4rem; margin-left: .8rem; color: #FAFAFA;">
                        <p style="margin-bottom: .6rem; font-size: .8rem;">王某某</p>
                        <p>110****1234</p>
                    </div>
                    <div style="display: block; float: right; margin-top: 2.7rem; margin-right: .6rem">
                        <a href="/training/coach/v1/center/profile">
                            <img src="/Content/images/training/student/settings.png" style="width: 1.6rem;">
                        </a>
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
                                                <a href="/training/coach/v1/center/course/list">我的课程</a>
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
                                                <a href="/training/coach/v1/center/sign/weekLog">学生签到记录</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel"></div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div id="newsLine3" class="newsLine line icon-gline  wWLine  firstClass  wholeLine J_lineH j-lineH">
                                    <div id="lineBody3" class="lineBody lineBodyTable">
                                        <div class="linkTableCell">
                                            <div class="linkTable">
                                                <a href="/training/coach/v1/center/contact/list">通讯簿</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel"></div>
                                </div>
                                <div class="g_separator separatorLine"></div>
                                <div id="newsLine4" class="newsLine line icon-gline  wWLine  firstClass  wholeLine J_lineH j-lineH">
                                    <div id="lineBody4" class="lineBody lineBodyTable">
                                        <div class="linkTableCell">
                                            <div class="linkTable">
                                                <a href="/training/coach/v1/center/honor">教练资质</a>
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
                                                <a href="/training/coach/v1/center/about">关于万维培训</a>
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
                <a  class="g_button sendIcon" href="/training/coach/v1/home/index">退出登录</a>
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
