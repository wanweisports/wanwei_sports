<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/members/members_loans.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#card_receipt_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>应收款管理</span>
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
                        <input type="text" class="form-control" name="orderNo" placeholder="订单号"
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
                        <tr class="bg-info">
                            <th>订单号</th>
                            <th>会员姓名</th>
                            <th>手机号码</th>
                            <th>总场次</th>
                            <th>已支付场次</th>
                            <th>已使用场次</th>
                            <th>未支付场次</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>20161214123212</td>
                            <td>北京万为体育集团</td>
                            <td>11043526785</td>
                            <td>100场</td>
                            <td class="text-success">50场(2000元)</td>
                            <td>51场</td>
                            <td>50场(<span class="text-danger">1场欠款</span>)</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-usd"></span> 收 款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>20161223183165</td>
                            <td>北体高科股份有限公司</td>
                            <td>11043526785</td>
                            <td>100场</td>
                            <td class="text-success">50场(2000元)</td>
                            <td>49场</td>
                            <td>50场</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-usd"></span> 收 款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>20161213181165</td>
                            <td>李洪旭</td>
                            <td>11043526785</td>
                            <td>50场</td>
                            <td class="text-success">10场(500元)</td>
                            <td>15场</td>
                            <td>40场(<span class="text-danger">5场欠款</span>)</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-usd"></span> 收 款
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>20161224081145</td>
                            <td>北京乐视媒体传播公司</td>
                            <td>11043526785</td>
                            <td>250场</td>
                            <td class="text-success">100场(3000元)</td>
                            <td>26场</td>
                            <td>224场</td>
                            <td>
                                <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                        data-target="#receiptModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-usd"></span> 收 款
                                </button>
                            </td>
                        </tr>
                        <c:forEach var="loan" items="${list}">
                            <tr>
                                <td>${loan.orderNo}</td>
                                <td>${loan.memberName}</td>
                                <td>${loan.memberMobile}</td>
                                <td>${loan.sumCount}场</td>
                                <td class="text-success">${loan.payCount}场(${loan.paySumPrice}元)</td>
                                <td>${loan.useCount}场</td>
                                <c:if test="${loan.oweCount > 0}">
                                    <td>${loan.sumCount - loan.payCount}场(<span class="text-danger">${loan.oweCount}场欠款</span>)</td>
                                </c:if>
                                <c:if test="${loan.oweCount <= 0}">
                                    <td>${loan.sumCount - loan.payCount}场(<span class="text-success">未欠款</span>)</td>
                                </c:if>
                                <td>
                                    <c:if test="${loan.oweCount > 0}">
                                        <button type="button" class="btn btn-danger receipt-dialog" data-toggle="modal"
                                                data-target="#receiptModal" data-backdrop="false" data-id="${loan.receivableId}">
                                            <span class="glyphicon glyphicon-usd"></span> 收款
                                        </button>
                                    </c:if>
                                    <c:if test="${loan.oweCount <= 0}">
                                        <button type="button" class="btn btn-primary receipt-dialog" data-toggle="modal"
                                                data-target="#receiptModal" data-backdrop="false" data-id="${loan.receivableId}">
                                            <span class="glyphicon glyphicon-usd"></span> 收款
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
                        <p class="text-muted no-list-count">没有检索到任何应收款项！</p>
                    </c:if>
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
                        <input type="hidden" name="receivableId">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="card_receipt_money" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支付场数
                                </label>

                                <div class="col-sm-8 input-parent-magnifier">
                                    <input type="text" class="form-control input-element-magnifier" id="card_receipt_money" name="payCount"
                                           placeholder="支付场数" autocomplete="off"
                                           data-val="true" data-val-required="支付场数不能为空"
                                           data-val-regex-pattern="^[1-9]\d*$"
                                           data-val-regex="支付场数格式错误">
                                    <div data-valmsg-for="payCount" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="card_pay_type" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支付方式
                                </label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="card_pay_type" name="payType"
                                            data-val="true" data-val-required="请选择支付方式">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                        <option value="4">银联</option>
                                        <option value="5">支票</option>
                                    </select>
                                    <div data-valmsg-for="payType" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="card_receipt_money2" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 收款金额
                                </label>

                                <div class="col-sm-8 input-parent-magnifier">
                                    <input type="text" class="form-control input-element-magnifier" id="card_receipt_money2" name="payPrice"
                                           placeholder="收款金额" autocomplete="off"
                                           data-val="true" data-val-required="收款金额不能为空"
                                           data-val-regex-pattern="^(0(\.[0-9]{1,2})?)|([1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="收款金额格式错误">
                                    <div data-valmsg-for="payPrice" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group loan-check-no" style="display: none;">
                                <label for="loan_check_no" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支票号
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="loan_check_no" name="checkNo"
                                           placeholder="请输入支票号" autocomplete="off"
                                           data-val="true" data-val-required="支票号不能为空">
                                    <div data-valmsg-for="checkNo" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary receipt-confirm">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="loan"/>
</c:import>
