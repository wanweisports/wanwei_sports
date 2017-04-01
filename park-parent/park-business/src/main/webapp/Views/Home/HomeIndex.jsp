<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN" style="">
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

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon" />

    <link href="Content/css/slick.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/base.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/all.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/swiper.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/iconfont/iconfont.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</head>
<body>
<div class="banner swiper-container swiper-container-horizontal">
    <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-1101px, 0px, 0px);">
        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 367px;">
            <a href="javascript:void(0)">
                <img class="swiper-lazy swiper-lazy-loaded" alt="" src="Content/images/new1/banner1.png?v=${static_resource_version}">
            </a>
        </div>
        <div class="swiper-slide" data-swiper-slide-index="0" style="width: 367px;">
            <a href="javascript:void(0)">
                <img class="swiper-lazy swiper-lazy-loaded" alt="" src="Content/images/new1/banner1.png?v=${static_resource_version}">
            </a>
        </div>
        <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="1" style="width: 367px;">
            <a href="javascript:void(0)">
                <img class="swiper-lazy swiper-lazy-loaded" alt="" src="Content/images/new1/banner1.png?v=${static_resource_version}">
            </a>
        </div>
        <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="2" style="width: 367px;">
            <a href="javascript:void(0)">
                <img class="swiper-lazy swiper-lazy-loaded" alt="" src="Content/images/new1/banner1.png?v=${static_resource_version}">
            </a>
        </div>
        <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="3" style="width: 367px;">
            <a href="javascript:void(0)">
                <img class="swiper-lazy swiper-lazy-loaded" alt="" src="Content/images/new1/banner1.png?v=${static_resource_version}">
            </a>
        </div>
        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 367px;">
            <a href="javascript:void(0)">
                <img class="swiper-lazy swiper-lazy-loaded" alt="" src="Content/images/new1/banner1.png?v=${static_resource_version}">
            </a>
        </div>
    </div>
    <div class="swiper-pagination swiper-pagination-clickable">
        <span class="swiper-pagination-bullet"></span>
        <span class="swiper-pagination-bullet"></span>
        <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
        <span class="swiper-pagination-bullet"></span>
    </div>
</div>

<div class="menu">
    <ul class="clearfix">
        <li>
            <a href="self-report.html">
                <img src="Content/images/new1/icon1.png?v=${static_resource_version}">
                <p class="menu-txt">自助报到</p>
            </a>
        </li>
        <li>
            <a href="green.html">
                <img src="Content/images/new1/icon2.png?v=${static_resource_version}">
                <p class="menu-txt">绿色通道</p>
            </a>
        </li>
        <li>
            <a href="arrive.html">
                <img src="Content/images/new1/icon3.png?v=${static_resource_version}">
                <p class="menu-txt">抵校登记</p>
            </a>
        </li>
        <li>
            <a href="delay.html">
                <img src="Content/images/new1/icon4.png?v=${static_resource_version}">
                <p class="menu-txt">推迟报到</p>
            </a>
        </li>
    </ul>
    <ul class="clearfix">
        <li>
            <a href="must-know.html">
                <img src="Content/images/new1/icon5.png?v=${static_resource_version}">
                <p class="menu-txt">入学须知</p>
            </a>
        </li>
        <li>
            <a href="notice.html">
                <img src="Content/images/new1/icon6.png?v=${static_resource_version}">
                <p class="menu-txt">通知公告</p>
            </a></li><a href="notice.html">
    </a>
        <li>
            <a href="data.html">
                <img src="Content/images/new1/icon7.png?v=${static_resource_version}">
                <p class="menu-txt">资料下载</p>
            </a>
        </li>
        <li>
            <a href="ask.html">
                <img src="Content/images/new1/icon8.png?v=${static_resource_version}">
                <p class="menu-txt">咨询帮助</p>
            </a>
        </li>
    </ul>
</div>
<div class="brief">
    <h3 class="brief-tit">校园简介</h3>
    <div class="brirf-content clearfix">
        <div class="bc-left fl">
            <img src="Content/images/new1/pic1.png?v=${static_resource_version}">
        </div>
        <div class="bc-right fr">
            合肥学院(Hefei University)简称合院， 是国家首批61所"卓越工程师教育培养计划"和首批52所"服务国家特殊需求人才培养项目"培养硕士专业学位研究生试点工
        </div>
    </div>
</div>
<dl class="news">
    <dt class="news-tit">校园资讯</dt>
    <dd class="news-content clearfix">
        <div class="nc-left fl">
            <img src="Content/images/new1/pic1.png?v=${static_resource_version}">
        </div>
        <div class="nc-right fr">
            <a class="ncr-top">李克强与默克尔共同考察合肥学院宣布 建立中德教育合作示范基地合作基金
            </a>
            <span class="nc-time">07-26 17:00</span>
        </div>
    </dd>
    <dd class="news-content clearfix">
        <div class="nc-left fl">
            <img src="Content/images/new1/pic1.png?v=${static_resource_version}">
        </div>
        <div class="nc-right fr">
            <a class="ncr-top">李克强与默克尔共同考察合肥学院宣布 建立中德教育合作示范基地合作基金
            </a>
            <span class="nc-time">07-26 17:00</span>
        </div>
    </dd>
</dl>

<script src="Content/js/jquery.min.js?v=${static_resource_version}"></script>
<script src="Content/js/fastclick.js?v=${static_resource_version}"></script>
<script src="Content/js/slick.min.js?v=${static_resource_version}"></script>
<script src="Content/js/rem.js?v=${static_resource_version}"></script>
<script src="Content/js/basic.js?v=${static_resource_version}"></script>
<script src="Content/js/swiper.jquery.min.js?v=${static_resource_version}"></script>
<script>
    $(function() {
        $('.autoplay').slick({
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            dots:true,
        });
    });
</script>
<script>
    $(function () {
        var banner = new Swiper('.banner',{
            autoplay: 5000,
            pagination : '.swiper-pagination',
            paginationClickable: true,
            lazyLoading : true,
            loop:true
        });
    });
</script>
</body>
</html>
