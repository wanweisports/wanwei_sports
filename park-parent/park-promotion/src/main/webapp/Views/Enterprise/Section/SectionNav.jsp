<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--企业网站nav-->
<div class="header-bottom fixed">
    <div class="container">
        <div class="fixed-header">

            <!--网站logo-->
            <div class="logo">
                <a href="<%=basePath%>enterprise/index">
                    <h1>场馆<img src="Content/images/logo.png?v=${static_resource_version}">时代</h1>
                </a>
            </div>
            <!--//网站logo-->

            <!--网站navigator-->
            <div class="top-menu">
                <span class="menu"></span>
                <nav class="link-effect-4" id="link-effect-4">
                    <ul id="menu">
                        <li data-menuanchor="home" class="active">
                            <a data-hover="公司首页" href="#home">公司首页</a>
                        </li>
                        <li data-menuanchor="services">
                            <a data-hover="公司产品" href="#services">公司产品</a>
                        </li>
                        <li data-menuanchor="about">
                            <a data-hover="公司介绍" href="#about">公司介绍</a>
                        </li>
                        <li data-menuanchor="gallery">
                            <a data-hover="公司合作" href="#gallery">合作场馆</a>
                        </li>
                        <li data-menuanchor="contact">
                            <a data-hover="联系我们" href="#contact">联系我们</a>
                        </li>
                        <li>
                            <a data-hover="场馆运营管理系统" href="http://localhost:8080" target="_blank">场馆运营管理系统</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!--//网站navigator-->

            <div class="clearfix"></div>

        </div>
    </div>
</div>
<!--//企业网站nav-->