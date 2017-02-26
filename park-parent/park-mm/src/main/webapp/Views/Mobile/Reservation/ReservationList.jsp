<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/mobile/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-tab">
            <div class="weui-navbar">
                <div class="weui-navbar__item weui-bar__item_on">
                    全部
                </div>
                <div class="weui-navbar__item">
                    未完成
                </div>
                <div class="weui-navbar__item">
                    已完成
                </div>
            </div>
            <div class="weui-tab__panel">
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">付款金额</label>
                            <em class="weui-form-preview__value">¥2400.00</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">场地类型</label>
                            <span class="weui-form-preview__value">羽毛球运动</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">场地编号</label>
                            <span class="weui-form-preview__value">场地1</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">预订时段</label>
                            <span class="weui-form-preview__value">2016-11-12 12:00-13:00</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">删除</a>
                    </div>
                </div>
                <br>
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">付款金额</label>
                            <em class="weui-form-preview__value warning-color">¥2400.00</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">场地类型</label>
                            <span class="weui-form-preview__value">羽毛球运动</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">场地编号</label>
                            <span class="weui-form-preview__value">场地1</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">预订时段</label>
                            <span class="weui-form-preview__value">2016-11-12 12:00-13:00</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">取消</a>
                        <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">去付款</a>
                    </div>
                </div>
                <br>
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">付款金额</label>
                            <em class="weui-form-preview__value">¥2400.00</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">场地类型</label>
                            <span class="weui-form-preview__value">羽毛球运动</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">场地编号</label>
                            <span class="weui-form-preview__value">场地1</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">预订时段</label>
                            <span class="weui-form-preview__value">2016-11-12 12:00-13:00</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">取消</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="我的订单"/>
</c:import>
