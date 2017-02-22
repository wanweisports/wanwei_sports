<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/business/training/training_list.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/business/training/training_create.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-flex class-buttons">
            <div class="weui-flex__item">
                <div class="class-btn">
                    <a class="weui-btn weui-btn_plain-primary" href="/business/dashboard">返回首页</a>
                </div>
            </div>
            <div class="weui-flex__item">&nbsp;</div>
            <div class="weui-flex__item">
                <div class="class-btn">
                    <a class="weui-btn weui-btn_primary" href="/business/training/list">返回列表</a>
                </div>
            </div>
        </div>
        <div class="weui-panel">
            <div class="weui-panel__hd" style="font-size: 16px;">班级设置</div>
            <div class="weui-panel__bd">
                <form id="class_form" onsubmit="return false;">
                    <div class="weui-cells weui-cells_form" style="margin-top: 0;">
                        <div class="weui-cell">
                            <div class="weui-cell__hd">
                                <label class="weui-label">班级名称</label>
                            </div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" id="class_name" name="className" type="text"
                                       placeholder="例如, 兴趣班, 乔丹班" autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell weui-cell_select weui-cell_select-after">
                            <div class="weui-cell__hd">
                                <label class="weui-label">课程名称</label>
                            </div>
                            <div class="weui-cell__bd">
                                <select class="weui-select" id="course_id" name="courseId">
                                    <option value="0">请选择</option>
                                    <c:forEach var="course" items="${courseNames.courseNames}">
                                        <option value="${course.id}">${course.courseName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd">
                                <label class="weui-label">开始时间</label>
                            </div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" id="start_time" name="startTime" type="date"
                                       placeholder="报名开始时间" autocomplete="off" maxlength="10">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd">
                                <label class="weui-label">截止日期</label>
                            </div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" id="end_time" name="endTime" type="date"
                                       placeholder="报名截止时间" autocomplete="off" maxlength="10">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd">
                                <label class="weui-label">责任老师</label>
                            </div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" id="leader_name" name="leaderName" type="text"
                                       placeholder="责任教师" autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd">
                                <label class="weui-label">手机号码</label>
                            </div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" id="leader_mobile" name="leaderMobile" type="text"
                                       placeholder="手机号码" autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd">
                                <label class="weui-label">班级价格</label>
                            </div>
                            <div class="weui-cell__bd">
                                <input class="weui-input" id="class_price" name="classPrice" type="text"
                                       placeholder="班级价格" autocomplete="off">
                            </div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                            <textarea class="weui-textarea" id="class_remark" name="classRemark" placeholder="课程描述"
                                      rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:;" id="confirm_create">立即创建</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="创建课程"/>
</c:import>
