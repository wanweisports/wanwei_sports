<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>"></layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"></layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>"></layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="备份恢复数据库"/>
</c:import>
