<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/coach/banner_animation.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/coach/entrance.css?v=${static_resource_version}">
    <style type="text/css">
        #cubeNavigation303_cubeLink1 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter1.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink2 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter2.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink3 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter3.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }

        #cubeNavigation303_cubeLink4 .cubeLink_bg {
            background: #000 url("/Content/images/training/coach/enter/enter4.jpg") no-repeat center;
            background-size: cover;
            opacity: 1.0;
        }
    </style>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webBannerBox" class="webBannerBox moveAnimation">
        <div id="webBanner" class="webBanner hiddenDefaultBanner">
            <div id="bannerSwipe" class="swipe" style="height: 176px; visibility: visible;">
                <div id="bannerSwipeContainer" class="bannerSwipeContainer defaultBanner">
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/banners/banner3.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/banners/banner2.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                    <div>
                        <a href="javascript:;" class="bannerImageDiv">
                            <img src="/Content/images/training/banners/banner1.jpg?v=${static_resource_version}">
                        </a>
                    </div>
                </div>
                <div id="bannerBullet" class="bannerBullet">
                    <ul id="bullets" class="bullets">
                        <li class="on"></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">

            <div class="form Handle formStyle31 moduleStyle15">
                <div class="formBannerTitle">
                    <div class="titleLeft"></div>
                    <div class="titleCenter">
                        <div class="titleText">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">服务入口</div>
                        </div>
                        <div class="formBannerMore"></div>
                    </div>
                    <div class="titleRight"></div>
                </div>
                <div class="formMiddle">
                    <div class="middleLeft"></div>
                    <div class="middleCenter">
                        <div class="formMiddleContent moduleContent">
                            <div class="cubeNavigationArea cubeNavigationArea15">
                                <div class="cubeLink" id="cubeNavigation303_cubeLink1">
                                    <a class="cubeLink_a" href="/training/coach/v1/course/list">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">课程推荐<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink" id="cubeNavigation303_cubeLink2">
                                    <a class="cubeLink_a" href="/training/coach/v1/center/index">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">个人中心<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink" id="cubeNavigation303_cubeLink3">
                                    <a class="cubeLink_a" href="/training/coach/v1/pp/login">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">登录注册<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="cubeLink" id="cubeNavigation303_cubeLink4">
                                    <a class="cubeLink_a" href="tel:400-998-9898">
                                        <div class="cubeLink_bg"></div>
                                        <div class="cubeLink_curtain"></div>
                                        <div class="cubeLink_ico icon-cube"></div>
                                        <div class="cubeLink_text g_link">
                                            <div class="cubeLink_text_p">客服咨询<p class="cubeLink_subText_p"></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight"></div>
                </div>
            </div>

            <div class="form Handle">
                <div class="formBannerTitle">
                    <div class="titleLeft"></div>
                    <div class="titleCenter">
                        <div class="titleText">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">优秀学生</div>
                        </div>
                        <div class="formBannerMore"></div>
                    </div>
                    <div class="titleRight"></div>
                </div>
                <div class="formMiddle">
                    <div class="middleLeft"></div>
                    <div class="middleCenter">
                        <div class="formMiddleContent moduleContent">
                            <div class="photoModule styleForm1">
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/coach/students/a.jpg?v=${static_resource_version}" alt="优秀学生">
                                        </div>
                                        <div class="imgName g_link">孙虎</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/coach/students/b.jpg?v=${static_resource_version}" alt="优秀学生">
                                        </div>
                                        <div class="imgName g_link">张小倩</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/coach/students/c.jpg?v=${static_resource_version}" alt="优秀学生">
                                        </div>
                                        <div class="imgName g_link">吴涛</div>
                                    </a>
                                </div>
                                <div class="g_background photoDiv photoBg">
                                    <a href="javascript:;">
                                        <div class="imgClass_160">
                                            <img class="photoListImg"
                                                 src="/Content/images/training/coach/students/d.jpg?v=${static_resource_version}" alt="优秀学生">
                                        </div>
                                        <div class="imgName g_link">王晓君</div>
                                    </a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight308"></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="万为培训"/>
</c:import>
