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
            $('[name="memberSex"][value="${memberSex}"]').prop("checked", true);
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员查询</span> &gt;&gt; <span>会员详情</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <form id="member_form" class="form-horizontal" novalidate onsubmit="return false;">
            <input type="hidden" name="memberId" value="${memberId}" />
            <div class="panel panel-default">
                <div class="panel-heading">会员详情</div>
                <div class="panel-body">
                    <input type="hidden" name="memberType" value="1">
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

                            <div class="col-sm-8 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="member_mobile"
                                       name="memberMobile" placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误"
                                       value="${memberMobile}" maxlength="11">
                                <div data-valmsg-for="memberMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_birthday" class="col-sm-4 control-label">会员生日</label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="member_birthday" name="memberBirthday"
                                           value="${memberBirthday}" placeholder="会员生日"
                                           data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                           data-val-regex="会员生日格式错误" maxlength="10">
                                    <span class="input-group-addon member-birthday-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
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
                            <label for="member_idcard" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 身份证号
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="member_idcard" name="memberIdcard"
                                           placeholder="请输入18位身份证号" autocomplete="off"
                                           data-val="true" data-val-required="身份证号不能为空"
                                           data-val-regex-pattern="^\d{17}(\d|X|x)$"
                                           data-val-regex="身份证号格式错误" value="${memberIdcard}" maxlength="18">
                                    <span class="input-group-btn">
                                        <button class="btn btn-warning">
                                            <i class="glyphicon glyphicon-transfer"></i> 读取
                                        </button>
                                    </span>
                                </div>
                                <div data-valmsg-for="memberIdcard" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_sex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员性别
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="memberSex" id="member_sex1" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="memberSex" id="member_sex2" value="2"> 女
                                </label>
                                <div data-valmsg-for="memberSex" data-valmsg-replace="true"></div>
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
                    <input type="hidden" name="cardTypeId" value="2" >
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_card_type1" class="col-sm-4 control-label">会员类型</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_card_type1" value="会员卡" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">余额(元)</label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" value="${cardBalance}元" disabled>
                                    <span class="input-group-btn">
                                        <a class="btn btn-primary" href="/member/getBalances?cardId=${cardId}&memberId=${memberId}">
                                            <i class="glyphicon glyphicon-th-list"></i> 明细
                                        </a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">操作人</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${operatorName}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
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
                            <label class="col-sm-4 control-label">注册时间</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${createTime}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="text-center">
                                <a href="javascript:;" class="btn btn-primary refresh-modal"
                                    data-loading-text="更新中...">
                                    <span class="glyphicon glyphicon-refresh"></span> 更新信息
                                </a>
                                <a href="#recharge_modal" class="btn btn-primary" data-toggle="modal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-usd"></span> 会员卡充值
                                </a>
                                <!--<a href="#shengjiModal" class="btn btn-primary shengji-modal" data-toggle="modal"
                                    data-backdrop="false">
                                    <span class="glyphicon glyphicon-flash"></span> 会员卡升级
                                </a>-->
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
        <div class="modal-dialog" style="width:800px;">
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
                                        <span class="text-danger">*</span> 补办金额(元)
                                    </label>

                                    <div class="col-sm-8 input-parent-magnifier">
                                        <input type="text" class="form-control input-element-magnifier" id="refresh_money"
                                               name="buBanMoney" placeholder="补办金额(元)" autocomplete="off"
                                               data-val="true" data-val-required="补办金额不能为空"
                                               data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                               data-val-regex="补办金额格式错误">
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
                                    <label for="refresh_send" class="col-sm-4 control-label">赠送金额(元)</label>

                                    <div class="col-sm-8 input-parent-magnifier">
                                        <input type="text" class="form-control input-element-magnifier" id="refresh_send"
                                               name="givingAmount" placeholder="请输入赠送金额(元)" autocomplete="off"
                                               data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                               data-val-regex="赠送金额格式错误">
                                        <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">新的卡号</label>

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
                                <div class="alert alert-info text-center" role="alert">
                                    合计金额：<span class="refresh-total-money text-danger">0</span>元（ = 补办金额 + 赠送金额）
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary refresh-card-submit" data-dismiss="modal"
                            data-loading-text="补办中...">
                        <span class="glyphicon glyphicon-ok"></span> 确认 & 补办
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="recharge_modal" tabindex="-1" role="dialog" aria-labelledby="recharge_modal_label">
        <div class="modal-dialog" style="width:800px;">
            <form class="modal-content recharge-card-form" onsubmit="return false;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="recharge_modal_label">会员卡充值</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <div class="panel panel-default form-horizontal">
                        <div class="panel-body">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="cardId" value="${cardId}" >
                                    <label for="recharge_money" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 充值金额(元)
                                    </label>

                                    <div class="col-sm-8 input-parent-magnifier">
                                        <input type="text" class="form-control input-element-magnifier"
                                               id="recharge_money" name="czMoney" placeholder="请输入充值金额(元)"
                                               autocomplete="off" data-val="true" data-val-required="充值金额不能为空"
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
                                        <input type="text" class="form-control input-element-magnifier"
                                               id="recharge_send" name="givingAmount" placeholder="请输入赠送金额(元)" autocomplete="off"
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
                                        <input type="text" class="form-control" id="recharge_check_no" name="balanceCheckNo"
                                               placeholder="请输入支票号" autocomplete="off"
                                               data-val="true" data-val-required="支票号不能为空">
                                        <div data-valmsg-for="balanceCheckNo" data-valmsg-replace="true"></div>
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
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary recharge-card-submit" data-dismiss="modal"
                            data-loading-text="充值中...">
                        <span class="glyphicon glyphicon-ok"></span> 确认 & 充值
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="shengjiModal" tabindex="-1" role="dialog" aria-labelledby="shengjiModalLabel">
        <div class="modal-dialog" style="width:800px;">
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
                                        <span class="text-danger">*</span> 升级金额(元)
                                    </label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="upper_money" name="upLevelMoney"
                                               placeholder="请输入升级金额(元)" autocomplete="off"
                                               data-val="true" data-val-required="升级金额不能为空"
                                               data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                               data-val-regex="升级金额格式错误">
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
                                    <label for="upper_send" class="col-sm-4 control-label">赠送金额(元)</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="upper_send" name="givingAmount"
                                               placeholder="请输入赠送金额(元)" autocomplete="off"
                                               data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="list"/>
</c:import>
