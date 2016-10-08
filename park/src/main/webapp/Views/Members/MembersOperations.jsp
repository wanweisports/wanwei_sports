{% extends '../layout.html' %}
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">会员操作</li>
        </ol>
        <div class="row" style="margin-bottom: 10px">
            <div class="col-sm-12">
                <div class="btn-group btn-group-justified">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary tab-card" data-tab="refresh-card">会员卡补办</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-info tab-card" data-tab="recharge-card">会员卡充值</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary tab-card" data-tab="upgrade-card">会员卡升级</button>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="panel panel-default refresh-card-panel" style="display: none;">
                <div class="panel-heading">
                    <h3 class="panel-title">会员卡补办</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal refresh-card-form" onsubmit="return false;">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="refresh_money" class="col-sm-4 control-label">补办价格</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_money" name="refresh_money"
                                           placeholder="请输入补办价格(元)" autocomplete="off"
                                           data-val="true" data-val-required="补办价格不能为空"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="补办价格格式错误">
                                    <div data-valmsg-for="refresh_money" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">支付方式</label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="pay_type" name="pay_type">
                                        <option value="">请选择</option>
                                        <option value="">现金</option>
                                        <option value="">支付宝</option>
                                        <option value="">微信</option>
                                        <option value="">银行卡</option>
                                        <option value="">支票</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="refresh_discount" class="col-sm-4 control-label">优惠金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_discount" name="refresh_discount"
                                           placeholder="请输入优惠金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="优惠金额格式错误">
                                    <div data-valmsg-for="refresh_money" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">会员卡号</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="FD000011" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="">
                                </div>
                            </div>
                            <div class="alert alert-info" role="alert">合计金额: 19元(会员折扣: 95折)</div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer" style="overflow: hidden;">
                    <button type="button" class="btn btn-primary refresh-card-submit pull-right">
                        <span class="glyphicon glyphicon-ok"></span> 确认 & 收款
                    </button>
                </div>
            </div>
        </div>

        <div class="panel panel-default recharge-card-panel">
            <div class="panel-heading">
                <h3 class="panel-title">会员卡充值</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal recharge-card-form" onsubmit="return false;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="recharge_money" class="col-sm-4 control-label">充值金额</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="recharge_money" name="recharge_money"
                                       placeholder="请输入充值金额(元)" autocomplete="off"
                                       data-val="true" data-val-required="充值金额不能为空"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="充值金额格式错误">
                                <div data-valmsg-for="recharge_money" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recharge_type" class="col-sm-4 control-label">支付方式</label>

                            <div class="col-sm-8">
                                <select class="form-control" id="recharge_type" name="recharge_type">
                                    <option value="0">请选择</option>
                                    <option value="1">现金</option>
                                    <option value="2">支付宝</option>
                                    <option value="3">微信</option>
                                    <option value="4">银行卡</option>
                                    <option value="5">支票</option>
                                </select>
                                <div data-valmsg-for="pay_type" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="recharge_discount" class="col-sm-4 control-label">优惠金额</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="recharge_discount" name="recharge_discount"
                                       value="" placeholder="请输入优惠金额">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="recharge_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                                <textarea class="form-control" id="recharge_remark" name="recharge_remark" rows="3" placeholder="备注"></textarea>
                            </div>
                        </div>
                        <div class="alert alert-info" role="alert">合计金额: 19元(会员折扣: 95折)</div>
                    </div>
                </form>
            </div>
            <div class="panel-footer" style="overflow: hidden;">
                <button type="button" class="btn btn-primary recharge-card-submit pull-right">
                    <span class="glyphicon glyphicon-ok"></span> 确认 & 收款
                </button>
            </div>
        </div>

        <div class="panel panel-default upgrade-card-panel" style="display: none;">
            <div class="panel-heading">
                <h3 class="panel-title">会员卡升级</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal upgrade-card-form" onsubmit="return false;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_type" class="col-sm-4 control-label">会员类型</label>

                            <div class="col-sm-8">
                                <select class="form-control" id="member_type" name="member_type">
                                    <option value="1" selected>普通会员</option>
                                    <option value="2">教师会员</option>
                                </select>
                                <div data-valmsg-for="memberlevel" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员折扣</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="95折" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">每周许可</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="一,二,三,四,五,六,日" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_money" class="col-sm-4 control-label">升级费用</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upper_money" name="upper_money">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_type" class="col-sm-4 control-label">支付方式</label>

                            <div class="col-sm-8">
                                <select class="form-control" id="upper_type" name="upper_type">
                                    <option value="">请选择</option>
                                    <option value="">现金</option>
                                    <option value="">支付宝</option>
                                    <option value="">微信</option>
                                    <option value="">银行卡</option>
                                    <option value="">支票</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">价格(元)</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="1000" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">有效期至</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="2016-12-23" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">每日许可</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="08:00-18:00" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_discount" class="col-sm-4 control-label">优惠费用</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upper_discount" name="upper_discount">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="upper_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="upper_remark" name="upper_remark" value="">
                            </div>
                        </div>
                        <div class="alert alert-info" role="alert">合计金额: 0元(会员折扣: 95折)</div>
                    </div>
                </form>
            </div>
            <div class="panel-footer" style="overflow: hidden;">
                <button type="button" class="btn btn-primary upgrade-card-submit pull-right">
                    <span class="glyphicon glyphicon-ok"></span> 确认 & 收款
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/users_members_operations.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />
