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
	<title>会员列表</title>
	<jsp:include page="/Views/Common/Resources.jsp" /> <%-- 引用公共资源 --%>
    <script src="Content/app/common/base.js"></script> <%-- 单独资源 --%>

</head>
<body>
    <div>
    	<table border="1" cellpadding="10" cellspacing="0">
    		<tr>
               <th>#</th>
               <th>姓名</th>
               <th>手机号码</th>
               <th>身份证号</th>
               <th>会员卡号</th>
               <th>会员类型</th>
               <th>有效期至</th>
               <th>余额(元)</th>
               <th>状态</th>
               <th>操作人</th>
               <th>注册时间</th>
               <th>操作</th>
            </tr>
	    	<c:forEach var="member" items="${list}">
	    		<tr>
	    			<td>${member.memberId}</td>
	    			<td>${member.memberName}</td>
	    			<td>${member.memberMobile}</td>
	    			<td>${member.memberIdcard}</td>
	    			<td>${member.cardNo}</td>
	    			<td>${member.cardTypeName}</td>
	    			<td>${member.cardDeadline}</td>
	    			<td>${member.cardBalance}</td>
	    			<td>
	    				<c:if test="${member.cardStatus==1}">
	    					有效
	    				</c:if>
	    				<c:if test="${member.cardStatus==2}">
	    					失效
	    				</c:if>
					</td>
	    			<td>${member.operatorName}</td>
	    			<td>${member.createTime}</td>
	    			<td>查看</td>
	    		</tr>
	    	</c:forEach>
    	</table>
    </div>
</body>
</html>
