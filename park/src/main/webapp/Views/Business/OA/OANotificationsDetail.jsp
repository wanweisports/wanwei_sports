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
        <article class="weui-article">
            <h1>通知消息标题</h1>
            <section>
                <p>通知消息内容通知消息内容通知消息内容通知消息内容, 通知消息内容通知消息内容通知消息内容通知消息内容, 通知消息内容通知消息内容通知消息内容通知消息内容,
                    通知消息内容通知消息内容通知消息内容通知消息内容, 通知消息内容通知消息内容通知消息内容通知消息内容.</p>
            </section>
        </article>

        <div class="weui-cells__title">附件</div>
        <div class="weui-cells">
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>员工业绩表</p>
                </div>
                <div class="weui-cell__ft">2016-11-21</div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>身份证照片</p>
                </div>
                <div class="weui-cell__ft">张三</div>
            </a>

        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="消息详情"/>
</c:import>
