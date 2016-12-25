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
            <div class="weui-panel__hd" style="font-size: 16px;">班级设置</div>
            <div class="weui-panel__bd">
                <div class="weui-cells weui-cells_form" style="margin-top: 0;">
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">班级名称</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="className" type="text" placeholder="例如, 兴趣班, 乔丹班"
                                   autocomplete="off">
                        </div>
                    </div>
                    <div class="weui-cell weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd">
                            <label class="weui-label">课程名称</label>
                        </div>
                        <div class="weui-cell__bd">
                            <select class="weui-select" name="courseId">
                                <option value="">请选择</option>
                                <c:forEach var="course" items="${courseNames.courseNames}">
                                    <option value="${course.id}">${course.courseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">班级描述</label>
                        </div>
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" name="classRemark" placeholder="课程描述" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">开始时间</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="startTime" type="date" placeholder="报名开始时间">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">截止日期</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="endTime" type="date" placeholder="报名截止时间">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">责任老师</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="leaderName" type="text" placeholder="责任教师">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">手机号码</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="leaderMobile" type="text" placeholder="手机号码">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">班级价格</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="classPrice" type="text" placeholder="班级价格">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:;">确 定</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="创建课程"/>
</c:import>
