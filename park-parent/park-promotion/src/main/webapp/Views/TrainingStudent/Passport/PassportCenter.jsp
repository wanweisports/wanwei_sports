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
        <div class="weui-cells__title">我的信息</div>
        <div class="weui-cells">
            <a class="weui-cell" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>姓名</p>
                </div>
                <div class="weui-cell__ft">张三</div>
            </a>
            <a class="weui-cell" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>手机号码</p>
                </div>
                <div class="weui-cell__ft">11012341234</div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>联系地址</p>
                </div>
                <div class="weui-cell__ft">北京市海淀区</div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>修改密码</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
        </div>

        <div class="weui-cells">
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>我的课程</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>课程表</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
        </div>

        <div class="weui-cells">
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>意见反馈</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>联系我们</p>
                </div>
                <div class="weui-cell__ft">400-010-1111</div>
            </a>
        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_warn" href="/mobile/dashboard">退出登录</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="完善信息"/>
</c:import>
