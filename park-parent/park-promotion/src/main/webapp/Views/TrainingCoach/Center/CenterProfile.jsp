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

    <title>${param.title == null ? "会员信息" : param.title}</title>

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
            <div id="module9" class="form Handle  formStyle12 ">
                <div class="formBannerTitle formBannerTitle311" style="height: 2rem;">
                    <div class="titleLeft titleLeft311"></div>
                    <div class="titleCenter titleCenter311">
                        <div class="titleText titleText311">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">二维码</div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
                <div class="formMiddle formMiddle8">
                    <div class="middleLeft middleLeft8"></div>
                    <div class="middleCenter middleCenter8">
                        <div class="formMiddleContent formMiddleContent8 moduleContent">
                            <div style="margin: .6rem 0; text-align: center;">
                                <img src="/Content/images/training/student/qrcode.png" style="width: 66%; border: 1px solid #666;">
                            </div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
            </div>
            <div id="module8" class="form Handle formStyle12 ">
                <div class="formBannerTitle formBannerTitle311" style="height: 2rem;">
                    <div class="titleLeft titleLeft311"></div>
                    <div class="titleCenter titleCenter311">
                        <div class="titleText titleText311">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">会员信息</div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
                <div class="formMiddle formMiddle8">
                    <div class="middleLeft middleLeft8"></div>
                    <div class="middleCenter middleCenter8">
                        <div class="formMiddleContent formMiddleContent8 moduleContent">
                            <div id="mLogin">
                                <div class="loginContent">
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="user" class="itemEdit g_input mustItem"
                                               placeholder="张某某">
                                        <span class="icon-nameIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="mobile" class="itemEdit g_input mustItem"
                                               placeholder="110****1234">
                                        <span class="icon-mobileIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <select class="itemEdit g_select mustItem">
                                            <option>北京市</option>
                                            <option>上海市</option>
                                            <option>山东省</option>
                                        </select>
                                        <span class="icon-emailIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <select class="itemEdit g_select mustItem">
                                            <option>北京市</option>
                                            <option>上海市</option>
                                            <option>济南市</option>
                                        </select>
                                        <span class="icon-emailIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="address" class="itemEdit g_input mustItem"
                                               placeholder="海淀区上地软件园100号">
                                        <span class="icon-emailIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="button" class=" g_button sendIcon" value="保 存">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight8"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="webRight"></div>

</body>
</html>