<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/autosuggest/autosuggest.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-steps/jquery.steps.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/goods/goods_carts.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/autosuggest/autosuggest.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/holder/holder.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery-steps/jquery.steps.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/goods/goods_carts.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品销售</span> &gt;&gt; <span>商品购物车</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">商品购物车</div>
            <div class="panel-body goods-cart-list">
                <table class="table cart-list">
                    <thead>
                    <tr class="bg-info">
                        <th>商品编号</th>
                        <!--<th>商品图片</th>-->
                        <th>商品名称</th>
                        <th>商品单价</th>
                        <th>购买数量</th>
                        <th>商品小计</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="good" items="${goods}">
                        <tr class="cart-item" data-sid="${good.shoppingId}">
                            <td style="vertical-align: middle;">${good.goodNo}</td>
                            <%--<td style="vertical-align: middle;">
                                <img src="${good.goodPic}" data-src="holder.js/100x80?text=${good.goodName}&theme=lava"
                                     alt="${good.goodName}" class="img-rounded" style="width: 100px; height: 80px;">
                            </td>--%>
                            <td style="vertical-align: middle;">${good.goodName}</td>
                            <td style="vertical-align: middle;">${good.goodPrice}元</td>
                            <td style="vertical-align: middle;">
                                <div class="input-group">
                                    <span class="input-group-btn" style="width: auto">
                                        <button class="btn btn-default goods-minus" data-id="${good.goodId}">-</button>
                                    </span>
                                    <input type="text" class="form-control good-count" value="${good.shoppingGoodAmount}"
                                           style="width: 40px; padding: 6px 0; text-align: center"
                                           data-money="${good.goodPrice}">
                                    <span class="input-group-btn" style="width: auto">
                                        <button class="btn btn-default goods-plus" data-id="${good.goodId}">+</button>
                                    </span>
                                </div>
                            </td>
                            <td class="good-total" style="vertical-align: middle;">${good.goodTotal}元</td>
                            <td style="vertical-align: middle;">
                                <a href="javascript:;" class="btn btn-warning goods-remove" data-sid="${good.shoppingId}">
                                    <span class="glyphicon glyphicon-trash"></span> 移除
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="alert alert-info" style="overflow: hidden">
                    <p class="pull-left">商品预估总价： <span class="text-danger money-num">2000.00</span>元（<small>以实际支付金额为准</small>）</p>
                    <a href="#pay_model" class="btn btn-primary pull-right goods-buy-money" data-toggle="modal" data-backdrop="false">
                        <span class="glyphicon glyphicon-usd"></span> 结 算
                    </a>
                </div>
            </div>
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
                    <div class="goods-steps">
                        <h1>谁购买商品?</h1>
                        <div class="goods-steps-user">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="goods_user_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <input type="hidden" id="goods_user_shoppingIds" name="shoppingIds">
                                        <input type="hidden" id="goods_user_memberId" name="memberId">
                                        <input type="hidden" id="goods_user_opType" name="opType" value="2">
                                        <div class="form-group">
                                            <label for="goods_user_mobile" class="col-sm-3 control-label">
                                                <span class="text-danger">*</span> 手机号码
                                            </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="goods_user_mobile" name="mobile"
                                                       placeholder="手机号码" autocomplete="off"
                                                       data-val="true" data-val-required="手机号码不能为空"
                                                       data-val-regex-pattern="^1\d{10}$"
                                                       data-val-regex="手机号码格式错误">
                                                <div data-valmsg-for="moblie" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="goods_user_name" class="col-sm-3 control-label">
                                                <span class="text-danger">*</span> 姓名
                                            </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="goods_user_name" name="name"
                                                       placeholder="姓名" value="散客" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-primary pull-right" data-val="1" id="goods_user_pay">
                                                    <span class="glyphicon glyphicon-arrow-right"></span> 去支付
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <h1>商品支付</h1>
                        <div class="goods-steps-pay">
                            <div class="panel panel-default">
                                <div class="panel-body">
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
                                                    <option value="2">支付宝</option>
                                                    <option value="3">微信</option>
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
                                                       data-val-regex="支付金额格式错误">
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
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_confirm_modal" tabindex="-1" role="dialog" aria-labelledby="tips_confirm_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_confirm_modal_label">确认框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-success text-content">您确认要移除购物车吗?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning" type="button" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="market"/>
</c:import>
