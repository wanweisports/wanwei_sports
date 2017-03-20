<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
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

    <link href="Content/lib/amfe/flexible.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <script src="Content/lib/amfe/flexible.js?v=${static_resource_version}"></script>

    <layout:block name="<%=Blocks.BLOCK_HEADER_CSS%>"/>
</head>

<body>
    <div class="container">
        <div class="loading">
            <div class="splash-screen ui-loader">
                <span class="ui-icon ui-icon-loading spin"></span>
            </div>
        </div>

        <div class="banner-box">
            <div class="banner">
                <div class="banner-swipe">
                    <div class="banner-swipe-list">
                        <div class="banner-swipe-item">
                            <a href="javascript:;" class="banner-image">
                                <img src="/Content/images/training/student/banners/banner1.jpg?v=${static_resource_version}">
                            </a>
                        </div>
                        <div class="banner-swipe-item">
                            <a href="javascript:;" class="banner-image">
                                <img src="/Content/images/training/student/banners/banner2.jpg?v=${static_resource_version}">
                            </a>
                        </div>
                        <div class="banner-swipe-item">
                            <a href="javascript:;" class="banner-image">
                                <img src="/Content/images/training/student/banners/banner3.jpg?v=${static_resource_version}">
                            </a>
                        </div>
                    </div>
                    <div class="banner-bullet">
                        <ul class="bullets">
                            <li></li>
                            <li></li>
                            <li class="on"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-box">

        </div>
        <layout:block name="<%=Blocks.BLOCK_BODY%>"/>
    </div>

    <layout:block name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"/>
    <layout:block name="<%=Blocks.BLOCK_TRACE_SCRIPTS%>"/>
</body>
</html>
