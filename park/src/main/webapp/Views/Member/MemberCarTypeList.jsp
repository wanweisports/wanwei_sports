<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<jsp:include page="/Views/Common/Resources.jsp" /> <%-- 引用公共资源 --%>
    <script src="Content/app/common/base.js"></script> <%-- 单独资源 --%>

</head>
<body>
    <div>
    	<table border="1" cellpadding="10" cellspacing="0">
    		<tr>
                <th>会员类别</th>
                <th>会员周期</th>
                <th>每周限制</th>
                <th>时间限制</th>
                <th>会员折扣</th>
                <th>价格(元)</th>
                <th>状态</th>
                <th>操作人</th>
                <th>操作时间</th>
            </tr>
	    	<c:forEach var="type" items="${list}">
	    		<tr>
	    			
	    		</tr>
	    	</c:forEach>
    	</table>
    </div>
</body>
</html>
