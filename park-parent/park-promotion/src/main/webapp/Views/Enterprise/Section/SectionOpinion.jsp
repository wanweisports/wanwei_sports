<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="section" data-anchor="contact">
    <!--联系我们和意见反馈-->
    <div class="contact_w3agile" id="contact_page">
        <div class="container wow fadeInUp animated animated" data-wow-delay=".5s"
             style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">

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
        <script src="Content/app/enterprise/enterprise_opinion.js?v=${static_resource_version}"></script>
        <!--//联系我们和意见反馈-->
    </div>

    <!--企业网站footer-->
    <div class="footer">
        <div class="footer-info">
            <div class="container">
                <p>Copyright &copy; 2014-2017 北体高科（北京）科技有限公司</p>
                <p>京ICP备15016022号-1</p>
            </div>
        </div>
    </div>
    <!--//企业网站footer-->
</div>
