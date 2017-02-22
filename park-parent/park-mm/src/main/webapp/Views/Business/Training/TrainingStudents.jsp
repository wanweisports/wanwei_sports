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
    <div id="main" class="container">
        <div class="weui-panel">
            <div class="weui-panel__hd" style="font-size: 16px;">班级信息</div>
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_text">
                    <h4 class="weui-media-box__title">${classInfo.className}</h4>
                    <p class="weui-media-box__desc">报名时间：${classInfo.startTime} ~ ${classInfo.endTime}</p>
                    <p class="weui-media-box__desc">${classInfo.classRemark}</p>
                    <c:if test="${today >= classInfo.startTime && today <= classInfo.endTime}">
                        <div class="weui-btn-area">
                            <a class="weui-btn weui-btn_primary" href="/business/training/signup?classId=${classInfo.id}">学生报名</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="weui-panel">
            <div class="weui-panel__hd" style="font-size: 16px;">报名学生</div>
            <div class="weui-panel__bd">
                <div class="weui-cells" style="margin-top: 0;">
                    <c:forEach var="student" items="${list}">
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <c:if test="${student.payStatus == 1}">
                                    <p>${student.studentName}</p>
                                </c:if>
                                <c:if test="${student.payStatus == 2}">
                                    <p style="color: #F43530;">${student.studentName}(未支付)</p>
                                </c:if>
                            </div>
                            <div class="weui-cell__ft">${student.studentMobile}</div>
                        </div>
                    </c:forEach>
                </div>
                <c:if test="${fn:length(list) == 0}">
                    <div class="weui-msg">
                        <div class="weui-msg__text-area">
                            <p class="weui-msg__desc">还没有检索到任何的学生！</p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_plain-primary" href="/business/training/list">返回班级列表</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="报名学生"/>
</c:import>
