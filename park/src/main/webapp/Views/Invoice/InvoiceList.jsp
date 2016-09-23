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
                 <th>
                     <label><input type="checkbox" name="ticket_status" value="0"></label>
                 </th>
                 <th>序号</th>
                 <th>发票抬头</th>
                 <th>发票金额</th>
                 <th>发票内容</th>
                 <th>备注</th>
                 <th>状态</th>
                 <th>操作人</th>
                 <th>操作时间</th>
             </tr>
    	</table>
    </div>
</body>
</html>
