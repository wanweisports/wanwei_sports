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
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/goods/goods_orders.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#goods_paid_form').validate({
                ignore: ":hidden"
            });
            $("#orders_pay_status").val('${payStatus}');
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品订单</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">商品订单查询</div>
            <div class="panel-body">
                <form id="orders_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="orders_pay_status" name="payStatus" style="width: 180px;">
                            <option value="">支付状态</option>
                            <option value="1">已支付</option>
                            <option value="2">未支付</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="orderNo" placeholder="订单号" value="${orderNo}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" placeholder="购买人" value="${name}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="mobile" placeholder="手机号码" value="${mobile}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary order-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel-group" role="tablist">
            <c:forEach var="order" items="${list}" varStatus="loop">
                <div class="panel panel-info">
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
                        <div class="table-responsive" style="padding: 10px;">
                            <table class="table table-bordered orders-list">
                                <thead>
                                <tr class="bg-info">
                                    <th>商品名称</th>
                                    <th>预订人</th>
                                	<th>预订人手机</th>
                                    <th>商品价格</th>
                                    <th>购买数量</th>
                                    <th>预订状态</th>
                                    <th>销售员</th>
                                </tr>
                                </thead>
                                <c:forEach var="item" items="${order.orderDetailList}">
                                    <tr>
                                        <td>${item.itemName}</td>
                                        <td>${order.name}</td>
                                        <td>${order.mobile}</td>
                                        <td>${item.itemPrice}元</td>
                                        <td>${item.itemAmount}件</td>
                                        <c:if test="${item.orderDetailStatus == 1}">
                                            <td class="text-success">已支付</td>
                                        </c:if>
                                        <c:if test="${item.orderDetailStatus == 2}">
                                            <td class="text-danger">未支付</td>
                                        </c:if>
                                        <td>${order.operatorName}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="panel-footer">
                            合计金额: <strong class="text-danger">${order.orderSumPrice}</strong> 元
                            <div class="pull-right">
                                <c:if test="${order.orderStatus == 1}">
                                    <button class="btn btn-warning btn-sm order-delete" data-id="${order.orderId}"
                                            style="display: none;">
                                        <span class="glyphicon glyphicon-trash"></span> 删除
                                    </button>
                                </c:if>
                                <c:if test="${order.orderStatus == 2}">
                                    <c:if test="${order.payStatus == 1}">
                                        <button class="btn btn-danger btn-sm order-delete" data-id="${order.orderId}"
                                                style="display: none;">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
                                        </button>
                                    </c:if>
                                    <c:if test="${order.payStatus == 2}">
                                        <button class="btn btn-primary btn-sm order-pay" data-id="${order.orderId}"
                                                data-price="${order.orderSumPrice}">
                                            <span class="glyphicon glyphicon-usd"></span> 支付
                                        </button>
                                        <button class="btn btn-danger btn-sm order-cancel" data-id="${order.orderId}">
                                            <span class="glyphicon glyphicon-remove"></span> 取消
                                        </button>
                                    </c:if>
                                </c:if>
                                <c:if test="${order.orderStatus == 3}">
                                    <button class="btn btn-warning order-delete" data-id="${order.orderId}"
                                            style="display: none;">
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
            <c:if test="${fn:length(list) == 0}">
                <p class="text-muted no-list-count">没有检索到商品订单！</p>
            </c:if>
        </div>
    </div>

    <div class="modal fade" id="pay_model" tabindex="-1" role="dialog" aria-labelledby="pay_model_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="pay_model_label">支付订单</h5>
                </div>
                <div class="modal-body">
                    <form id="goods_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                        <input type="hidden" name="orderId" id="goods_paid_order">
                        <input type="hidden" name="subAmount" id="goods_paid_subAmount" value="0">
                        <input type="hidden" name="additionalPrice" id="goods_paid_additionalPrice" value="0">
                        <div class="form-group">
                            <label for="goods_paid_payType" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 支付方式
                            </label>

                            <div class="col-sm-9">
                                <select class="form-control" id="goods_paid_payType" name="payType"
                                        data-val="true" data-val-required="请选择支付方式">
                                    <option value="">请选择</option>
                                    <option value="1">现金</option>
                                    <option value="2">微信</option>
                                    <option value="3">支付宝</option>
                                </select>
                                <div data-valmsg-for="payType" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="goods_paid_remark" class="col-sm-3 control-label">备注</label>

                            <div class="col-sm-9">
                                <textarea class="form-control" rows="3" id="goods_paid_remark"
                                          name="orderRemark" placeholder="备注" autocomplete="off"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="goods_paid_sum" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 支付金额(元)
                            </label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="goods_paid_sum" name="paySumPrice"
                                       placeholder="支付金额" autocomplete="off"
                                       data-val="true" data-val-required="支付金额不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="支付金额格式错误" readonly>
                                <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                            </div>
                            <div class="col-sm-3">
                                <button class="btn btn-primary col-sm-12" id="goods_paid_confirm">
                                    <span class="glyphicon glyphicon-ok"></span> 确 定
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="order"/>
</c:import>