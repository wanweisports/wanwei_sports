<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li><a href="/users/membersQuery">会员查询</a></li>
            <li class="active">会员详情</li>
        </ol>
        <form id="user_form" class="form-horizontal" action="#" method="post" novalidate
              onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">会员信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="card_id" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员卡号
                                <input type="hidden" name="memberId" value="${memberId }" />
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
                                <input type="text" class="form-control" id="member_mobile" name=memberMobile
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误"
                                       value="${memberMobile }">
                                <div data-valmsg-for="member_mobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_mobile2" class="col-sm-4 control-label">备用手机</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_mobile2" name="memberMobile2"
                                       placeholder="请输入备用手机号码" autocomplete="off"
                                       data-val="true" data-val-required="备用手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="备用手机号码格式错误"
                                       value="${memberMobile2}">
                                <div data-valmsg-for="member_mobile2" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="payment_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支付类型
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="payment_type" name="memberType" disabled>
                                    <option value="1" selected>预付类型</option>
                                    <option value="2">记账类型</option>
                                </select>
                                <div data-valmsg-for="payment_type" data-valmsg-replace="true"></div>
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
                                       value="${memberName }">
                                <div data-valmsg-for="member_name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_idcard" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 身份证号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_idcard" name="cardTypeId"
                                       placeholder="请输入18位身份证号" autocomplete="off"
                                       data-val="true" data-val-required="身份证号不能为空"
                                       data-val-regex-pattern="^\d{18}$|^\d{17}(\d|X|x)$"
                                       data-val-regex="身份证号格式错误"
                                       value="${cardTypeId }">
                                <div data-valmsg-for="member_idcard" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_sex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员性别
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="memberSex" id="member_sex1" value="1"
                                           > 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="memberSex" id="member_sex2" value="2"
                                           > 女
                                </label>
                                <div data-valmsg-for="member_sex" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_birthday" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员生日
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group date form_datetime">
                                    <input type="text" class="form-control" id="member_birthday" name="memberBirthday"
                                           data-val="true" data-val-required="会员生日不能为空" value="${memberBirthday }" readonly>
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="member_birthday" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="member_address" class="col-sm-2 control-label">联系地址</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="member_address" name="memberAddress"
                                       placeholder="请输入联系地址" value="${memberAddress }">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                            <textarea class="form-control" id="member_remark" name="memberRemark" rows="3"
                                      placeholder="备注">${memberRemark }</textarea>
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
                            <label for="member_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员类型
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="member_type" name="cardTypeId" disabled>
                                   	<c:forEach var="type" items="${memberCarTypeNames}">
                                       	<option <c:if test="${type.cardTypeId==cardTypeId}">selected</c:if> value="${type.cardTypeId}">${type.cardTypeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员折扣</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardTypeDiscount }折" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">余额(元)</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" value="${cardBalance }" disabled>
                            </div>
                            <div class="col-sm-2">
                                <a href="member/getBalances?cardId=${cardId }" class="btn btn-primary" title="收支明细">
                                    <span class="glyphicon glyphicon-th-list"></span>
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">每周许可</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardTypeWeek }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">操作人</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${operatorName }" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员状态</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardStatus }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">有效期至</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardDeadline }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">每日许可</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardTypeTimeStart}-${cardTypeTimeEnd}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">注册时间</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${createTime }" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="text-center">
                                <p class="sc-submit-tips"></p>
                                <a href="#gengxinModal" class="btn btn-primary" data-toggle="modal" id="gengxinModal">
                                    <span class="glyphicon glyphicon-ok"></span> 更新会员信息
                                </a>
                                <a href="#chongzhiModal" class="btn btn-primary" data-toggle="modal">
                                    <span class="glyphicon glyphicon-usd"></span> 会员卡充值
                                </a>
                                <a href="#shengjiModal" class="btn btn-primary" data-toggle="modal">
                                    <span class="glyphicon glyphicon-flash"></span> 会员卡升级
                                </a>
                                <a href="#bubanModal" class="btn btn-primary" data-toggle="modal">
                                    <span class="glyphicon glyphicon-refresh"></span> 会员卡补办
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="bubanModal" tabindex="-1" role="dialog" aria-labelledby="bubanModalLabel">
    <div class="modal-dialog">
        <form class="modal-content refresh-card-form">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="bubanModalLabel">会员卡补办</h4>
            </div>
            <div class="modal-body" style="clear: both;">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <div class="col-sm-6">
                            <div class="form-group">
                            	<input type="hidden" name="cardId" value="${cardId }" >
                                <label for="refresh_money" class="col-sm-4 control-label">补办价格</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_money" name="buBanMoney"
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
                                    <select class="form-control" id="pay_type" name="balanceStyle">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="refresh_discount" class="col-sm-4 control-label">优惠金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_discount" name="subMoney"
                                           placeholder="请输入优惠金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="优惠金额格式错误">
                                    <div data-valmsg-for="refresh_money" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="refresh_send" class="col-sm-4 control-label">赠送金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="refresh_send" name="givingAmount"
                                           placeholder="请输入赠送金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[1-9][0-9]*$"
                                           data-val-regex="refresh_send">
                                    <div data-valmsg-for="refresh_money" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">会员卡号</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="${cardNo}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="">
                                </div>
                            </div>
                            <div class="alert alert-info" role="alert">合计金额: 19元(会员折扣: 95折)</div>
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
        <form class="modal-content recharge-card-form">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="chongzhiModalLabel">会员卡充值</h4>
            </div>
            <div class="modal-body" style="clear: both;">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <div class="col-sm-6">
                            <div class="form-group">
                            	<input type="hidden" name="cardId" value="${cardId }" >
                                <label for="recharge_money" class="col-sm-4 control-label">充值金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recharge_money" name="czMoney"
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
                                    <select class="form-control" id="recharge_type" name="balanceStyle">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                    </select>
                                    <div data-valmsg-for="pay_type" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="recharge_discount" class="col-sm-4 control-label">优惠金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recharge_discount" name="subMoney"
                                           value="" placeholder="请输入优惠金额">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="recharge_send" class="col-sm-4 control-label">赠送金额</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="recharge_send" name="givingAmount"
                                           value="" placeholder="请输入赠送金额">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="recharge_remark" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" id="recharge_remark" name="remark" rows="3" placeholder="备注"></textarea>
                                </div>
                            </div>
                            <div class="alert alert-info" role="alert">合计金额: 19元(会员折扣: 95折)</div>
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
        <form class="modal-content upgrade-card-form">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="shengjiModalLabel">会员卡升级</h4>
            </div>
            <div class="modal-body" style="clear: both;">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <div class="col-sm-6">
                            <div class="form-group">
                            	<input type="hidden" name="cardId" value="${cardId }" >
                                <label for="member_type" class="col-sm-4 control-label">会员类型</label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="member_type" name="cardTypeId">
                                        <c:forEach var="type" items="${memberCarTypeNames}">
                                       	<option value="${type.cardTypeId}">${type.cardTypeName}</option>
                                    </c:forEach>
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
                                    <input type="text" class="form-control" id="upper_money" name="upLevelMoney">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upper_type" class="col-sm-4 control-label">支付方式</label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="upper_type" name="upper_type">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">会费(元)</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="1000" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">截止日期</label>

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
                                    <input type="text" class="form-control" id="upper_discount" name="subMoney">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upper_send" class="col-sm-4 control-label">赠送费用</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="upper_send" name="givingAmount">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="upper_remark" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="upper_remark" name="remark" value="">
                                </div>
                            </div>
                            <div class="alert alert-info" role="alert">合计金额: 0元(会员折扣: 95折)</div>
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
                <h4 class="modal-title" id="gengxinModalLabel">提示框</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-info" role="alert">会员信息更新成功!</div>
            </div>
        </div>
    </div>
</div>
 
<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/users_members.js"></script>
<script src="Content/app/members/users_members_operations.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

<script type="text/javascript">
	$(function(){
		$("#gengxinModal").click(function (){
			              //接口名                 form表单对象               回调函数
			$.requestHttp("member/saveMember", $("#user_form"), function(data){
				alert(JSON.stringify(data));
				window.location.reload(true);
			});
		});
	});
</script>
