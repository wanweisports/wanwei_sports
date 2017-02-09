<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/echarts/echarts.min.js?v=${static_resource_version}"></script>
    <script src="/Content/app/data/data_members_register.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".member-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".member-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>数据统计</span> &gt;&gt; <span>会员办理统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">会员办理统计</div>
            <div class="panel-body">
                <form id="data_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/data/getMembersRegister?countNum=1" data-count="1" class="btn btn-default member-date">今日</a>
                            <a href="/data/getMembersRegister?countNum=3" data-count="3" class="btn btn-default member-date">本周</a>
                            <a href="/data/getMembersRegister?countNum=4" data-count="4" class="btn btn-default member-date">本月</a>
                            <a href="/data/getMembersRegister?countNum=4" data-count="4" class="btn btn-default member-date">本年</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"
                               placeholder="开始日期" value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd"
                               placeholder="结束日期" value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary data-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="javascript:;" class="btn btn-danger">
                            <span class="glyphicon glyphicon-export"></span> 导出数据
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">会员注册数量</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered data-members-count">
                        <thead>
                        <tr class="bg-info">
                            <th>会员类型</th>
                            <c:forEach var="title" items="${register.titleList}">
                           	<th>${title}</th>
                            </c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="o" items="${register.list}">
                        	<tr>
                        		<td>${o.cardTypeName}</td>
                        		<td>${o.count}</td>
                        		<c:forEach begin="0" end="${register.num}" varStatus="vs">
                        			<c:set var="key" value="d${vs.index }"  />
                        			<td>${o[key]}</td> 
                        		</c:forEach>
                        	</tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="member_count_chart" style="width: 100%; height: 300px;"></div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">会员储值金额</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr class="bg-info">
                            <th>会员类型</th>
                            <c:forEach var="title" items="${cz.titleList}">
                           	<th>${title}</th>
                            </c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="o" items="${cz.list}">
                        	<tr>
                        		<td>${o.cardTypeName}</td>
                        		<td>${o.realAmountSum}</td>
                        		<c:forEach begin="0" end="${cz.num}" varStatus="vs">
                        			<c:set var="key" value="d${vs.index }"  />
                        			<td>${o[key]}</td> 
                        		</c:forEach>
                        	</tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="member_stored_chart" style="width: 100%; height: 400px;"></div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">会员储值金额</div>
            <div class="panel-body">
                <div class="col-sm-8">
                    <div class="table-responsive" style="margin-top: 20px;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="bg-info">
                                <th>会员类型</th>
                                <th>场租消费</th>
                                <th>商品消费</th>
                                <th>会员储值余额</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="o" items="${xf.list}">
                           		<tr>
                           			<td>${o.cardTypeName}</td>
                           			<td>${o.siteXF}</td>
                           			<td>${o.goodsXF}</td>
                           			<td>${o.cardBalance}</td>
                           		</tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div id="member_consume_chart" style="width: 100%; height: 200px;"></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="register"/>
</c:import>
