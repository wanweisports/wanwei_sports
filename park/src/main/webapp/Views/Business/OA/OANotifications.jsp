<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/business/oa/oa_notifications_detail.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-tab">
            <div class="weui-navbar">
                <div class="weui-navbar__item weui-bar__item_on">
                    所有通知
                </div>
                <div class="weui-navbar__item">
                    已读通知
                </div>
                <div class="weui-navbar__item">
                    未读通知
                </div>
            </div>
            <div class="weui-tab__panel">
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">2016-11-11</label>
                            <em class="weui-form-preview__value warning-color">未读</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息标题</label>
                            <span class="weui-form-preview__value">这是一个标题</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息内容</label>
                            <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字...</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">有无附件</label>
                            <span class="weui-form-preview__value">2个附件</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default"
                           href="/business/oa/notificationsDetail">查看消息</a>
                    </div>
                </div>

                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <label class="weui-form-preview__label">2016-11-11</label>
                        <em class="weui-form-preview__value tips-color">已读</em>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息标题</label>
                            <span class="weui-form-preview__value">这是一个标题</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息内容</label>
                            <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字...</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">有无附件</label>
                            <span class="weui-form-preview__value">2个附件</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default"
                           href="/business/oa/notificationsDetail">查看消息</a>
                    </div>
                </div>
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">2016-11-11</label>
                            <em class="weui-form-preview__value warning-color">未读</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息标题</label>
                            <span class="weui-form-preview__value">这是一个标题</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息内容</label>
                            <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字...</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">有无附件</label>
                            <span class="weui-form-preview__value">2个附件</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default"
                           href="/business/oa/notificationsDetail">查看消息</a>
                    </div>
                </div>

                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <label class="weui-form-preview__label">2016-11-11</label>
                        <em class="weui-form-preview__value tips-color">已读</em>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息标题</label>
                            <span class="weui-form-preview__value">这是一个标题</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息内容</label>
                            <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字...</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">有无附件</label>
                            <span class="weui-form-preview__value">2个附件</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default"
                           href="/business/oa/notificationsDetail">查看消息</a>
                    </div>
                </div>
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">2016-11-11</label>
                            <em class="weui-form-preview__value warning-color">未读</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息标题</label>
                            <span class="weui-form-preview__value">这是一个标题</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息内容</label>
                            <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字...</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">有无附件</label>
                            <span class="weui-form-preview__value">2个附件</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default"
                           href="/business/oa/notificationsDetail">查看消息</a>
                    </div>
                </div>

                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <label class="weui-form-preview__label">2016-11-11</label>
                        <em class="weui-form-preview__value tips-color">已读</em>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息标题</label>
                            <span class="weui-form-preview__value">这是一个标题</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">消息内容</label>
                            <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字...</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">有无附件</label>
                            <span class="weui-form-preview__value">2个附件</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default"
                           href="/business/oa/notificationsDetail">查看消息</a>
                    </div>
                </div>
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
