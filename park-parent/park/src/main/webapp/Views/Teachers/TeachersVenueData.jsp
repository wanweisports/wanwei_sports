<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>教师管理</span> &gt;&gt; <span>教师用场统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">教师用场统计</div>
            <div class="panel-body">
                <form class="form-inline" id="data_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="student_sports" name="student_sports" style="width: 160px;">
                            <option value="">全部场地</option>
                            <option value="1">羽毛球</option>
                            <option value="2">篮球</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="student_name" name="memberName" value="${memberName}"
                               placeholder="请输入教师姓名">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="startTime" placeholder="开始日期"
                               value="${startTime}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="endTime" placeholder="结束日期"
                               value="${endTime}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">场地类型总计:</li>
                <c:forEach var="c" items="${itemCounts}">
                	<li style="margin-right: 15px;">${c.sportName}<span class="badge">${c.typeCount}次</span><span class="badge">${c.typeTime}小时</span></li>
                </c:forEach>
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger" onclick="window.open('/teachers/exportTeachersVenueData?'+$('#data_filter_form').serialize());">
                    <span class="glyphicon glyphicon-export"></span> 导出数据
                </a>
                <a href="javascript:;" class="btn btn-primary" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>序号</th>
                            <th>教师姓名</th>
                            <th>手机号</th>
                            <th>签到时间</th>
                            <th>用场时长</th>
                            <th>场地类型</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="t" items="${pageBean.list}">
                        	<tr>
	                            <td>${t.signId}</td>
	                            <td>${t.memberName}</td>
	                            <td>${t.memberMobile}</td>
	                            <td>${t.signTime}</td>
	                            <td>${t.duration}</td>
	                            <td>${t.sportName}</td>
	                            <td>${t.operatorName}</td>
	                            <td>${t.opTime}</td>
                        	</tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="teacher"/>
    <c:param name="subNav" value="data"/>
</c:import>
