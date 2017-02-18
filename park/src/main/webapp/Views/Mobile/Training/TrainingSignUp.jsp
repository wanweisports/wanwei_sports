<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/mobile/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/mobile/training/training_signup.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $("#class_id").val("${classId}").trigger("change");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <form id="signup_form">
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">姓名</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="student_name" name="studentName" class="weui-input" type="text" placeholder="您的姓名"
                               autocomplete="off">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">手机号</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="student_mobile" name="studentMobile" class="weui-input" type="tel" placeholder="您的手机号">
                    </div>
                </div>
                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label class="weui-label">报名班级</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select id="class_id" name="classId" class="weui-select">
                            <option value="0">请选择班级</option>
                            <c:forEach var="cl" items="${classList}">
                                <option value="${cl.id}">${cl.className}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">班级价格</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="pay_status" name="payStatus" value="1" type="hidden">
                        <input id="pay_price" name="payPrice" class="weui-input" type="text" value="0.00" readonly>
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">备注</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="remark" name="remark" class="weui-input" type="text" placeholder="备注">
                    </div>
                </div>
            </div>
            <label for="weuiAgree" class="weui-agree">
                <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox">
                <span class="weui-agree__text">阅读并同意<a href="javascript:void(0);">《相关条款》</a></span>
            </label>

            <div class="weui-btn-area">
                <a class="weui-btn weui-btn_primary" href="javascript:;" id="confirm_signup">确 定</a>
            </div>
        </form>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="培训报名"/>
</c:import>
