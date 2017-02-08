<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/members/members_invoice_list.js?v=${static_resource_version}"></script>
    <script>
        (function ($) {
            $(".invoice-status.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".invoice-status[data-open='${invoiceOpenState}'][data-state='${invoiceState}']")
                .addClass("btn-primary").removeClass("btn-default");
        })(jQuery);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>发票登记查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">发票登记查询</div>
            <div class="panel-body">
                <form class="form-inline col-sm-8" id="ticket_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/member/getInvoices?invoiceOpenState=2&invoiceState=2" data-open="2" data-state="2"
                               class="btn btn-default invoice-status">已登记</a>
                            <a href="/member/getInvoices?invoiceOpenState=1&invoiceState=2" data-open="2" data-state="1"
                               class="btn btn-default invoice-status">已开票</a>
                            <a href="/member/getInvoices?invoiceOpenState=1&invoiceState=1" data-open="1" data-state="1"
                               class="btn btn-default invoice-status">已领取</a>
                        </div>
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
                    <c:if test="${invoiceOpenState == 2 && invoiceState == 2}">
                        <button type="button" class="btn btn-warning ticket-open">
                            <span class="glyphicon glyphicon-thumbs-up"></span> 确认开票
                        </button>
                    </c:if>
                    <c:if test="${invoiceOpenState == 1 && invoiceState == 2}">
                        <button type="button" class="btn btn-primary ticket-print">
                            <span class="glyphicon glyphicon-ok"></span> 确认领票
                        </button>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive invoice-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>选择</th>
                            <th>流水单号</th>
                            <th>发票抬头</th>
                            <th>发票金额</th>
                            <th>发票内容</th>
                            <th>发票类型</th>
                            <th>备注</th>
                            <th>状态</th>
                            <th>操作时间</th>
                            <th>操作</th>
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
                                <td>
                                    <c:choose>
                                        <c:when test="${invoice.invoiceHeader != ''}">${invoice.invoiceHeader}</c:when>
                                        <c:otherwise> -- </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${invoice.invoiceMoney}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${invoice.invoiceContent != ''}">${invoice.invoiceContent}</c:when>
                                        <c:otherwise> -- </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${invoice.invoiceType == 1}">增值税专票</c:if>
                                    <c:if test="${invoice.invoiceType == 2}">增值税普票</c:if>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${invoice.invoiceRemark != ''}">${invoice.invoiceRemark}</c:when>
                                        <c:otherwise> -- </c:otherwise>
                                    </c:choose>
                                </td>

                                <c:if test="${invoice.invoiceOpenState == 2 && invoice.invoiceState == 2}">
                                    <td class="text-danger">已登记</td>
                                    <td class="text-danger">${invoice.createTime}</td>
                                </c:if>
                                <c:if test="${invoice.invoiceOpenState == 1 && invoice.invoiceState == 2}">
                                    <td class="text-primary">已开具</td>
                                    <td class="text-primary">${invoice.openTime}</td>
                                </c:if>
                                <c:if test="${invoice.invoiceOpenState == 1 && invoice.invoiceState == 1}">
                                    <td class="text-success">已领取</td>
                                    <td class="text-success">${invoice.printTime}</td>
                                </c:if>

                                <td>
                                    <c:if test="${invoice.invoiceOpenState == 2 && invoice.invoiceState == 2}">
                                        <button type="button" class="btn btn-warning invoice-open-confirm" data-id="${invoice.invoiceId}">
                                            <span class="glyphicon glyphicon-thumbs-up"></span> 开票
                                        </button>
                                    </c:if>
                                    <c:if test="${invoice.invoiceOpenState == 1 && invoice.invoiceState == 2}">
                                        <button type="button" class="btn btn-primary invoice-get-confirm" data-id="${invoice.invoiceId}">
                                            <span class="glyphicon glyphicon-ok"></span> 领票
                                        </button>
                                    </c:if>
                                    <c:if test="${invoice.invoiceOpenState == 1 && invoice.invoiceState == 1}">
                                        <button type="button" class="btn btn-danger invoice-delete-confirm" data-id="${invoice.invoiceId}"
                                            style="display: none;">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                        <p class="pull-left" style="margin: 12px 14px;">
                            <span>${pageSize}条/页</span>
                            <span>总${count}条</span>
                        </p>
                        <ul class="pagination pull-right">
                            <c:if test="${currentPage == 1}">
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
                            <c:if test="${currentPage != 1}">
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
                            <c:if test="${currentPage == lastPage}">
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
                            <c:if test="${currentPage != lastPage}">
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
                    <c:if test="${fn:length(list) == 0}">
                        <p class="text-muted no-list-count">没有检索到任何登记发票！</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_message_modal" tabindex="-1" role="dialog" aria-labelledby="tips_message_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_message_modal_label">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success text-message" role="alert">发票领取成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="invoice"/>
</c:import>
