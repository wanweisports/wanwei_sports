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

    <title>${param.title == null ? "课程介绍" : param.title}</title>

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
          href="Content/style/training/coach/1003_1.min.css?v=${static_resource_version}">
</head>

<body id="g_body" class="g_locale2052 mobiCol3">

<div id="g_web" class="g_web">
    <!-- this is loading  -->
    <div id="webLoading" class="loading" style="display:none;">
        <div id="splashscreen" class="splashscreen ui-loader">
            <span class="ui-icon ui-icon-loading spin"></span>
        </div>
    </div>

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module310" class="form Handle  formStyle2 ">
                <div class="formMiddle formMiddle310">
                    <div class="middleLeft middleLeft310"></div>
                    <div class="middleCenter middleCenter310">
                        <div class="formMiddleContent formMiddleContent310 moduleContent">
                            <div class="J_richContentPanel310 f-contentPanel">
                                <div class="textImg3">
                                    <img src="/Content/images/training/student/banner2.jpg" style="width:100%">
                                </div>
                                <div class="formBannerTitle formBannerTitle310" style="height: 2rem;">
                                    <div class="titleLeft titleLeft310"></div>
                                    <div class="titleCenter titleCenter310">
                                        <div class="titleText titleText310">
                                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                                            <div class="textContent">某某课程</div>
                                        </div>
                                        <div class="formBannerMore formBannerMore310"></div>
                                    </div>
                                    <div class="titleRight titleRight310"></div>
                                </div>
                                <div class="richContent richContent3 richContent310">
                                    <p>我们学校是当地地区最权威的教育平台之一。学校创办于二零零五年，以丰富的教育资源背景为强大的依托，以“一切为了求知者”为经营理念致力于为广大的求知者提供全面的、权威的。</p>
                                    <p>我们学校是当地地区最权威的教育平台之一。学校创办于二零零五年，以丰富的教育资源背景为强大的依托，以“一切为了求知者”为经营理念致力于为广大的求知者提供全面的、权威的。</p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight310"></div>
                </div>
            </div>
            <div class="">
                <a class="g_button sendIcon" href="/training/coach/v1/course/sign?courseId=121">我要报名</a>
            </div>
            <div id="module308" class="form Handle formStyle41">
                <div class="formBannerTitle formBannerTitle308" style="height: 2rem;">
                    <div class="titleLeft titleLeft308"></div>
                    <div class="titleCenter titleCenter308">
                        <div class="titleText titleText308">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">演示教程</div>
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
                                        <div class="imgClass_160" style="height: 4.56533rem;">
                                            <img class="photoListImg" src="/Content/images/training/student/banner1.jpg">
                                        </div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160" style="height: 4.56533rem;">
                                            <img class="photoListImg" src="/Content/images/training/student/banner2.jpg">
                                        </div>
                                    </a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight308"></div>
                </div>
            </div>
            <div id="module309" class="form Handle formStyle41">
                <div class="formBannerTitle formBannerTitle309" style="height: 2rem;">
                    <div class="titleLeft titleLeft309"></div>
                    <div class="titleCenter titleCenter309">
                        <div class="titleText titleText309">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">课时安排</div>
                        </div>
                        <div class="formBannerMore formBannerMore309"></div>
                    </div>
                    <div class="titleRight titleRight309"></div>
                </div>
                <div class="formMiddle formMiddle309">
                    <div class="middleLeft middleLeft309"></div>
                    <div class="middleCenter middleCenter309">
                        <div class="formMiddleContent formMiddleContent309 moduleContent">
                            <table class="siteFormItemTable" border="1" cellpadding="0" cellspacing="0"
                                   style="text-align: center; border-color: #ddd;">
                                <tr class="siteFormItem siteFormName">
                                    <th>课程名称</th><th>课时</th><th>教师</th>
                                </tr>
                                <tr class="siteFormItem">
                                    <td>宣讲课程</td><td>2时</td><td>张老师</td>
                                </tr>
                                <tr class="siteFormItem">
                                    <td>宣讲课程</td><td>2时</td><td>张老师</td>
                                </tr>
                                <tr class="siteFormItem">
                                    <td>宣讲课程</td><td>2时</td><td>张老师</td>
                                </tr>
                                <tr class="siteFormItem">
                                    <td>宣讲课程</td><td>2时</td><td>张老师</td>
                                </tr>
                                <tr class="siteFormItem">
                                    <td>宣讲课程</td><td>2时</td><td>张老师</td>
                                </tr>
                                <tr class="siteFormItem">
                                    <td>宣讲课程</td><td>2时</td><td>张老师</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="middleRight middleRight309"></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
