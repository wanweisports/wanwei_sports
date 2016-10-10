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
        <div>
            <div class="panel panel-default member-card-panel">
                <div class="panel-body">
                    <form class="form-horizontal member-card-form" onsubmit="return false;">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="card_no" class="col-sm-2 control-label">
                                    <span class="text-danger">*</span> 会员卡号
                                </label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="card_no" name="cardNo" value="${cardNo}"
                                           placeholder="请输入会员卡号" autocomplete="off"
                                           data-val="true" data-val-required="会员卡号不能为空">
                                    <div data-valmsg-for="cardno" data-valmsg-replace="true"></div>
                                </div>
                                <div class="col-sm-4">
                                    <a href="javascript:;" class="btn btn-primary member-card-filter" onclick="window.location.href='member/getOperations?cardNo='+$('#card_no').val()">
                                        <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                                    </a>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="cardId">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">会员姓名</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${memberName }" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">手机号码</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${memberMobile }" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">当前余额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="<c:if test='${cardBalance!=null}'>${cardBalance}元</c:if>" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">截止日期</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${cardDeadline }" disabled>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
                        <input type="hidden" id="refresh_cardId" name="cardId" value="">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="refresh_money" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 补办价格
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_money" name="buBanMoney"
                                           placeholder="请输入补办价格(元)" autocomplete="off"
                                           data-val="true" data-val-required="补办价格不能为空"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="补办价格格式错误">
                                    <div data-valmsg-for="buBanMoney" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支付方式
                                </label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="pay_type" name="balanceStyle"
                                            data-val="true" data-val-required="请选择支付方式">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                    </select>
                                    <div data-valmsg-for="balanceStyle" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="refresh_discount" class="col-sm-4 control-label">优惠金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_discount" name="subMoney"
                                           placeholder="请输入优惠金额(元)" autocomplete="off" value="0"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="优惠金额格式错误">
                                    <div data-valmsg-for="subMoney" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="refresh_send" class="col-sm-4 control-label">赠送金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_send" name="givingAmount"
                                           placeholder="请输入赠送金额(元)" autocomplete="off" value="0"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="赠送金额格式错误">
                                    <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新卡号</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="newCardNo" name="newCardNo" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="refresh_remark" class="col-sm-2 control-label">补办备注</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" id="refresh_remark" name="remark" rows="3"
                                              placeholder="请输入备注" autocomplete="off"></textarea>
                                </div>
                            </div>
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
                    <input type="hidden" id="recharge_cardId" name="cardId" value="">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="recharge_money" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 充值金额
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="recharge_money" name="czMoney"
                                       placeholder="请输入充值金额(元)" autocomplete="off"
                                       data-val="true" data-val-required="充值金额不能为空"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="充值金额格式错误">
                                <div data-valmsg-for="czMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recharge_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支付方式
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="recharge_type" name="balanceStyle"
                                        data-val="true" data-val-required="请选择支付方式">
                                    <option value="">请选择</option>
                                    <option value="1">现金</option>
                                    <option value="2">支付宝</option>
                                    <option value="3">微信</option>
                                </select>
                                <div data-valmsg-for="balanceStyle" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="recharge_discount" class="col-sm-4 control-label">优惠金额</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="recharge_discount" name="subMoney"
                                       placeholder="请输入优惠金额(元)" autocomplete="off" value="0"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="优惠金额格式错误">
                                <div data-valmsg-for="subMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recharge_send" class="col-sm-4 control-label">赠送金额</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="recharge_send" name="givingAmount"
                                       placeholder="请输入赠送金额(元)" autocomplete="off" value="0"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="赠送金额格式错误">
                                <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="recharge_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                                    <textarea class="form-control" id="recharge_remark" name="remark" rows="3"
                                              placeholder="请输入备注" autocomplete="off"></textarea>
                            </div>
                        </div>
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
                    <input type="hidden" id="upgrade_cardId" name="cardId" value="">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_type" class="col-sm-4 control-label">会员类型</label>

                            <div class="col-sm-8">
                                <select class="form-control" id="member_type" name="cardTypeId">
                                    <c:forEach var="type" items="${memberCarTypeNames}">
                                         <option value="${type.cardTypeId}">${type.cardTypeName}</option>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="cardTypeId" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员折扣</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upgrade_discount" value="" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_money" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 升级费用
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upper_money" name="upLevelMoney"
                                       placeholder="请输入升级费用(元)" autocomplete="off"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="升级费用格式错误">
                                <div data-valmsg-for="upLevelMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支付方式
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="upper_type" name="balanceStyle"
                                        data-val="true" data-val-required="请选择支付方式">
                                    <option value="">请选择</option>
                                    <option value="1">现金</option>
                                    <option value="2">支付宝</option>
                                    <option value="3">微信</option>
                                </select>
                                <div data-valmsg-for="balanceStyle" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会费(元)</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upgrade_cost" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">截止日期</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upgrade_deadline" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_discount" class="col-sm-4 control-label">优惠费用</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upper_discount" name="subMoney"
                                       placeholder="请输入优惠金额(元)" autocomplete="off" value="0"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="优惠金额格式错误">
                                <div data-valmsg-for="subMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upper_send" class="col-sm-4 control-label">赠送费用</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="upper_send" name="givingAmount"
                                       placeholder="请输入赠送金额(元)" autocomplete="off" value="0"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="赠送金额格式错误">
                                <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="upper_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                                    <textarea class="form-control" id="upper_remark" name="remark" rows="3"
                                              placeholder="请输入备注" autocomplete="off"></textarea>
                            </div>
                        </div>
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
<script src="Content/app/members/members_card_operations.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />
