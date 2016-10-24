<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-steps/jquery.steps.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/goods/goods_carts.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-steps/jquery.steps.min.js?v=${static_resource_version}"></script>
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
                <table class="table">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品图片</th>
                        <th>商品名称</th>
                        <th>价格(元)</th>
                        <th>会员价格(元)</th>
                        <th>购买数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default goods-minus" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default goods-plus" type="button">+</button>
                                </span>
                            </div>
                        </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning goods-remove">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default goods-minus" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default goods-plus" type="button">+</button>
                                </span>
                            </div>
                        </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning goods-remove">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="alert alert-info" style="overflow: hidden">
                    <p class="pull-left">商品总价: 2000.00元(会员价: 1800.00元)</p>
                    <a href="#zhifuModal" class="btn btn-primary pull-right" data-toggle="modal" data-backdrop="false">
                        <span class="glyphicon glyphicon-usb"></span> 结算
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="zhifuModalLabel">支付订单</h4>
                </div>
                <div class="modal-body">
                    <div class="goods-steps">
                        <h1>谁购买商品?</h1>
                        <div class="goods-steps-user">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="venue_goods_pay_form" class="form-horizontal" action="" method="post"
                                          novalidate onsubmit="return false;">
                                        <input type="hidden" value="3" id="pay_goods_user_class" name="userclass">
                                        <input type="hidden" value="1" name="schedulchannel">
                                        <input type="hidden" value="" id="pay_goods_member_number" name="membernumber">
                                        <input type="hidden" value="" id="pay_goods_list" name="list">
                                        <input type="hidden" value="" id="pay_goods_member_name" name="membername">
                                        <div class="form-group">
                                            <label for="pay_goods_user_name" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="pay_goods_user_name" name="user_name"
                                                       placeholder="姓名" value="散客" autocomplete="off">
                                            </div>
                                            <div class="col-sm-3">
                                                <a class="btn btn-primary user-search" href="javascript:void(0);">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pay_goods_user_mobile" class="col-sm-3 control-label">手机号</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="pay_goods_user_mobile" name="fitphone"
                                                       placeholder="手机号码" autocomplete="off"
                                                       data-val="true" data-val-required="手机号码不能为空"
                                                       data-val-regex-pattern="^1\d{10}$"
                                                       data-val-regex="手机号码格式错误">
                                                <div data-valmsg-for="fitphone" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pay_goods_amount" class="col-sm-3 control-label">预计(元)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="pay_goods_amount" name="amount"
                                                       placeholder="预计价格" value="" autocomplete="off" readonly>
                                            </div>
                                        </div>
                                        <p class="sc-submit-tips"></p>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-primary pull-right goods-pay" data-val="1">
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
                                    <form id="venue_goods_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="pay_goods_order_no" class="col-sm-2 control-label">订单号</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="pay_goods_order_no"
                                                           name="orderno" placeholder="订单号" value="" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="pay_goods_ex_money" class="col-sm-4 control-label">附加费用(元)</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="pay_goods_ex_money" name="addcharges"
                                                           placeholder="附加费用" value="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="pay_goods_ex_money_note" class="col-sm-4 control-label">附加费用说明</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="pay_goods_ex_money_note" name="addchargesexplain"
                                                           placeholder="附加费用说明" value="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="pay_goods_money_type" class="col-sm-4 control-label">付款方式</label>

                                                <div class="col-sm-8">
                                                    <select class="form-control" id="pay_goods_money_type" name="paymentmethod">
                                                        <option value="0">现金</option>
                                                        <option value="1">微信</option>
                                                        <option value="2">支付宝</option>
                                                        <option value="3">支票</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="pay_goods_se_money" class="col-sm-4 control-label">优惠金额(元)</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="pay_goods_se_money" name="preamount"
                                                           placeholder="优惠金额" value="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="pay_goods_se_money_note" class="col-sm-4 control-label">优惠金额说明</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="pay_goods_se_money_note" name="preamountexplain"
                                                           placeholder="优惠金额说明" value="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="pay_goods_money_no" class="col-sm-4 control-label">支票号</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="pay_goods_money_no" name="checknumber"
                                                           placeholder="支票号" value="" autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="pay_goods_pay_remark" class="col-sm-2 control-label">备注</label>

                                                <div class="col-sm-10">
                                                        <textarea class="form-control" rows="3" id="pay_goods_pay_remark"
                                                                  name="remarks" placeholder="备注" autocomplete="off"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="pay_goods_real_money" class="col-sm-2 control-label">实收金额(元)</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="pay_goods_real_money" name="paidamount"
                                                           placeholder="实收金额" value="" readonly>
                                                </div>
                                                <div class="col-sm-2">
                                                    <button class="btn btn-primary goods-pay-confirm">
                                                        <span class="glyphicon glyphicon-ok"></span> 确定
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <p class="sc-submit-tips"></p>
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="market"/>
</c:import>
