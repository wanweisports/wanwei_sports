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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">

    <title>${param.title == null || param.title eq "" ? "万维体育 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords" content="${param.keyword == null || param.keyword eq "" ? "万维体育, 智能体育场馆, 体育场馆, 预订, 收银, 万维, wanwei.com" : param.keyword}"/>
    <meta name="description" content="${param.desc == null || param.desc eq "" ? "万维体育 wanwei.com - 提供智能化的体育场馆运营服务。" : param.desc}"/>
    <meta name="author" content="北体高科技术有限公司" />

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon">

    <link href="Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/font-awesome/font-awesome.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/animate/animate.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</head>

<body class="fixed-sidebar full-height-layout gray-bg pace-done" style="overflow:hidden">

<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i></div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span>
                            <img alt="image" class="img-circle" src="Content/images/profile_small.jpg?v=${static_resource_version}">
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:" aria-expanded="false">
                        <span class="clear">
                            <span class="block m-t-xs">
                                <strong class="font-bold">Beaut-zihan</strong>
                                <b class="caret"></b>
                            </span>
                            <!--<span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>-->
                        </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="#">修改头像</a></li>
                            <li><a class="J_menuItem" href="#">个人资料</a></li>
                            <li><a class="J_menuItem" href="#">联系我们</a></li>
                            <li><a class="J_menuItem" href="#">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="#">安全退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">场馆+</div>
                </li>
                <li class="line dk"></li>

                <li>
                    <a class="J_menuItem" href="/home/dashboard" data-index="0">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">工作面板</span>
                    </a>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="#">
                        <i class="fa fa-user"></i>
                        <span class="nav-label">会员管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/member/regMember">会员办卡</a></li>
                        <li><a class="J_menuItem" href="/member/memberList" data-index="0">会员查询</a></li>
                        <li><a class="J_menuItem" href="/member/getMembersCardRecharge">会员卡充值</a></li>
                        <li><a class="J_menuItem" href="/member/getMembersCardRefresh">会员卡补办</a></li>
                        <li><a class="J_menuItem" href="/member/getMembersLoans">应收款管理</a></li>
                        <li><a class="J_menuItem" href="/member/getInvoices?invoiceOpenState=2&invoiceState=2">发票登记</a></li>
                        <li><a class="J_menuItem" href="/member/getMemberCarTypes">会员类型设置</a></li>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="#">
                        <i class="fa fa-calendar"></i>
                        <span class="nav-label">场地预订</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/site/getSiteReservationInfo">场地预订</a></li>
                        <li><a class="J_menuItem" href="/site/getSiteReservationFixed">场地快捷预订</a></li>
                        <li><a class="J_menuItem" href="/site/getSiteReservationBatch">场地批量预订</a></li>
                        <li><a class="J_menuItem" href="/order/getOrderList?orderServiceTypes=100,200">场地预订订单</a></li>
                        <li><a class="J_menuItem" href="/site/getSiteInfos">场地设置</a></li>
                        <li><a class="J_menuItem" href="/site/getSiteSports">场地类型设置</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-cart-plus"></i>
                        <span class="nav-label">商品管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/good/getGoodsMarket">商品销售</a></li>
                        <li><a class="J_menuItem" href="/order/getOrderList?orderServiceTypes=300">商品订单</a></li>
                        <li><a class="J_menuItem" href="/good/typeGood">商品类别设置</a></li>
                        <li><a class="J_menuItem" href="/good/settingGood">商品设置</a></li>
                        <li><a class="J_menuItem" href="/good/getGoods">商品查询</a></li>
                        <li><a class="J_menuItem" href="/good/getGoodsStock?countNum=21">商品进销存</a></li>
                        <li><a class="J_menuItem" href="/good/getGoodsStockDetails?countNum=21">商品操作明细</a></li>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="#">
                        <i class="fa fa-bar-chart-o"></i>
                        <span class="nav-label">数据统计</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/data/getMembersRegister?countNum=21">会员办理统计</a></li>
                        <li><a class="J_menuItem" href="/data/getBusinessIncomeLog?countNum=21">营业流水日志</a></li>
                        <li><a class="J_menuItem" href="/data/getBusinessIncome?countNum=21">营业收支统计</a></li>
                        <li><a class="J_menuItem" href="/data/getVenuePercentage?countNum=21">场地使用率</a></li>
                        <li><a class="J_menuItem" href="/data/getMembersAttendance?countNum=21">场地签到记录</a></li>
                        <li><a class="J_menuItem" href="/data/getAllReports?countNum=21">常用报表</a></li>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="#">
                        <i class="fa fa-desktop"></i>
                        <span class="nav-label">办公系统</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/office/schedule?countNum=21">值班安排</a></li>
                        <li><a class="J_menuItem" href="/office/getTrainsCourseList">培训课程管理</a></li>
                        <li><a class="J_menuItem" href="/office/getTrainsClassList">培训班级管理</a></li>
                    </ul>
                </li>
                <li class="line dk"></li>

                <li>
                    <a href="#">
                        <i class="fa fa-cogs"></i>
                        <span class="nav-label">系统设置</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/settings/common">场馆设置</a></li>
                        <li><a class="J_menuItem" href="/settings/getUsers">员工信息设置</a></li>
                        <li><a class="J_menuItem" href="/settings/getRoles">员工权限设置</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->

    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-success" href="javascript:;">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form role="search" class="navbar-form-custom" method="post" action="">
                        <div class="form-group">
                            <input type="text" placeholder="请输入要搜索的内容..." class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i>
                            <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li class="m-t-xs">
                                <div class="dropdown-messages-box">
                                    <a href="#" class="pull-left">
                                        <img alt="image" class="img-circle" src="Content/images/a7.jpg?v=${static_resource_version}">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>李老师</strong> ...
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="#" class="pull-left">
                                        <img alt="image" class="img-circle" src="Content/images/a4.jpg?v=${static_resource_version}">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>张老师</strong> ...
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="#">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="notifications.html">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="/home/dashboard">工作面板</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                </ul>
            </div>
            <a href="/passport/login" class="roll-nav roll-right J_tabExit"><i class="fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/home/dashboard" frameborder="0"
                    data-id="dashboard" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">Copyright &copy; 2016. 北体高科技有限公司 All rights reserved.</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
<script src="Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
<script src="Content/lib/plugins/metisMenu/jquery.metisMenu.js?v=${static_resource_version}"></script>
<script src="Content/lib/plugins/slimscroll/jquery.slimscroll.min.js?v=${static_resource_version}"></script>
<script src="Content/lib/plugins/layer/layer.min.js?v=${static_resource_version}"></script>
<script src="Content/lib/plugins/hplus.min.js?v=${static_resource_version}"></script>

<!-- 第三方插件 -->
<script src="Content/lib/plugins/contabs.min.js?v=${static_resource_version}"></script>
<script src="Content/lib/plugins/pace/pace.min.js?v=${static_resource_version}"></script>
</body>
</html>

