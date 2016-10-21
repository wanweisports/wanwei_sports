<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/members/members_loans.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span style="color: #f00;">应收款管理[未完成]</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">应收款管理</div>
            <div class="panel-body">
                <form class="form-inline" id="receipt_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" name="memberName" placeholder="会员姓名"
                               value="${memberName}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="memberMobile" placeholder="手机号码"
                               value="${memberMobile}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="orderNo" placeholder="订单流水号"
                               value="${orderNo}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary receipt-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default receipt-list">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>会员姓名</th>
                            <th>手机号码</th>
                            <th>会员卡号</th>
                            <th>订单流水号</th>
                            <th>订单金额(元)</th>
                            <th>所欠余额</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>北体高科公司</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>北体高科公司</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>北体高科公司</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>北体高科公司</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>北体高科公司</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>867567</td>
                            <td>FD0000121</td>
                            <td>10000.00元</td>
                            <td>2000.00元</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-ok"></span> 收款
                                </button>
                            </td>
                        </tr>
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
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="receiptModal" tabindex="-1" role="dialog" aria-labelledby="receiptModalLabel">
        <div class="modal-dialog" style="width: 680px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="receiptModalLabel">收款</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form id="card_receipt_form" class="form-horizontal" onsubmit="return false;">
                        <div class="form-group">
                            <label for="card_receipt_order" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 订单流水号
                            </label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="card_receipt_order" name="orderNo"
                                       placeholder="订单流水号" autocomplete="off" readonly value="FD0000121">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="card_receipt_money" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 所欠余额
                            </label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="card_receipt_money" name="money"
                                       placeholder="所欠余额" autocomplete="off" readonly value="2000.00">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="card_receipt_money2" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 收款金额
                            </label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="card_receipt_money2" name="money2"
                                       placeholder="收款金额" autocomplete="off"
                                       data-val="true" data-val-required="收款金额不能为空"
                                       data-val-regex-pattern="^[0-9]|[1-9][0-9]$"
                                       data-val-regex="收款金额只能是数字">
                                <div data-valmsg-for="money2" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary receipt-confirm">
                        <span class="glyphicon glyphicon-ok"></span> 收 款
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="loan"/>
</c:import>
