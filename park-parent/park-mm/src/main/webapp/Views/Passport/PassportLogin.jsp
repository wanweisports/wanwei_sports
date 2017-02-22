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

    <title>万维体育 wanweitiyu.com - 智能场馆运营的革命</title>

    <meta name="description" content="">
    <meta name="keywords" content="万维体育,wanweitiyu,智能体育场馆,体育场馆,预订,收银,万维">
    <meta name="author" content="北京万维体育">
    <link href="/Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon" />

    <script src="/Content/lib/html5shiv/html5.min.js?v=${static_resource_version}"></script>
    <link href="/Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/common/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/passport/passport_login.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
    <div class="row ww-login">
        <div class="login">
            <div class="col-md-6 login-brief">
                <img src="/Content/images/new/logo.png?v=${static_resource_version}">
                <p>借力互联网大数据技术，助推体育资源的整合，打造最优质服务的场馆运营管理平台。</p>
            </div>
            <div class="col-md-6 login-form">
                <form id="login_form" method="post" autocomplete="off" novalidate="novalidate" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="用户名"
                               value="${name}">
                    </div>
                    <div class="form-group">
                        <input type="password" name="pwd" class="form-control" placeholder="密码"
                               value="${password}">
                    </div>
                    <div class="form-group text-right">
                        <input type="hidden" name="return_url" value="${returnUrl}">
                        <button type="button" class="btn btn-primary login-btn" data-loading-text="登录中..."
                                autocomplete="off">登 录</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="login">
            <div class="alert alert-warning" role="alert">
                联系地址：${business.businessAddress}
            </div>
            <div class="alert alert-warning" role="alert">
                联系方式：${business.businessContact} - ${business.businessPhone}
            </div>
            <div class="alert alert-warning" role="alert">
                营业时间：${business.businessStartTime} - ${business.businessEndTime}
            </div>
        </div>
    </div>
</div>
<script src="/Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
<script src="/Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
<script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
<script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
<script src="/Content/app/passport/passport_login.js?v=${static_resource_version}"></script>
</body>
</html>
