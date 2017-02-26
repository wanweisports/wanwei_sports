<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--联系我们和意见反馈-->
<div class="contact_w3agile" id="contact">
    <div class="container wow fadeInUp animated animated" data-wow-delay=".5s"
         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
        <h2 class="title">联系我们</h2>

        <form id="form_opinion" method="post" onsubmit="return false;">
            <input type="text" value="输入您的姓名" name="name" autocomplete="off" onfocus="this.value='';"
                   onblur="if (this.value == '') {this.value ='输入您的姓名';}">
            <input type="tel" value="输入您的手机号" name="mobile" autocomplete="off" onfocus="this.value='';"
                   onblur="if (this.value == '') {this.value ='输入您的手机号';}">
            <textarea name="opinion" onfocus="this.value = '';"
                      onblur="if (this.value == '') {this.value = '请输入您的意见建议';}">请输入您的意见建议</textarea>
            <div class="con-form text-center">
                <input type="button" value="立即提交" id="submit_opinion">
            </div>
        </form>

    </div>
</div>
<script src="Content/app/enterprise/enterprise_opinion.js?v=${static_resource_version}"></script>
<!--//联系我们和意见反馈-->
