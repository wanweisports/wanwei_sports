<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

    <title>${param.title == null ? "万为场馆 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords"
          content="${param.keyword == null ? "万为场馆, 管理系统, 体育场馆, 预订，万为, wanwei.com" : param.keyword}">
    <meta name="description"
          content="${param.desc == null ? "万为场馆 - 提供智能化的场馆运营管理服务平台。" : param.desc}">
    <meta name="author" content="北体高科（北京）科技有限公司">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon">

    <link href="Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/font-awesome/font-awesome.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/animate/animate.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/hplus.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <link href="Content/style/passport/passport_login.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
</head>

<body class="login">
    <div class="login-panel">
        <div class="row">
            <div class="col-sm-7">
                <div class="login-info">
                    <div class="logo m-b">
                        <h1>
                            <span>场馆</span>
                            <img src="Content/images/company.png?v=${static_resource_version}">
                            <span>时代</span>
                        </h1>
                    </div>
                    <div class="m-b"></div>
                    <p>借力互联网大数据技术，助推体育资源的整合，提供最优质客户服务的智能场馆运营管理平台。</p>
                    <ul class="m-b">
                        <li>
                            <i class="fa fa-arrow-circle-o-right m-r-xs"></i> 营业时间：${business.businessStartTime} - ${business.businessEndTime}
                        </li>
                        <li>
                            <i class="fa fa-arrow-circle-o-right m-r-xs"></i> 联系人：${business.businessContact}
                        </li>
                        <li>
                            <i class="fa fa-arrow-circle-o-right m-r-xs"></i> 联系电话：${business.businessContact} - ${business.businessPhone}
                        </li>
                        <li>
                            <i class="fa fa-arrow-circle-o-right m-r-xs"></i> 联系地址：${business.businessAddress}
                        </li>
                    </ul>
                    <strong style="display: none;">还没有账号？ <a href="#">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form id="form_login" method="post" autocomplete="off" novalidate="novalidate" onsubmit="return false;">
                    <h4 class="no-margins">用户登录：</h4>
                    <input type="text" name="name" class="form-control text-name" placeholder="账户" value="${name}"
                           data-val="true" data-val-required="用户账户不能为空">
                    <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                    <input type="password" name="pwd" class="form-control text-password m-b" placeholder="密码"
                           value="${password}"
                           data-val="true" data-val-required="用户密码不能为空">
                    <div data-valmsg-for="pwd" data-valmsg-replace="true"></div>
                    <a href="#">忘记密码</a>

                    <button class="btn btn-success btn-block btn-login">登 录</button>
                </form>
            </div>
        </div>
        <div class="login-footer">
            <div class="pull-left">Copyright &copy; 2016. 北体高科（北京）科技有限公司 All rights reserved.</div>
        </div>
    </div>

    <script src="Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/passport/passport_login.js?v=${static_resource_version}"></script>
</body>
</html>
