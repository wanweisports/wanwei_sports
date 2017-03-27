<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/business/training/training_list.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/business/training/training_class.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".class-status.weui-bar__item_on").removeClass("weui-bar__item_on");
            $(".class-status[data-status='${classStatus}']").addClass("weui-bar__item_on");

            if ($(".class-status.weui-bar__item_on").size() === 0) {
                $(".class-status-all").addClass("weui-bar__item_on");
            }
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <c:set var="basketball" value="篮球"/>
    <c:set var="shuttercock" value="羽毛球"/>
    <c:set var="pingpong" value="乒乓球"/>

    <div id="main" class="container">
        <div class="weui-tab">
            <div class="weui-navbar class-status-select">
                <div class="weui-navbar__item weui-bar__item_on class-status class-status-all">全部课程</div>
                <div class="weui-navbar__item class-status" data-status="1">未开始</div>
                <div class="weui-navbar__item class-status" data-status="2">报名中</div>
                <div class="weui-navbar__item class-status" data-status="3">已完成</div>
            </div>
            <div class="weui-tab__panel">
                <c:if test="${fn:length(list) == 0}">
                    <div class="weui-msg">
                        <div class="weui-msg__text-area">
                            <p class="weui-msg__desc">还没有检索到任何的培训班级！</p>
                        </div>
                    </div>

                    <div class="weui-btn-area">
                        <a class="weui-btn weui-btn_primary" href="/business/training/create">直接创建班级</a>
                        <a class="weui-btn weui-btn_plain-primary" href="/business/dashboard">返回首页</a>
                    </div>
                </c:if>

                <c:if test="${fn:length(list) > 0}">
                    <div class="weui-flex class-buttons">
                        <div class="weui-flex__item">
                            <div class="class-btn">
                                <a class="weui-btn weui-btn_plain-primary" href="/business/dashboard">返回首页</a>
                            </div>
                        </div>
                        <div class="weui-flex__item">&nbsp;</div>
                        <div class="weui-flex__item">
                            <div class="class-btn">
                                <a class="weui-btn weui-btn_primary" href="/business/training/create">创建班级</a>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:forEach var="item" items="${list}">
                    <div class="weui-panel weui-panel_access">
                        <div class="weui-panel__bd">
                            <a href="/business/training/students?classId=${item.id}" class="weui-media-box weui-media-box_appmsg">
                                <div class="weui-media-box__hd">
                                    <c:choose>
                                        <c:when test="${item.courseName == shuttercock}">
                                            <img class="weui-media-box__thumb" src="Content/images/sports/shuttercock-filled-100.png?v=${static_resource_version}">
                                        </c:when>
                                        <c:when test="${item.courseName == basketball}">
                                            <img class="weui-media-box__thumb" src="Content/images/sports/basketball-filled-100.png?v=${static_resource_version}">
                                        </c:when>
                                        <c:when test="${item.courseName == pingpong}">
                                            <img class="weui-media-box__thumb" src="Content/images/sports/pingpong-filled-100.png?v=${static_resource_version}">
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="weui-media-box__bd">
                                    <h4 class="weui-media-box__title">${item.className}</h4>
                                    <c:if test="${item.unSignClass == 1}">
                                        <p class="weui-media-box__desc stress-color">报名费：${item.classPrice}元</p>
                                    </c:if>
                                    <c:if test="${item.signClass == 1}">
                                        <p class="weui-media-box__desc highlight-color">报名费：${item.classPrice}元</p>
                                    </c:if>
                                    <c:if test="${item.signedClass == 1}">
                                        <p class="weui-media-box__desc">报名费：${item.classPrice}元</p>
                                    </c:if>
                                    <c:if test="${fn:length(item.classRemark) > 30}">
                                        <p class="weui-media-box__desc">${fn:substring(item.classRemark, 0, 10)}...</p>
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
