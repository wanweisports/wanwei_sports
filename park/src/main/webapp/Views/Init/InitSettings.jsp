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
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
    <form id="init_form" class="form-horizontal">
        <div class="panel panel-default">
            <div class="panel-heading">场馆设置</div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">场馆名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="businessName"
                               placeholder="场馆名称" autocomplete="off"
                               data-val="true" data-val-required="营业开始时间不能为空">
                        <div data-valmsg-for="businessName" data-valmsg-replace="true"></div>
                    </div>
                </div>
                <!--<div class="form-group">
                    <label for="logo" class="col-sm-2 control-label">场馆LOGO</label>
                    <div class="col-sm-10">
                        <input type="file" id="logo" placeholder="场馆LOGO">
                    </div>
                </div>-->
                <div class="form-group">
                    <label for="count" class="col-sm-2 control-label">安装点数量</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="count" name="points"
                               placeholder="安装数量" autocomplete="off"
                               data-val="true" data-val-required="营业开始时间不能为空">
                        <div data-valmsg-for="points" data-valmsg-replace="true"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="start_time" class="col-sm-2 control-label">
                        <span class="text-danger">*</span> 营业时间
                    </label>

                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="start_time" name="businessStartTime"
                               placeholder="请输入营业开始时间" autocomplete="off" value="${businessStartTime}"
                               data-val="true" data-val-required="营业开始时间不能为空"
                               data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                               data-val-regex="营业开始时间格式错误">
                        <div data-valmsg-for="businessStartTime" data-valmsg-replace="true"></div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="end_time" name="businessEndTime"
                               placeholder="请输入营业结束时间" autocomplete="off" value="${businessEndTime}"
                               data-val="true" data-val-required="营业结束时间不能为空"
                               data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                               data-val-regex="营业结束时间格式错误">
                        <div data-valmsg-for="businessEndTime" data-valmsg-replace="true"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">管理员设置</div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="admin" class="col-sm-2 control-label">管理员账号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="admin"
                               placeholder="管理员账号" disabled value="admin">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">管理员密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="operatorPwd"
                               placeholder="管理员密码" autocomplete="off"
                               data-val="true" data-val-required="营业结束时间不能为空">
                        <div data-valmsg-for="operatorPwd" data-valmsg-replace="true"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default" style="display: none;">
            <div class="panel-heading">数据库设置</div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="database_host" class="col-sm-2 control-label">连接地址</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="database_host" placeholder="连接地址">
                    </div>
                </div>
                <div class="form-group">
                    <label for="database_port" class="col-sm-2 control-label">端口</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="database_port" placeholder="端口">
                    </div>
                </div>
                <div class="form-group">
                    <label for="database_account" class="col-sm-2 control-label">账号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="database_account" placeholder="账号">
                    </div>
                </div>
                <div class="form-group">
                    <label for="database_password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="database_password" placeholder="密码">
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="submit" class="btn btn-primary col-sm-4 init-confirm">初始化系统</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="/Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
<script src="/Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
<script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
<script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
<script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
<script src="/Content/app/init/init_settings.js?v=${static_resource_version}"></script>
<script>
    // 配置表单校验
    $(document).ready(function () {
        $('#init_form').validate({
            ignore: ":hidden"
        });
    });
</script>
</body>
</html>
