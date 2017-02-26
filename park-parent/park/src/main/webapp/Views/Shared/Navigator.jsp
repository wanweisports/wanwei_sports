<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="ww-header">
    <div class="header">
        <div class="ww-logo">
            <img src="Content/images/logo.png?v=${static_resource_version}" class="logo-icon">
        </div>
        <ul class="ww-nav">
            <li class="nav-home ${param.nav == "home" ? "nav-active" : ""}">
                <a href="/">
                    <img src="Content/images/navigator/home.png?v=${static_resource_version}">
                    <span>工作平台</span>
                </a>
            </li>
            <li class="${param.nav == "member" ? "nav-active" : ""}">
                <a href="javascript:;">
                    <img src="Content/images/navigator/users.png?v=${static_resource_version}">
                    <span>会员管理</span>
                </a>
                <ul class="nav-sub">
                    <li><a class="${param.subNav == "register" ? "active" : ""}" href="/member/regMember">新会员注册</a></li>
                    <li><a class="${param.subNav == "list" ? "active" : ""}" href="/member/memberList">会员查询</a></li>
                    <li><a class="${param.subNav == "operation" ? "active" : ""}" href="/member/getOperations">充值/补办/升级</a></li>
                    <li><a class="${param.subNav == "invoice" ? "active" : ""}" href="/member/getInvoices">发票登记</a></li>
                    <li><a class="${param.subNav == "credit" ? "active" : ""}" href="#">应收款管理</a></li>
                    <li><a class="${param.subNav == "setting" ? "active" : ""}" href="/member/getMemberCarTypes">会员类型设置</a></li>
                </ul>
            </li>
            <li class="${param.nav == "site" ? "nav-active" : ""}">
                <a href="javascript:;">
                    <img src="Content/images/navigator/venue.png?v=${static_resource_version}">
                    <span>场地预订</span>
                </a>
                <ul class="nav-sub">
                    <li><a class="${param.subNav == "sequence" ? "active" : ""}" href="/site/getSiteReservationInfo">现场预订</a></li>
                    <li><a class="${param.subNav == "batch" ? "active" : ""}" href="/site/getSiteReservationBatch">批量预订</a></li>
                    <!--<li><a class="${param.subNav == "block" ? "active" : ""}" href="#">包场预订</a></li>-->
                    <li><a class="${param.subNav == "order" ? "active" : ""}" href="#">预订订单</a></li>
                    <li><a class="${param.subNav == "pda" ? "active" : ""}" href="/site/getReservationsSequencePDA">热点概率分析</a></li>
                    <li><a class="${param.subNav == "site" ? "active" : ""}" href="/site/getSiteInfos">场地设置</a></li>
                    <li><a class="${param.subNav == "sports" ? "active" : ""}" href="/site/getSiteSports">场地类型设置</a></li>
                </ul>
            </li>
            <li class="${param.nav == "good" ? "nav-active" : ""}">
                <a href="javascript:;">
                    <img src="Content/images/navigator/cart.png?v=${static_resource_version}">
                    <span>商品管理</span>
                </a>
                <ul class="nav-sub">
                    <li><a class="${param.subNav == "setting" ? "active" : ""}" href="/good/updateGood">商品设置</a></li>
                    <li><a class="${param.subNav == "stock" ? "active" : ""}" href="/good/getGoods">进销存管理</a></li>
                    <li><a class="${param.subNav == "market" ? "active" : ""}" href="/good/getGoodsMarket">场地销售</a></li>
                    <li><a class="${param.subNav == "order" ? "active" : ""}" href="#">商品订单</a></li>
                </ul>
            </li>
            <li class="${param.nav == "data" ? "nav-active" : ""}">
                <a href="javascript:;">
                    <img src="Content/images/navigator/chart.png?v=${static_resource_version}">
                    <span>数据统计</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/data/membersRegister">会员注册统计</a></li>
                    <li><a href="/data/orderLogs">订单日志统计</a></li>
                    <!--<li><a href="/data/performanceEvaluation">用户业绩统计</a></li>-->
                    <li><a href="/data/businessIncome">营业收入统计</a></li>
                    <!--<li><a href="/data/venuePercentage">场地利用率统计</a></li>-->
                    <li><a href="/data/membersAttendance">签到记录</a></li>
                </ul>
            </li>
            <li class="${param.nav == "setting" ? "nav-active" : ""}">
                <a href="javascript:;">
                    <img src="Content/images/navigator/settings.png?v=${static_resource_version}">
                    <span>系统设置</span>
                </a>
                <ul class="nav-sub">
                    <li><a class="${param.subNav == "user" ? "active" : ""}" href="/settings/getUsers">用户设置</a></li>
                    <li><a class="${param.subNav == "role" ? "active" : ""}" href="/settings/getRoles">角色设置</a></li>
                    <li><a class="${param.subNav == "base" ? "active" : ""}" href="/settings/common">基础设置</a></li>
                    <li><a class="${param.subNav == "notification" ? "active" : ""}" href="/settings/notification">通知设置</a></li>
                    <li><a class="${param.subNav == "restore" ? "active" : ""}" href="#">数据备份</a></li>
                </ul>
            </li>
            <li class="${param.nav == "center" ? "nav-active" : ""}">
                <a href="javascript:;">
                    <img src="Content/images/navigator/user.png?v=${static_resource_version}">
                    <span>个人中心</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/center/profileComplete">我的信息</a></li>
                    <li><a href="/center/passwordModification">修改密码</a></li>
                    <!--<li><a href="#">消息记录</a></li>-->
                    <!--<li><a href="#">关于我们</a></li>-->
                    <li><a href="javascript:;" class="ww-logout">退出登录</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>
