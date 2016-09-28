<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
     
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li><a href="/users/membersQuery">会员查询</a></li>
            <li><a href="/users/membersView/1">会员详情</a></li>
            <li class="active">订单明细</li>
        </ol>
        <a href="/users/membersConsume" class="btn btn-primary pull-right" style="margin-top: -58px;">
            <span class="glyphicon glyphicon-th-list"></span> 消费明细
        </a>
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline">
                    <div class="form-group">
                        <select class="form-control">
                            <option>订单类型</option>
                            <option>注册会员</option>
                            <option>会员充值</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" placeholder="开始时间">
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" placeholder="结束时间">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="手机号">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索订单
                        </a>
                    </div>
                </form>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive card-type-list">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>交易流水号</th>
                                <th>会员姓名</th>
                                <th>订单类型</th>
                                <th>支付方式</th>
                                <th>支付金额</th>
                                <th>订单状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="balance" items="${list }">
	                            <tr>
	                                <td>${balance.balanceId }</td>
	                                <td>${balance.balanceNo }</td>
	                                <td>${balance.memberName }</td>
	                                <td>${balance.balanceServiceTypeName }</td>
	                                <td>${balance.balanceStyleName }</td>
	                                <td>${balance.realAmount }</td>
	                                <td>${balance.balanceStatus }</td>
	                                <td>${balance.operatorName }</td>
	                                <td>${balance.createTime }</td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav class="pull-right">
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize }条/页</span>
                                <span>总${count}条</span>
                            </p>
                            <ul class="pagination pull-right">
                                <li><a href="javascript:;" onclick="window.location.href='member/getBalances?page=1'"><span>首页</span></a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/getBalances?page=${currentPage-1}'"><span>上一页</span></a></li>
                                <li><a href="javascript:;">1</a></li>
                                <li class="active"><a href="javascript:;">2</a></li>
                                <li><a href="javascript:;">3</a></li>
                                <li><a href="javascript:;">...</a></li>
                                <li><a href="javascript:;">11</a></li>
                                <li><a href="javascript:;">12</a></li>
                                <li><a href="javascript:;">13</a></li>
                                <li><a href="javascript:;">14</a></li>
                                <li><a href="javascript:;">15</a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/getBalances?page=${currentPage+1}'"><span>下一页</span></a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/getBalances?page=${lastPage}'"><span>末页</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/users_members.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

