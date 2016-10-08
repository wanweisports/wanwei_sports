<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">发票登记</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline col-sm-8" id="ticket_filter_form" onsubmit="return false;">
                        <div class="form-group">
                            <select class="form-control" style="width:200px;" name="status">
                                <option value="">发票状态</option>
                                <option value="1">已领取</option>
                                <option value="2">未领取</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" name="invoice_header"
                                   placeholder="发票抬头" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary ticket-filter">
                                <span class="glyphicon glyphicon-filter"></span> 筛选 / 显示
                            </a>
                        </div>
                    </form>
                    <div class="col-sm-4 text-right">
                        <button type="button" class="btn btn-primary ticket-print">
                            <span class="glyphicon glyphicon-ok"></span> 领取发票
                        </button>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>选择</th>
                                <th>流水号</th>
                                <th>发票抬头</th>
                                <th>发票金额</th>
                                <th>发票内容</th>
                                <th>备注</th>
                                <th>状态</th>
                                <th>打印时间</th>
                                <th>操作人</th>
                                <th>登记时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var="invoice" items="${list }">
	                            <tr>
	                                <td>
	                                	<label><input type="checkbox" name="ticket_id" value="${invoice.invoiceId }"></label>
	                                </td>
	                                <td>${invoice.invoiceId }</td>
	                                <td>${invoice.invoiceHeader }</td>
	                                <td>${invoice.invoiceMoney }</td>
	                                <td>${invoice.invoiceContent }</td>
	                                <td>${invoice.invoiceRemark }</td>
                                    <c:if test="${invoice.invoiceState==1}">
                                    <td class="text-success">已打印</td>
                                        <td class="text-success">${invoice.printTime }</td>
                                    </c:if>
                                    <c:if test="${invoice.invoiceState==2}">
                                    <td class="text-danger">未打印</td>
                                        <td class="text-danger">--</td>
                                    </c:if>
	                                
	                                <td>${invoice.operatorName}</td>
	                                <td>${invoice.createTime}</td>
	                            </tr>
                            </c:forEach>
                            
                            </tbody>
                        </table>
                        <nav class="pull-right">
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize}条/页</span>
                                <span>总${count}条</span>
                            </p>
                            <ul class="pagination pull-right">
                                <li><a href="javascript:;" onclick="window.location.href='member/getInvoices?page=1'"><span>首页</span></a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/getInvoices?page=${currentPage-1}'"><span>上一页</span></a></li>
                                <li><a href="javascript:;">1</a></li>
                                <li class="active"><a href="javascript:;">2</a></li>
                                <li><a href="javascript:;">3</a></li>
                                <li><a href="javascript:;">...</a></li>
                                <li><a href="javascript:;">11</a></li>
                                <li><a href="javascript:;">12</a></li>
                                <li><a href="javascript:;">13</a></li>
                                <li><a href="javascript:;">14</a></li>
                                <li><a href="javascript:;">15</a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/getInvoices?page=${currentPage+1}'"><span>下一页</span></a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/getInvoices?page=${lastPage}'"><span>末页</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/users_members_ticket.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

