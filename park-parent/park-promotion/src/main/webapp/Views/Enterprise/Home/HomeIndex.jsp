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
    <base href="<%=basePath %>">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">

    <title>${param.title == null || param.title eq "" ? "北体高科技有限公司 idawn.com" : param.title}</title>

    <meta name="keywords" content="${param.keyword == null || param.keyword eq "" ? "万维体育, 智能体育场馆, 体育场馆, 预订, 收银, 万维, wanwei.com" : param.keyword}"/>
    <meta name="description" content="${param.desc == null || param.desc eq "" ? "万维体育 wanwei.com - 提供智能化的体育场馆运营服务。" : param.desc}"/>
    <meta name="author" content="北体高科技术有限公司" />

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon">

    <link href="Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/animate/animate.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/jquery/swipebox/css/swipebox.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/jquery/ui.totop/css/ui.totop.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/ecoicons.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <!-- 全局js -->
    <script src="Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.easing.1.3.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/ui.totop/js/jquery.ui.totop.min.js?v=${static_resource_version}"></script>

    <!--/script-->
    <script type="text/javascript">
        $(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });
    </script>

    <!-- swipe box js -->
    <script src="Content/lib/jquery/swipebox/js/jquery.swipebox.min.js?v=${static_resource_version}"></script>
    <script type="text/javascript">
        $(function ($) {
            $(".swipebox").swipebox();
        });
    </script>
    <!-- //swipe box js -->
</head>
<body>

    <%@ include file="../Section/SectionHeader.jsp"%>
    <%@ include file="../Section/SectionServices.jsp"%>
    <%@ include file="../Section/SectionAbout.jsp"%>
    <%@ include file="../Section/SectionGallery.jsp"%>
    <%@ include file="../Section/SectionTeams.jsp"%>
    <%@ include file="../Section/SectionOpinion.jsp"%>
    <%@ include file="../Section/SectionFooter.jsp"%>

    <!-- animation-effect -->
    <script src="Content/lib/wow/wow.js?v=${static_resource_version}"></script>
    <script type="text/javascript">
        new WOW().init();
    </script>
    <!-- //animation-effect -->

</body>
</html>
