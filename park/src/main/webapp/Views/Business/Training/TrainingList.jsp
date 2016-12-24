<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/mobile/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <c:set var="basketball" value="篮球"/>
    <c:set var="shuttercock" value="羽毛球"/>
    <c:set var="pingpong" value="乒乓球"/>

    <div id="main" class="container">
        <div class="weui-tab">
            <div class="weui-navbar">
                <div class="weui-navbar__item weui-bar__item_on">
                    全部课程
                </div>
                <div class="weui-navbar__item">
                    未开始
                </div>
                <div class="weui-navbar__item">
                    报名中
                </div>
                <div class="weui-navbar__item">
                    已完成
                </div>
            </div>
            <div class="weui-tab__panel">
                <!--<div class="weui-btn-area">
                    <a class="weui-btn weui-btn_primary" href="/business/training/create">我要创建班级</a>
                </div>-->

                <c:forEach var="item" items="${list}">
                    <div class="weui-panel weui-panel_access">
                        <div class="weui-panel__bd">
                            <a href="/business/training/students?classId=${item.id}" class="weui-media-box weui-media-box_appmsg">
                                <div class="weui-media-box__hd">
                                    <c:choose>
                                        <c:when test="${item.courseName == shuttercock}">
                                            <img class="weui-media-box__thumb" src="/Content/images/sports/shuttercock-filled-100.png?v=${static_resource_version}">
                                        </c:when>
                                        <c:when test="${item.courseName == basketball}">
                                            <img class="weui-media-box__thumb" src="/Content/images/sports/basketball-filled-100.png?v=${static_resource_version}">
                                        </c:when>
                                        <c:when test="${item.courseName == pingpong}">
                                            <img class="weui-media-box__thumb" src="/Content/images/sports/pingpong-filled-100.png?v=${static_resource_version}">
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="weui-media-box__bd">
                                    <h4 class="weui-media-box__title">${item.className}</h4>
                                    <c:if test="${fn:length(item.classRemark) > 30}">
                                        <p class="weui-media-box__desc">${fn:substring(item.classRemark, 0, 30)}...</p>
                                    </c:if>
                                    <c:if test="${fn:length(item.classRemark) <= 30}">
                                        <p class="weui-media-box__desc">${item.classRemark}</p>
                                    </c:if>
                                </div>
                            </a>
                        </div>
                        <div class="weui-panel__ft">
                            <a href="/business/training/students?classId=${item.id}" class="weui-cell weui-cell_access weui-cell_link">
                                <c:if test="${item.unSignClass == 1}">
                                    <div class="weui-cell__bd">报名人数: 0</div>
                                    <span class="weui-cell__ft stress-color">未开始</span>
                                </c:if>
                                <c:if test="${item.signClass == 1}">
                                    <div class="weui-cell__bd">报名人数: ${item.studentsCount}</div>
                                    <span class="weui-cell__ft highlight-color">报名中</span>
                                </c:if>
                                <c:if test="${item.signedClass == 1}">
                                    <div class="weui-cell__bd">报名人数: ${item.studentsCount}</div>
                                    <span class="weui-cell__ft">已结束</span>
                                </c:if>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="课程列表"/>
</c:import>
