<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/css/all.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/css/swiper.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/js/basic.js?v=${static_resource_version}"></script>
    <script src="Content/js/swiper.jquery.min.js?v=${static_resource_version}"></script>
    <script>
        $(function () {
            var banner = new Swiper('.banner',{
                autoplay: 5000,
                pagination : '.swiper-pagination',
                paginationClickable: false,
                loop:true
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="banner swiper-container swiper-container-horizontal">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <a href="javascript:;">
                    <img src="Content/images/new1/banner1.png?v=${static_resource_version}">
                </a>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </div>

    <div class="menu">
        <ul class="clearfix">
            <li>
                <a href="/data/venuePercentage?countNum=11">
                    <img src="Content/images/new1/chart1.png?v=${static_resource_version}">
                    <p class="menu-txt">场地数据</p>
                </a>
            </li>
            <li>
                <a href="/data/income?countNum=11">
                    <img src="Content/images/new1/chart2.png?v=${static_resource_version}">
                    <p class="menu-txt">营业数据</p>
                </a>
            </li>
            <li>
                <a href="/training/list">
                    <img src="Content/images/new1/medal.png?v=${static_resource_version}">
                    <p class="menu-txt">场馆培训</p>
                </a>
            </li>
            <li>
                <a href="/office/schedule?countNum=21">
                    <img src="Content/images/new1/checklist.png?v=${static_resource_version}">
                    <p class="menu-txt">值班安排</p>
                </a>
            </li>
        </ul>
        <ul class="clearfix">
            <li>
                <a href="/oa/getNotifications?type=2">
                    <img src="Content/images/new1/message.png?v=${static_resource_version}">
                    <p class="menu-txt">通知消息</p>
                </a>
            </li>
            <li>
                <a href="/center/index">
                    <img src="Content/images/new1/street.png?v=${static_resource_version}">
                    <p class="menu-txt">个人中心</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <img src="Content/images/new1/contact.png?v=${static_resource_version}">
                    <p class="menu-txt">联系客服</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <img src="Content/images/new1/signal.png?v=${static_resource_version}">
                    <p class="menu-txt">公司新闻</p>
                </a>
            </li>
        </ul>
    </div>
    <div class="brief">
        <h3 class="brief-tit">场馆简介</h3>
        <div class="brirf-content clearfix">
            <div class="bc-left fl">
                <img src="Content/images/new1/pic1.png?v=${static_resource_version}">
            </div>
            <a class="bc-right fr" href="#">国家首批61所"卓越工程师教育培养计划"和首批52所"服务国家特殊需求人才培养项目"培养硕士专业学...</a>
        </div>
    </div>
    <dl class="news">
        <dt class="news-tit">场馆资讯</dt>
        <dd class="news-content clearfix">
            <div class="nc-left fl">
                <img src="Content/images/new1/pic1.png?v=${static_resource_version}">
            </div>
            <div class="nc-right fr">
                <a class="ncr-top" href="#">李克强与默克尔共同考察合肥学院宣布 建立中德教育合作示范基地合作基金</a>
                <span class="nc-time">2017-01-26 17:00</span>
            </div>
        </dd>
        <dd class="news-content clearfix">
            <div class="nc-left fl">
                <img src="Content/images/new1/pic1.png?v=${static_resource_version}">
            </div>
            <div class="nc-right fr">
                <a class="ncr-top" href="#">李克强与默克尔共同考察合肥学院宣布 建立中德教育合作示范基地合作基金</a>
                <span class="nc-time">2017-01-26 17:00</span>
            </div>
        </dd>
    </dl>
</layout:override>

<c:import url="../Shared/Layout2.jsp">
    <c:param name="title" value="万为场馆"/>
</c:import>
