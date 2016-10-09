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
    <link href="Content/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <script src="Content/lib/html5shiv/html5.min.js"></script>
    <link href="Content/lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="Content/style/passport/passport_login.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
    <div class="row ww-login">
        <div class="login">
            <div class="col-md-6 login-brief">
                <img src="/public/images/logo.png">
                <p>借力互联网大数据技术，助推体育资源的整合优化，打造最优质服务的运营平台。</p>
            </div>
            <div class="col-md-6 login-form">
                <form id="login_form" method="post" autocomplete="off" novalidate="novalidate" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" name="sale_mobile" class="form-control" placeholder="手机号码"
                               value="${sale_mobile}">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="登录密码"
                               value="${password}">
                    </div>
                    <div class="form-group text-right">
                        <input type="hidden" name="return_url" value="${return_url}">
                        <button type="button" class="btn btn-primary login-btn">登 录</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="login">
            <div class="alert alert-info" role="alert">
                1. 公告公告公告公告公告公告公告公告公告公告
            </div>
            <div class="alert alert-info" role="alert">
                2. 公告公告公告公告公告公告公告公告公告
            </div>
            <div class="alert alert-info" role="alert">
                3. 公告公告公告公告公告公告公告公告公告公告公告公告
            </div>
        </div>
    </div>
</div>
<script src="Content/lib/jquery/jquery-1.12.3.min.js"></script>
<script src="Content/lib/bootstrap/bootstrap.min.js"></script>
<script src="Content/lib/jquery/jquery.validate/jquery.validate.js"></script>
<script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js"></script>
<script src="/Content/app/passport/passport_login.js"></script>

</body>
</html>
