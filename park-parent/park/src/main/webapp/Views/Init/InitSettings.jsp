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

    <link href="/Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/base_new.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <script src="/Content/lib/html5shiv/html5.min.js?v=${static_resource_version}"></script>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">初始化设置</div>
        <div class="panel-body">
            <form id="init_form" class="form-horizontal" novalidate onsubmit="return false;">
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">场馆设置</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="name" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 场馆名称
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="name" name="businessName"
                                           placeholder="场馆名称" autocomplete="off"
                                           data-val="true" data-val-required="场馆名称不能为空">
                                    <div data-valmsg-for="businessName" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="count" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 安装点数量
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="count" name="points"
                                           placeholder="安装数量(0代表不限制)" autocomplete="off" value="0"
                                           data-val="true" data-val-required="安装点数量不能为空"
                                           data-val-regex-pattern="^\d+$"
                                           data-val-regex="安装点数量格式错误">
                                    <div data-valmsg-for="points" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="start_time" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 营业时间
                                </label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="start_time" name="businessStartTime"
                                           placeholder="开始时间" autocomplete="off" value="${businessStartTime}"
                                           data-val="true" data-val-required="开始时间不能为空"
                                           data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                           data-val-regex="开始时间格式错误">
                                    <div data-valmsg-for="businessStartTime" data-valmsg-replace="true"></div>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="end_time" name="businessEndTime"
                                           placeholder="结束时间" autocomplete="off" value="${businessEndTime}"
                                           data-val="true" data-val-required="结束时间不能为空"
                                           data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                           data-val-regex="结束时间格式错误">
                                    <div data-valmsg-for="businessEndTime" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">管理员设置</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="operator_no" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 管理员编号
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="operator_no" name="operatorNo"
                                           placeholder="管理员编号" autocomplete="off"
                                           data-val="true" data-val-required="管理员密码不能为空">
                                    <div data-valmsg-for="operatorNo" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="admin" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 管理员账号
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="admin"
                                           placeholder="管理员账号" disabled value="admin">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 管理员密码
                                </label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="password" name="operatorPwd"
                                           placeholder="管理员密码(6-32位数字字母下划线)" autocomplete="off"
                                           data-val="true" data-val-required="管理员密码不能为空"
                                           data-val-regex-pattern="^[A-za-z][A-Za-z0-9_]{5,31}$"
                                           data-val-regex="管理员密码格式错误">
                                    <div data-valmsg-for="operatorPwd" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="panel-footer text-right">
            <button type="button" class="btn btn-primary init-confirm">初始化系统</button>
        </div>
    </div>
</div>

<div class="modal fade" id="tips_success_modal" tabindex="-1" role="dialog"
     aria-labelledby="tips_success_modal_label">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="tips_success_modal_label">提示框</h5>
            </div>
            <div class="modal-body">
                <p class="text-success">初始化系统成功!</p>
            </div>
        </div>
    </div>
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
