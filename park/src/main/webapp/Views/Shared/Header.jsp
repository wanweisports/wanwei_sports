<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>万维体育 wanweitiyu.com - 智能场馆管理系统</title>

    <meta name="description" content="">
    <meta name="keywords" content="万维体育,wanweitiyu,智能体育场馆,体育场馆,预订,收银,万维">
    <meta name="author" content="北体高科技术有限公司">
    <link href="Content/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <script src="Content/lib/html5shiv/html5.min.js"></script>
    <link href="Content/lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="Content/style/home/index.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
        <header class="ww-header">
    <div class="header">
        <div class="ww-logo">
            <img src="Content/images/logo.png" class="logo-icon">
        </div>
        <ul class="ww-nav">
            <li class="nav-home ">
                <a href="/">
                    <img src="Content/images/navigator/home.png">
                    <span>工作平台</span>
                </a>
            </li>
            <li class="nav-active">
                <a href="javascript:;">
                    <img src="Content/images/navigator/users.png">
                    <span>会员管理</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="member/regMember">新会员注册</a></li>
                    <li><a href="member/memberList">会员查询</a></li>
                    <li><a href="member/getOperations">会员操作</a></li>
                    <li><a href="member/getInvoices">发票登记</a></li>
                    <li><a href="#">应收款管理</a></li>
                    <li><a href="member/getMemberCarTypes">会员类型设置</a></li>
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="Content/images/navigator/venue.png">
                    <span>场地预订</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="site/getSiteReservationInfo">现场预订</a></li>
                    <li><a href="/venue/batchReserve">批量预订</a></li>
                    <!--<li><a href="#">包场预订</a></li>-->
                    <li><a href="/venue/sequencePDA">热点概率分析</a></li>
                    <li><a href="site/getSiteInfos">场地设置</a></li>
                    <li><a href="site/getSiteSports">场地类型设置</a></li>
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="Content/images/navigator/cart.png">
                    <span>商品管理</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="good/updateGood">商品设置</a></li>
                    <li><a href="good/getGoods">进销存管理</a></li>
                    <li><a href="good/getGoodsMarket">商品销售</a></li>
                    <!--<li><a href="#">商品订单</a></li>-->
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="Content/images/navigator/chart.png">
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
            <li class="">
                <a href="javascript:;">
                    <img src="Content/images/navigator/settings.png">
                    <span>系统设置</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/settings/systemUsers">用户设置</a></li>
                    <li><a href="/settings/systemRoles">角色设置</a></li>
                    <li><a href="/settings/common">基础设置</a></li>
                    <li><a href="/settings/notification">通知设置</a></li>
                    <!--<li><a href="#">数据库导入导出</a></li>-->
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="Content/images/navigator/user.png">
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
