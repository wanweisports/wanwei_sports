<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/members/members_info_view.js?v=${static_resource_version}"></script>

    <script>
        // 表单校验配置
        $(document).ready(function () {
            $('#member_form, .refresh-card-form, .recharge-card-form, .upgrade-card-form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <form id="member_form" class="form-horizontal" novalidate onsubmit="return false;">
            <input type="hidden" name="memberId" value="${memberId}" />
            <div class="panel panel-default">
                <div class="panel-heading">会员信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="card_id" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员卡号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="card_id" name="cardNo"
                                       placeholder="会员卡号" value="${cardNo}" readonly>
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
                                       data-val-regex="手机号码格式错误"
                                       value="${memberMobile}">
                                <div data-valmsg-for="memberMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_mobile2" class="col-sm-4 control-label">备用手机</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_mobile2" name="memberMobile2"
                                       placeholder="请输入备用手机号码" autocomplete="off"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="备用手机号码格式错误"
                                       value="${memberMobile2}">
                                <div data-valmsg-for="memberMobile2" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="payment_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支付类型
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="payment_type" name="memberType" disabled>
                                    <c:if test="${memberType == 1}">
                                        <option value="1" selected>预付类型</option>
                                        <option value="2">记账类型</option>
                                    </c:if>
                                    <c:if test="${memberType == 2}">
                                        <option value="1">预付类型</option>
                                        <option value="2" selected>记账类型</option>
                                    </c:if>
                                </select>
                                <div data-valmsg-for="memberType" data-valmsg-replace="true"></div>
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
                                       data-val-regex="会员姓名长度只能2~12个字符"
                                       value="${memberName}">
                                <div data-valmsg-for="memberName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_idcard" class="col-sm-4 control-label">身份证号</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_idcard" name="memberIdcard"
                                       placeholder="请输入18位身份证号" autocomplete="off"
                                       data-val-regex-pattern="^\d{18}$|^\d{17}(\d|X|x)$"
                                       data-val-regex="身份证号格式错误"
                                       value="${memberIdcard}">
                                <div data-valmsg-for="memberIdcard" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_sex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员性别
                            </label>

                            <div class="col-sm-8">
                                <c:if test="${memberSex == 1}">
                                    <label class="radio-inline">
                                        <input type="radio" name="memberSex" id="member_sex1" value="1" checked> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="memberSex" id="member_sex2" value="2"> 女
                                    </label>
                                </c:if>
                                <c:if test="${memberSex == 2}">
                                    <label class="radio-inline">
                                        <input type="radio" name="memberSex" id="member_sex1" value="1"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="memberSex" id="member_sex2" value="2" checked> 女
                                    </label>
                                </c:if>
                                <div data-valmsg-for="memberSex" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_birthday" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员生日
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="member_birthday" name="memberBirthday"
                                           data-val="true" data-val-required="会员生日不能为空"
                                           value="${memberBirthday}">
                                    <span class="input-group-addon member-birthday-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="memberBirthday" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="member_address" class="col-sm-2 control-label">联系地址</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="member_address" name="memberAddress"
                                       placeholder="请输入联系地址" value="${memberAddress}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                            <textarea class="form-control" id="member_remark" name="memberRemark" rows="3"
                                      placeholder="备注">${memberRemark}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">会员卡信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_card_type1" class="col-sm-4 control-label">会员类型</label>

                            <div class="col-sm-8">
                                <select class="form-control" id="member_card_type1" name="cardTypeId" disabled>
                                    <c:forEach var="type" items="${memberCarTypeNames}">
                                        <c:if test="${type.cardTypeId == cardTypeId}">
                                            <option value="${type.cardTypeId}" selected>${type.cardTypeName}</option>
                                        </c:if>
                                        <c:if test="${type.cardTypeId != cardTypeId}">
                                            <option value="${type.cardTypeId}">${type.cardTypeName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员折扣</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardTypeDiscount / 10.0}折" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">余额(元)</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" value="${cardBalance}" disabled>
                            </div>
                            <div class="col-sm-2">
                                <a href="/member/getBalances?cardId=${cardId}&memberId=${memberId}" class="btn btn-primary" title="收支明细">
                                    <span class="glyphicon glyphicon-th-list"></span>
                                </a>
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <label class="col-sm-4 control-label">每周许可</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardTypeWeek}" disabled>
                            </div>
                        </div>-->
                        <div class="form-group">
                            <label class="col-sm-4 control-label">操作人</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${operatorName}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员状态</label>

                            <div class="col-sm-8">
                                <c:if test="${cardStatus == 1}">
                                    <input type="text" class="form-control" value="有效" disabled>
                                </c:if>
                                <c:if test="${cardStatus == 2}">
                                    <input type="text" class="form-control" value="锁定" disabled>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">有效期至</label>

                            <div class="col-sm-8">
                                <c:if test="${cardDeadline != 0}">
                                    <input type="text" class="form-control" value="${cardDeadline}" disabled>
                                </c:if>
                                <c:if test="${cardDeadline == 0}">
                                    <input type="text" class="form-control" value="无限制" disabled>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">注册时间</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${createTime}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="text-center">
                                <p class="sc-submit-tips"></p>
                                <a href="javascript:;" class="btn btn-primary gengxin-modal">
                                    <span class="glyphicon glyphicon-ok"></span> 更新会员信息
                                </a>
                                <a href="#chongzhiModal" class="btn btn-primary" data-toggle="modal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-usd"></span> 会员卡充值
                                </a>
                                <a href="#shengjiModal" class="btn btn-primary shengji-modal" data-toggle="modal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-flash"></span> 会员卡升级
                                </a>
                                <a href="#bubanModal" class="btn btn-primary" data-toggle="modal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-refresh"></span> 会员卡补办
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="modal fade" id="bubanModal" tabindex="-1" role="dialog" aria-labelledby="bubanModalLabel">
        <div class="modal-dialog">
            <form class="modal-content refresh-card-form" onsubmit="return false;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="bubanModalLabel">会员卡补办</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <div class="panel panel-default form-horizontal">
                        <div class="panel-body">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="cardId" value="${cardId}" >
                                    <label for="refresh_money" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 金额
                                    </label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="refresh_money" name="buBanMoney"
                                               placeholder="请输入补办金额(元)" autocomplete="off"
                                               data-val="true" data-val-required="补办金额不能为空"
                                               data-val-regex-pattern="^[1-9][0-9]*$"
                                               data-val-regex="补办金额格式错误">
                                        <div data-valmsg-for="buBanMoney" data-valmsg-replace="true"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 支付
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
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary refresh-card-submit" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确认 & 付款
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="chongzhiModal" tabindex="-1" role="dialog" aria-labelledby="chongzhiModalLabel">
        <div class="modal-dialog">
            <form class="modal-content recharge-card-form" onsubmit="return false;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="chongzhiModalLabel">会员卡充值</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <div class="panel panel-default form-horizontal">
                        <div class="panel-body">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="cardId" value="${cardId}" >
                                    <label for="recharge_money" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 金额
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
                                        <span class="text-danger">*</span> 支付
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
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary recharge-card-submit" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确认 & 付款
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="shengjiModal" tabindex="-1" role="dialog" aria-labelledby="shengjiModalLabel">
        <div class="modal-dialog">
            <form class="modal-content upgrade-card-form" onsubmit="return false;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="shengjiModalLabel">会员卡升级</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <div class="panel panel-default form-horizontal">
                        <div class="panel-body">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="cardId" value="${cardId}" >
                                    <label for="member_type" class="col-sm-4 control-label">会员类型</label>

                                    <div class="col-sm-8">
                                        <select class="form-control" id="member_type" name="cardTypeId">
                                            <c:forEach var="type" items="${memberCarTypeNames}">
                                                <option value="${type.cardTypeId}" <c:if test="${type.cardTypeId == cardTypeId}">selected</c:if>>${type.cardTypeName}</option>
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
                                        <span class="text-danger">*</span> 金额
                                    </label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="upper_money" name="upLevelMoney"
                                               placeholder="请输入升级金额(元)" autocomplete="off"
                                               data-val="true" data-val-required="升级金额不能为空"
                                               data-val-regex-pattern="^[1-9][0-9]*$"
                                               data-val-regex="升级金额格式错误">
                                        <div data-valmsg-for="upLevelMoney" data-valmsg-replace="true"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="upper_type" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 支付
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
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary upgrade-card-submit" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确认 & 付款
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="gengxinModal" tabindex="-1" role="dialog" aria-labelledby="gengxinModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="gengxinModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-info" role="alert">会员信息更新成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="list"/>
</c:import>
