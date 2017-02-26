<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/settings/settings_notification.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>工作面板</span> &gt;&gt; <span>场地实时状态</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">羽毛球</div>
            <div class="panel-body">
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
                <div class="col-sm-2">.col-md-1</div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">篮球</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">乒乓球</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                    <div class="col-sm-2">.col-md-1</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="dashboard"/>
    <c:param name="subNav" value="led"/>
</c:import>
