<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">发票登记</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline col-sm-8" id="ticket_filter_form" onsubmit="return false;">
                        <div class="form-group">
                            <select class="form-control" style="width:200px;" name="status" id="status">
                                <option value="" selected>全部状态</option>
                                <option value="1">已领取</option>
                                <option value="2">未领取</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" name="invoiceHeader"
                                   placeholder="发票抬头" autocomplete="off" value="${invoiceHeader}">
                        </div>
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary ticket-filter">
                                <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
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
                                <th>#</th>
                                <th>流水单号</th>
                                <th>发票抬头</th>
                                <th>发票金额</th>
                                <th>发票内容</th>
                                <th>备注</th>
                                <th>状态</th>
                                <th>领取时间</th>
                                <th>操作人</th>
                                <th>登记时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var="invoice" items="${list}">
	                            <tr>
	                                <td>
                                        <c:if test="${invoice.invoiceState == 2}">
                                            <label>
                                                <input type="checkbox" name="ticket_id" value="${invoice.invoiceId}">
                                            </label>
	                                    </c:if>
                                    </td>
	                                <td>${invoice.invoiceNo}</td>
	                                <td>${invoice.invoiceHeader}</td>
	                                <td>${invoice.invoiceMoney}</td>
	                                <td>${invoice.invoiceContent}</td>
	                                <td>${invoice.invoiceRemark}</td>
                                    <c:if test="${invoice.invoiceState == 1}">
                                    <td class="text-success">已领取</td>
                                    <td class="text-success">${invoice.printTime }</td>
                                    </c:if>
                                    <c:if test="${invoice.invoiceState == 2}">
                                    <td class="text-danger">未领取</td>
                                    <td class="text-danger">--</td>
                                    </c:if>
	                                
	                                <td>${invoice.operatorName}</td>
	                                <td>${invoice.createTime}</td>
	                            </tr>
                            </c:forEach>
                            
                            </tbody>
                        </table>
                        <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize}条/页</span>
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
<script src="Content/app/members/members_invoice_list.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />
<<script type="text/javascript">$("#status").val('${status}');</script>
