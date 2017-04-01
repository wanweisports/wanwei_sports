<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN" style="font-size: 34.722px;">
<head>
    <base href="<%= basePath %>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>${param.title == null ? "万为场馆 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords"
          content="${param.keyword == null ? "万为场馆, 管理系统, 体育场馆, 预订，万为, wanwei.com" : param.keyword}">
    <meta name="description"
          content="${param.desc == null ? "万为场馆 - 提供智能化的场馆运营管理服务平台。" : param.desc}">
    <meta name="author" content="北体高科（北京）科技有限公司">

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="mobileOptimized" content="width">
    <meta name="handheldFriendly" content="true">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="flexible" content="initial-dpr=1">

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon"/>

    <script src="Content/js/rem.js?v=${static_resource_version}"></script>

    <link href="Content/css/iconfont/iconfont.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/base.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</head>
<body class="bge">
<div class="write-info">
    <span>
        <img src="Content/images/new1/no-person.png?v=${static_resource_version}">
    </span>
    <p>李老师</p>
</div>
<ul class="ask-box">
    <li class="ask-item">
        <a href="/center/profile">
            <i class="iconfont icon-user"></i>
            <span class="ask-word">个人信息</span>
            <span class="goin"><i class="iconfont icon-right"></i></span>
        </a>
    </li>
    <li class="ask-item nobor">
        <a href="/center/password">
            <i class="iconfont icon-password"></i>
            <span class="ask-word">修改密码</span>
            <span class="goin"><i class="iconfont icon-right"></i></span>
        </a>
    </li>
</ul>
<ul class="ask-box">
    <li class="ask-item">
        <a href="tel:400-800-9000">
            <i class="iconfont icon-message"></i>
            <span class="ask-word">联系客服</span>
            <span class="goin"><i class="iconfont icon-right"></i></span>
        </a>
    </li>
    <li class="ask-item nobor">
        <a href="/center/about">
            <i class="iconfont icon-about"></i>
            <span class="ask-word">关于我们</span>
            <span class="goin"><i class="iconfont icon-right"></i></span>
        </a>
    </li>
</ul>
<div class="sign-out">
    <a href="/pp/logout">
        <i class="iconfont icon-logout"></i>
        <span>退出</span>
    </a>
</div>
</body>
</html>
