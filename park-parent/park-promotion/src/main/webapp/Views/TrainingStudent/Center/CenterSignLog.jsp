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

    <title>${param.title == null ? "全部记录" : param.title}</title>

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
          href="Content/style/training/student/1003_1.min.css?v=${static_resource_version}">
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

    <div id="webCustomerServiceBox" class="webCustomerServiceBox" style="display: block; opacity: 1;">
        <div class="customerServiceDiv moveAnimation" id="customerServiceDiv">
            <div id="customServiceLine_1" class="customServiceLine"></div>
            <div class="service serviceClass_1" id="customerServiceType_1" style="width: 33.333%;background-color: #0657a9;">
                <div id="navItem_1" class="navItem navItem_1 icon-navItem">
                    <a id="numberHref_1" href="/training/mobile/v1/center/sign/log">
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
                    <a id="numberHref_3" href="/training/mobile/v1/center/sign/log?status=1">
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
                    <a id="numberHref_4" href="/training/mobile/v1/center/sign/log?status=2">
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
            <div id="module316" class="form Handle  formStyle28">
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
            <div id="module316" class="form Handle  formStyle28">
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

            <div class="g_globalLine" style="margin: 1.2rem 0; text-align: center">
                <a class="g_mainColor" href="javascript:;">更多记录加载...</a>
            </div>
        </div>
    </div>
</div>

<div class="webRight"></div>

</body>
</html>
