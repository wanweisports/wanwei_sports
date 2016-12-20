<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/members/members_card_bind.js?v=${static_resource_version}"></script>
    <script>
        // 表单校验配置
        $(document).ready(function () {
            $('#member_form, #member_card_form, #member_card_ticket_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员绑卡充值</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="member_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">会员绑卡充值</div>
                <div class="panel-body">
                    <input type="hidden" id="member_id" name="memberId" value="${memberId}">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_card_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员卡号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_card_no" name="cardNo"
                                       placeholder="会员卡号" value="${tempCardNo}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_mobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_mobile" name="memberMobile"
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误" value="${memberMobile}">
                                <div data-valmsg-for="memberMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_name" name="memberName"
                                       placeholder="请输入会员姓名" autocomplete="off"
                                       data-val="true" data-val-required="会员姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,10}$"
                                       data-val-regex="会员姓名长度只能2~12个字符" value="${memberName}">
                                <div data-valmsg-for="memberName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button type="button" class="btn btn-primary col-sm-4 genxin-submit">
                                    <span class="glyphicon glyphicon-refresh"></span> 更新信息
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <form id="member_card_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <input type="hidden" name="memberId" value="${memberId}">
                <input type="hidden" name="cardNo" value="${cardNo}" >
                <input type="hidden" name="cardTypeId" value="2" >
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">会员类型</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="会员卡" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">押金(元)</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recharge_type_deposit"
                                           name="cardDeposit" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">会费(元)</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recharge_type_money"
                                           name="cardTypeMoney" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">截止日期</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="cardDeadline" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="recharge_money" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 充值金额
                                </label>

                                <div class="col-sm-8 input-parent-magnifier">
                                    <input type="text" class="form-control input-element-magnifier" id="recharge_money" name="cardBalance"
                                           placeholder="请输入充值金额(元)" autocomplete="off"
                                           data-val="true" data-val-required="充值金额不能为空"
                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="充值金额格式错误">
                                    <div data-valmsg-for="cardBalance" data-valmsg-replace="true"></div>
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
                                        <option value="4">银联</option>
                                        <option value="5">支票</option>
                                    </select>
                                    <div data-valmsg-for="balanceStyle" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="recharge_send" class="col-sm-4 control-label">赠送金额(元)</label>

                                <div class="col-sm-8 input-parent-magnifier">
                                    <input type="text" class="form-control input-element-magnifier" id="recharge_send" name="givingAmount"
                                           placeholder="请输入赠送金额" autocomplete="off"
                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="赠送金额格式错误">
                                    <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group recharge-check-no" style="display: none;">
                                <label for="recharge_check_no" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支票号
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recharge_check_no" name="checkNo"
                                           placeholder="请输入支票号" autocomplete="off"
                                           data-val="true" data-val-required="支票号不能为空">
                                    <div data-valmsg-for="checkNo" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="recharge_remark" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" id="recharge_remark" name="cardRemark" rows="3"
                                              placeholder="备注"></textarea>
                                </div>
                            </div>
                            <div class="alert alert-info text-center" role="alert">
                                合计金额：<span class="total-money text-danger">0</span>元（ = 充值金额 + 赠送金额 - 会费 - 押金）
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="button" class="btn btn-primary col-sm-4 register-recahrge">
                                        <span class="glyphicon glyphicon-ok"></span> 确定 & 付款
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="modal fade" id="confirm_modal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="confirmModalLabel">发票登记</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success">会员卡已经办理成功，需要登记领取发票？</div>
                    <div class="panel panel-default">
                        <form id="member_card_ticket_form" class="form-horizontal" novalidate onsubmit="return false;">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">流水单号</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="balanceNo" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">订单状态</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="balanceStatusName"  readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">订单类型</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="balanceServiceTypeName" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">创建时间</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="createTime" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row is-show-ticket" style="display: none;">
                                    <input type="hidden" name="invoiceServiceId" value="${memberId}">
                                    <input type="hidden" name="invoiceServiceType" value="10">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="ticket_header" class="col-sm-2 control-label">
                                                <span class="text-danger">*</span> 发票抬头
                                            </label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="ticket_header"
                                                       name="invoiceHeader" placeholder="发票抬头" autocomplete="off"
                                                       data-val="true" data-val-required="发票抬头不能为空">
                                                <div data-valmsg-for="invoiceHeader" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="ticket_money" class="col-sm-4 control-label">
                                                <span class="text-danger">*</span> 发票金额
                                            </label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="ticket_money"
                                                       name="invoiceMoney" placeholder="发票金额" autocomplete="off"
                                                       data-val="true" data-val-required="发票金额不能为空"
                                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                       data-val-regex="发票金额格式错误">
                                                <div data-valmsg-for="invoiceMoney" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="ticket_project" class="col-sm-4 control-label">
                                                <span class="text-danger">*</span> 服务项目
                                            </label>

                                            <div class="col-sm-8">
                                                <select class="form-control" id="ticket_project" name="invoiceContent"
                                                        data-val="true" data-val-required="请选择服务项目">
                                                    <option value="">请选择</option>
                                                    <option value="场地费">场地费</option>
                                                    <option value="会议费">会议费</option>
                                                    <option value="培训费">培训费</option>
                                                </select>
                                                <div data-valmsg-for="invoiceContent" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="ticket_remark" class="col-sm-2 control-label">备注</label>

                                            <div class="col-sm-10">
                                            <textarea class="form-control" id="ticket_remark" name="invoiceRemark"
                                                      rows="3" placeholder="备注"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ticket_type1" class="col-sm-2 control-label">
                                                <span class="text-danger">*</span> 发票类型
                                            </label>

                                            <div class="col-sm-10">
                                                <label class="radio-inline">
                                                    <input type="radio" name="invoiceType" id="ticket_type1" value="1"> 增值税专票
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="invoiceType" id="ticket_type2" value="2"> 增值税普票
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <label class="text-danger pull-left">
                        <input type="checkbox" value="1" name="is_print_ticket" id="is_print_ticket"> 开具发票吗?
                    </label>
                    <button type="button" class="btn btn-primary print-ticket">
                        <span class="glyphicon glyphicon-print"></span> 打印收款单
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">会员信息更新成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="register"/>
</c:import>
