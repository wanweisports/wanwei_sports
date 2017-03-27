<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-cells">
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>完善信息</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>重置密码</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>消息通知</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
        </div>
        <div class="weui-cells">
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>关于我们</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>联系我们</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
        </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:">退出登录</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="会员中心"/>
</c:import>
