<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
     
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li><a href="/member/memberList">会员查询</a></li>
            <li><a href="member/memberInfo?memberId=${memberId}">会员详情</a></li>
            <li class="active">订单明细</li>
        </ol>
        <a href="/member/membersConsume" class="btn btn-primary pull-right" style="margin-top: -58px;">
            <span class="glyphicon glyphicon-th-list"></span> 消费明细
        </a>
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" id="balance_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" name="balanceType">
                            <option value="">订单类型</option>
                            <option value="10" <c:if test="${balanceType == 10}">selected</c:if>>注册会员</option>
                            <option value="11" <c:if test="${balanceType == 11}">selected</c:if>>会员充值</option>
                            <option value="12" <c:if test="${balanceType == 12}">selected</c:if>>会员升级</option>
                            <option value="13" <c:if test="${balanceType == 13}">selected</c:if>>会员补办</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" placeholder="开始时间" name="createTimeStart"
                                value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" placeholder="结束时间" name="createTimeEnd"
                               value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="手机号" name="memberMobile"
                               value="${memberMobile}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary balance-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
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
                            <c:forEach var="balance" items="${list}">
	                            <tr>
	                                <td>${balance.balanceNo}</td>
	                                <td>${balance.memberName}</td>
	                                <td>${balance.balanceServiceTypeName}</td>
	                                <td>${balance.balanceStyleName}</td>
	                                <td>${balance.realAmount}</td>
	                                <td>${balance.balanceStatus}</td>
	                                <td>${balance.operatorName}</td>
	                                <td>${balance.createTime}</td>
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
                                <c:if test="${isFirstPage}">
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>首页</span>
                                        </a>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${!isFirstPage}">
                                    <li>
                                        <a class="page-first" href="javascript:;" data-index="1">
                                            <span>首页</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="page-prev" href="javascript:;" data-index="${currentPage - 1}">
                                            <span>上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${lastPage}">
                                    <c:if test="${i == currentPage}">
                                        <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                                    </c:if>
                                    <c:if test="${i != currentPage}">
                                        <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${isLastPage}">
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>下一页</span>
                                        </a>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>末页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${!isLastPage}">
                                    <li>
                                        <a class="page-next" href="javascript:;" data-index="${currentPage + 1}">
                                            <span>下一页</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="page-last" href="javascript:;" data-index="${lastPage}">
                                            <span>末页</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/members_balance_list.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

