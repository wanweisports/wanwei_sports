<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/business/oa/oa_notifications_detail.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script>
        $(document).ready(function () {
            $(".note-type.weui-bar__item_on").removeClass("weui-bar__item_on");
            $(".note-type[data-type='${type}']").addClass("weui-bar__item_on");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-tab">
            <div class="weui-navbar">
                <a href="/business/oa/getNotifications?type=2" data-type="2" class="weui-navbar__item note-type weui-bar__item_on">发件箱</a>
                <a href="/business/oa/getNotifications?type=1" data-type="1" class="weui-navbar__item note-type">草稿箱</a>
                <a href="/business/oa/getNotifications?type=4" data-type="4" class="weui-navbar__item note-type">垃圾箱</a>
            </div>
            <div class="weui-tab__panel">
                <c:forEach var="note" items="${list}">
                    <div class="weui-form-preview">
                        <div class="weui-form-preview__hd">
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">${note.sendTime}</label>
                                <em class="weui-form-preview__value warning-color">已发送</em>
                            </div>
                        </div>
                        <div class="weui-form-preview__bd">
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">消息标题</label>
                                <span class="weui-form-preview__value">${note.noteTitle}</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">消息内容</label>
                                <span class="weui-form-preview__value">${note.noteContent.substring(0, 18)}...</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">收件人</label>
                                <span class="weui-form-preview__value">${note.operatorName}</span>
                            </div>
                        </div>
                        <div class="weui-form-preview__ft">
                            <a class="weui-form-preview__btn weui-form-preview__btn_default" data-id="${note.noteId}"
                               href="javascript:;">删 除</a>
                            <a class="weui-form-preview__btn weui-form-preview__btn_primary" data-id="${note.noteId}"
                               href="/business/oa/notificationsDetail?noteId=${note.noteId}">查看消息</a>
                        </div>
                    </div>
                </c:forEach>
                <div class="weui-loadmore">
                    <i class="weui-loading"></i>
                    <span class="weui-loadmore__tips">正在加载</span>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="消息列表"/>
</c:import>
