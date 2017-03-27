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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <title>${param.title == null ? "万为场馆" : param.title}</title>

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

    <script src="Content/lib/amfe/flexible.js?v=${static_resource_version}"></script>
    <link href="Content/lib/reset.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/amfe/flexible.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/weui/weui.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <layout:block name="<%=Blocks.BLOCK_HEADER_CSS%>"/>
</head>
<body>
    <div class="wrapper">
        <layout:block name="<%=Blocks.BLOCK_BODY%>"/>
    </div>

    <div id="tips_failure_modal" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd tips-content"></div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary tips-know">知道了</a>
            </div>
        </div>
    </div>

    <div id="tips_confirm_modal" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd tips-content"></div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default confirm-cancel">取 消</a>
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary confirm-pay">确 定</a>
            </div>
        </div>
    </div>

    <script src="Content/lib/vue/vue.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/zepto/zepto.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/business/common/base.js?v=${static_resource_version}"></script>
    <layout:block name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"/>
    <layout:block name="<%=Blocks.BLOCK_TRACE_SCRIPTS%>"/>
</body>
</html>
