<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/mobile/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <style>
        .weui-media-box__desc {
            -webkit-line-clamp: inherit;
        }
    </style>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-panel">
            <div class="weui-panel__hd">通知详情</div>
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_text">
                    <h4 class="weui-media-box__title">${noteTitle}</h4>
                    <p class="weui-media-box__desc">${noteContent}</p>
                    <ul class="weui-media-box__info">
                        <li class="weui-media-box__info__meta">发送时间</li>
                        <li class="weui-media-box__info__meta">${sendTime}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="weui-form-preview">
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_default" data-id="${note.noteId}"
                   href="javascript:;">删 除</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="消息详情"/>
</c:import>
