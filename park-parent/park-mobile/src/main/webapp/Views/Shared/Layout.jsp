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
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${param.title == null || param.title eq "" ? "万维体育 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords" content="${param.keyword == null || param.keyword eq "" ? "万维体育, 智能体育场馆, 体育场馆, 预订, 收银, 万维, wanwei.com" : param.keyword}"/>
    <meta name="description" content="${param.desc == null || param.desc eq "" ? "万维体育 wanwei.com - 提供智能化的体育场馆运营服务。" : param.desc}"/>
    <meta name="author" content="北体高科技术有限公司" />

    <meta name="renderer" content="webkit|ie-comp|ie-stand">

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon" />

    <link href="Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/common/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <layout:block name="<%=Blocks.BLOCK_HEADER_CSS%>"/>

    <script src="Content/lib/html5shiv/html5.min.js?v=${static_resource_version}"></script>
</head>
<body>
    <%@ include file="../Shared/Navigator.jsp"%>

    <layout:block name="<%=Blocks.BLOCK_BODY%>"/>

    <script src="Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
    <script src="Content/dist/common/base.js?v=${static_resource_version}"></script>

    <layout:block name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"/>
    <layout:block name="<%=Blocks.BLOCK_TRACE_SCRIPTS%>"/>
</body>
</html>
