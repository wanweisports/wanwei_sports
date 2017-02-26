<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/autosuggest/autosuggest.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/autosuggest/autosuggest.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/members/members_card_recharge.js?v=${static_resource_version}"></script>
    <script>
        // 表单校验配置
        $(document).ready(function () {
            $('#member_card_form, #recharge_card_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员卡充值</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default member-card-panel">
            <div class="panel-heading">会员卡充值</div>
            <div class="panel-body">
                <form id="member_card_form" class="form-horizontal" novalidate onsubmit="return false;">
                    <input type="hidden" id="card_no" name="cardNo" value="${cardNo}">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="keywords" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 关键字
                            </label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="keywords" name="search" value="${cardNo}"
                                       placeholder="手机号，会员卡号，会员姓名" autocomplete="off"
                                       data-val="true" data-val-required="请输入搜索关键字">
                                <div data-valmsg-for="search" data-valmsg-replace="true"></div>
                            </div>
                            <div class="col-sm-4">
                                <a href="javascript:;" class="btn btn-primary member-card-filter">
                                    <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员姓名</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${memberName}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">手机号码</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${memberMobile}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">当前余额(元)</label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           value="<c:if test='${cardBalance != null}'>${cardBalance}元</c:if>" disabled>
                                    <span class="input-group-btn">
                                        <c:if test="${cardNo != null}">
                                        <a class="btn btn-primary" href="<%=basePath%>member/getBalances?cardId=${cardId}&memberId=${memberId}">
                                            <i class="glyphicon glyphicon-th-list"></i> 明细
                                        </a>
                                        </c:if>
                                        <c:if test="${cardNo == null}">
                                        <a class="btn btn-default" href="javascript:;">
                                            <i class="glyphicon glyphicon-th-list"></i> 明细
                                        </a>
                                        </c:if>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">截止日期</label>

                            <div class="col-sm-8">
                                <c:choose>
                                    <c:when test="${cardDeadline == 0}">
                                        <input type="text" class="form-control" value="不限制" disabled>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" value="${cardDeadline}" disabled>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default recharge-card-panel">
            <div class="panel-body">
                <form id="recharge_card_form" class="form-horizontal" novalidate onsubmit="return false;">
                    <input type="hidden" id="recharge_cardId" name="cardId" value="${cardId}">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="recharge_money" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 充值金额(元)
                            </label>

                            <div class="col-sm-8 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="recharge_money" name="czMoney"
                                       placeholder="请输入充值金额(元)" autocomplete="off"
                                       data-val="true" data-val-required="充值金额不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
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
                                    <c:forEach var="pay" items="${payTypeList}">
                                        <option value="${pay.value}">${pay.text}</option>
                                    </c:forEach>
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
                                       placeholder="请输入赠送金额(元)" autocomplete="off"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="赠送金额格式错误">
                                <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group recharge-check-no" data-value="${checkType}" style="display: none;">
                            <label for="recharge_check_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支票号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="recharge_check_no" name="balanceCheckNo"
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
                                <textarea class="form-control" id="recharge_remark" name="remark" rows="3"
                                      placeholder="请输入备注" autocomplete="off"></textarea>
                            </div>
                        </div>
                        <div class="alert alert-info text-center" role="alert">
                            合计金额：<span class="recharge-total-money text-danger">0</span>元（ = 充值金额 + 赠送金额）
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="button" class="btn btn-primary col-sm-4 recharge-card-submit"
                                        data-loading-text="充值中...">
                                    <span class="glyphicon glyphicon-ok"></span> 确认 & 收款
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="invoice_confirm_modal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel">
        <div class="modal-dialog" style="width: 620px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="confirmModalLabel">发票登记</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success">会员卡已经充值成功，需要登记领取发票？</div>
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
                                    <input type="hidden" name="invoiceServiceType" value="11">
                                    <input type="hidden" name="invoiceNo" id="invoice_no">
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
                        <input type="checkbox" value="1" name="is_print_ticket" id="is_print_ticket"> 登记发票吗?
                    </label>
                    <button type="button" class="btn btn-primary print-ticket">
                        <span class="glyphicon glyphicon-save"></span> 登记保存
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="recharge"/>
</c:import>
