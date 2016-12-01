<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/reservations/reservations_orders.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/reservations/reservations_orders.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>预订订单</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">预订订单查询</div>
            <div class="panel-body">
                <form id="orders_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="user_role" name="roleId" style="width:160px;">
                            <option value="">全部订单</option>
                            <option value="1">未支付</option>
                            <option value="2">已支付</option>
                            <option value="3">已完成</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="订单号" name="orderNo">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary orders-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel-group" role="tablist">
            <c:forEach var="order" items="${list}" varStatus="loop">
            <div class="panel panel-default">
                <div class="panel-heading" id="order_header_${loop.index}">
                    <h5 class="panel-title" style="font-size: 14px;">
                        <a data-toggle="collapse" href="#order_body_${loop.index}" aria-expanded="true"
                           aria-controls="#order_body_${loop.index}">
                            订单号：<span class="text-primary">${order.orderNo}</span>
                        </a>

                        <div class="pull-right">
                            <small class="text-muted">${order.createTime} </small>
                        <c:if test="${order.orderStatus == 1}">
                            <span class="text-success">已完成</span>
                        </c:if>
                        <c:if test="${order.orderStatus == 2}">
                            <c:if test="${order.payStatus == 1}">
                                <span class="text-success">已支付</span>
                            </c:if>
                            <c:if test="${order.payStatus == 2}">
                                <span class="text-danger">未支付</span>
                            </c:if>
                            <c:if test="${order.payStatus == 3}">
                                <span class="text-danger">部分支付</span>
                            </c:if>
                        </c:if>
                        <c:if test="${order.orderStatus == 3}">
                            <span class="text-muted">已取消</span>
                        </c:if>
                        </div>
                    </h5>
                </div>
                <div id="#order_body_${loop.index}" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="order_header_${loop.index}" aria-expanded="true">
                    <div class="table-responsive">
                        <table class="table orders-list">
                            <thead>
                            <tr>
                                <th>预订项</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>预订状态</th>
                            </tr>
                            </thead>
                            <c:forEach var="item" items="${order.orderDetailList}">
                            <tr>
                                <td>${item.itemName}</td>
                                <td>${item.itemStartTime}</td>
                                <td>${item.itemEndTime}</td>
                                <c:if test="${item.orderDetailStatus == 1}">
                                    <td>已完成</td>
                                </c:if>
                                <c:if test="${item.orderDetailStatus == 2}">
                                    <td class="text-danger">未完成</td>
                                </c:if>
                                <c:if test="${item.orderDetailStatus == 3}">
                                    <td class="text-success">进行中</td>
                                </c:if>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="panel-footer">
                        合计金额: <strong class="text-danger">${order.orderSumPrice}</strong> 元
                        <div class="pull-right">
                            <c:if test="${order.orderStatus == 1}">
                                <button class="btn btn-warning btn-sm order-delete" data-id="${order.orderId}">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </button>
                            </c:if>
                            <c:if test="${order.orderStatus == 2}">
                                <c:if test="${order.payStatus == 1}">
                                    <button class="btn btn-danger btn-sm order-cancel" data-id="${order.orderId}" style="display: none;">
                                        <span class="glyphicon glyphicon-remove"></span> 取消
                                    </button>
                                </c:if>
                                <c:if test="${order.payStatus == 2}">
                                    <button class="btn btn-primary btn-sm order-pay" data-id="${order.orderId}">
                                        <span class="glyphicon glyphicon-usd"></span> 支付
                                    </button>
                                    <button class="btn btn-danger btn-sm order-cancel" data-id="${order.orderId}">
                                        <span class="glyphicon glyphicon-remove"></span> 取消
                                    </button>
                                </c:if>
                            </c:if>
                            <c:if test="${order.orderStatus == 3}">
                                <button class="btn btn-warning order-delete" data-id="${order.orderId}">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
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

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="zhifuModalLabel">订单支付</h5>
                </div>
                <div class="modal-body">
                    <form id="reservations_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                        <input type="hidden" id="reservations_order_id" name="orderId">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reservations_order_no" class="col-sm-2 control-label">订单号</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="reservations_order_no"
                                           name="orderno" placeholder="订单号" value="" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_ex_money" class="col-sm-4 control-label">附加金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_ex_money" name="additionalPrice"
                                           placeholder="附加金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="附加金额格式错误">
                                    <div data-valmsg-for="additionalPrice" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reservations_money_type" class="col-sm-4 control-label">支付方式</label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="reservations_money_type" name="payType"
                                            data-val="true" data-val-required="请选择支付方式">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                    </select>
                                    <div data-valmsg-for="payType" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_se_money" class="col-sm-4 control-label">优惠金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_se_money" name="subAmount"
                                           placeholder="优惠金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="优惠金额格式错误">
                                    <div data-valmsg-for="subAmount" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <!--<div class="form-group">
                                <label for="reservations_money_no" class="col-sm-4 control-label">支票号</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_money_no" name="checkNo"
                                           placeholder="支票号" value="" autocomplete="off">
                                </div>
                            </div>-->
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reservations_pay_remark" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="3" id="reservations_pay_remark"
                                              name="orderRemark" placeholder="备注"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reservations_real_money" class="col-sm-2 control-label">实收金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_real_money" name="paySumPrice"
                                           placeholder="请输入实收金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="实收金额格式错误">
                                    <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                                    <!--<p class="bg-info">应收: 100元</p>-->
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-primary reservations-pay-confirm">
                                        <span class="glyphicon glyphicon-ok"></span> 确 定
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="order"/>
</c:import>