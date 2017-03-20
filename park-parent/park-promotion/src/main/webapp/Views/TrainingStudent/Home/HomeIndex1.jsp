<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/training/student/home/index.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="module-box">
        <div class="form">
            <div class="form-banner-title">
                <div class="title-center">
                    <div class="title-text">
                        <div class="title-text-icon icon-title-text">&nbsp;</div>
                        <div class="text-content">服务项</div>
                    </div>
                    <div class="form-banner-more"></div>
                </div>
            </div>
            <div class="formMiddle formMiddle303">
                <div class="middleLeft middleLeft303">
                </div>
                <div class="middleCenter middleCenter303">
                    <div class="formMiddleContent formMiddleContent303 moduleContent">
                        <div class="cubeNavigationArea cubeNavigationArea15" id="cubeNavigation303">
                            <div class="cubeLink cubeLink1 " id="cubeNavigation303_cubeLink1">
                                <a class="cubeLink_a" href="/training/mobile/v1/course/list" id="cubeLink_a1_cubeNav303">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">预约课程<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="cubeLink cubeLink2 " id="cubeNavigation303_cubeLink2">
                                <a class="cubeLink_a" href="/training/mobile/v1/center/index" id="cubeLink_a2_cubeNav303">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">会员中心<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="cubeLink cubeLink3 " id="cubeNavigation303_cubeLink3">
                                <a class="cubeLink_a " href="/training/mobile/v1/pp/login" id="cubeLink_a3_cubeNav303">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">登录注册<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="cubeLink cubeLink4 " id="cubeNavigation303_cubeLink4">
                                <a class="cubeLink_a " href="tel:400-998-9898" id="cubeLink_a4_cubeNav303">
                                    <div class="cubeLink_bg"></div>
                                    <div class="cubeLink_curtain"></div>
                                    <div class="cubeLink_ico icon-cube"></div>
                                    <div class="cubeLink_text g_link">
                                        <div class="cubeLink_text_p ">客服咨询<p class="cubeLink_subText_p"></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="middleRight middleRight303">
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="万维培训"/>
</c:import>
