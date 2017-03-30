<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/autosuggest/autosuggest.css?v=${static_resource_version}" rel="stylesheet"
          type="text/css">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}"
          rel="stylesheet" type="text/css">
    <link href="Content/lib/jquery/jquery-steps/jquery.steps.css?v=${static_resource_version}" rel="stylesheet"
          type="text/css">
    <link href="Content/style/reservations/reservations_sequence.min.css?v=${static_resource_version}" rel="stylesheet"
          type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/autosuggest/autosuggest.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/draggabilly/draggabilly.pkgd.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery-steps/jquery.steps.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/reservations/reservations_sequence.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#reservations_user_form, #reservations_paid_form').validate({
                ignore: ":hidden"
            });

            // 设置运动类型
            $(".sports-item[data-value='${sportId}']").removeClass("btn-default").addClass("btn-success");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>场地预订</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <c:set var="basketball" value="篮球"/>
    <c:set var="shuttercock" value="羽毛球"/>
    <c:set var="swimming" value="游泳"/>
    <c:set var="football" value="足球"/>
    <c:set var="pingpong" value="乒乓球"/>

    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default sequence-filter">
            <div class="panel-heading">
                <span>场地预订  </span>
                <div class="sports-list">
                    <c:forEach var="sport" items="${siteSports}">
                        <a href="/site/getSiteReservationInfo?sportId=${sport.sportId}"
                           class="btn btn-default sports-item"
                           data-value="${sport.sportId}" data-text="${sport.sportName}">
                            <c:choose>
                                <c:when test="${sport.sportName == shuttercock}">
                                    <img class="sports-icon sports-active"
                                         src="Content/images/sports/shuttercock-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive"
                                         src="Content/images/sports/shuttercock.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == basketball}">
                                    <img class="sports-icon sports-active"
                                         src="Content/images/sports/basketball-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive"
                                         src="Content/images/sports/basketball.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == swimming}">
                                    <img class="sports-icon sports-active"
                                         src="Content/images/sports/swimming-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive"
                                         src="Content/images/sports/swimming.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == football}">
                                    <img class="sports-icon sports-active"
                                         src="Content/images/sports/football-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive"
                                         src="Content/images/sports/football.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == pingpong}">
                                    <img class="sports-icon sports-active"
                                         src="Content/images/sports/pingpong-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive"
                                         src="Content/images/sports/pingpong.png?v=${static_resource_version}">
                                </c:when>
                            </c:choose>
                                ${sport.sportName}
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="panel-body" style="padding: 0; border-bottom: 1px solid #ddd;">
                <input type="hidden" value="${curDate}" id="current_date">
                <input type="hidden" value="${curSportId}" id="current_sport">
                <nav class="navbar navbar-default date-list">
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav sequence-date">
                            <li class="other-date-select">
                                <div class="input-group" style="margin-top: 3px; width: 150px;">
                                    <input type="text" class="form-control" id="other_date" name="otherDate"
                                           placeholder="选择日期" value="${curDate}">
                                    <span class="input-group-addon other-date-calendar">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <form class="form-inline" novalidate onsubmit="return false;" style="clear: both; display: none;">
                    <div class="form-group">
                        <label style="margin-left: 10px;">场地状态:</label>

                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="1" checked style="margin-top: 4px;"> 未付款
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="2" checked style="margin-top: 4px;"> 已付款
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="3" checked style="margin-top: 4px;"> 已锁定
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="4" checked style="margin-top: 4px;"> 不可预订
                        </label>
                    </div>
                    <div class="form-group" style="margin-left: 20px;">
                        <label style="margin-left: 10px;">用户类型:</label>

                        <label class="checkbox-inline">
                            <input type="checkbox" name="user_state" value="1" checked style="margin-top: 4px;"> 会员
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="user_state" value="2" checked style="margin-top: 4px;"> 散客
                        </label>
                    </div>
                    <div class="form-group pull-right" style="display: none;">
                        <button type="button" class="btn btn-default sequence-refresh">
                            <span class="glyphicon glyphicon-refresh"></span> 换 场
                        </button>
                        <button type="button" class="btn btn-default sequence-unlock">
                            <span class="glyphicon glyphicon-lock"></span> 解 锁
                        </button>
                        <button type="button" class="btn btn-default sequence-lock">
                            <span class="glyphicon glyphicon-lock"></span> 锁 场
                        </button>
                        <button type="button" class="btn btn-success sequence-order">
                            <span class="glyphicon glyphicon-ok"></span> 预 订
                        </button>
                    </div>
                </form>
            </div>
            <div class="sequence-show">
                <table class="table table-bordered venue-large" id="timing_table">
                    <tr class="timing-header">
                        <td></td>
                        <c:forEach var="site" items="${sites}" varStatus="loop">
                            <td data-id="${site.siteId}" data-col="${loop.index + 1}">${site.siteName}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach var="time" items="${timePeriod}" varStatus="row">
                        <tr class="timing-body" data-start="${time.startTime}" data-end="${time.endTime}">
                            <td class="time">${time.startTime} ~ ${time.endTime}</td>
                            <c:forEach var="site" items="${sites}" varStatus="col">
                                <td class="null" data-id="${site.siteId}" data-start="${time.startTime}"
                                    data-end="${time.endTime}" data-name="${site.siteName}" data-col="${col.index + 1}"
                                    data-row="${row.index + 1}" data-toggle="tooltip" data-placement="top"
                                    title="${site.siteName}(${time.startTime}-${time.endTime})"></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="pay_model" tabindex="-1" role="dialog" aria-labelledby="pay_model_label"
         aria-hidden="true">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="pay_model_label">预订支付</h5>
                </div>
                <div class="modal-body" style="overflow:hidden;">
                    <form id="reservations_user_form" class="form-horizontal clearfix" novalidate
                          onsubmit="return false;">
                        <input type="hidden" id="reservations_user_opType" name="opType" value="2">
                        <input type="hidden" id="reservations_user_member" name="memberId">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_user_name" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 预订人
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_user_name"
                                           name="name" placeholder="预订人姓名" autocomplete="off"
                                           data-val="true" data-val-required="预订人不能为空"
                                           data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                           data-val-regex="预订人长度只能2~12个字符">
                                    <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reservations_user_amount"
                                       class="col-sm-4 control-label text-success">预估金额</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_user_amount"
                                               name="amount" placeholder="预估金额(元)" autocomplete="off" disabled>
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_user_mobile" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 手机号码
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_user_mobile" name="mobile"
                                           placeholder="手机号码" autocomplete="off"
                                           data-val="true" data-val-required="手机号码不能为空"
                                           data-val-regex-pattern="^1\d{10}$"
                                           data-val-regex="手机号码格式错误" maxlength="11">
                                    <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reservations_paid_balance"
                                       class="col-sm-4 control-label text-success">会员余额</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_paid_balance"
                                               name="balance" autocomplete="off" value="0.00" disabled>
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <form id="reservations_paid_form" class="form-horizontal clearfix" novalidate
                          onsubmit="return false;">
                        <input type="hidden" id="reservations_paid_order" name="orderId">
                        <input type="hidden" id="reservations_paid_subAmount" name="subAmount" value="0">
                        <input type="hidden" id="reservations_paid_additionalPrice" name="additionalPrice" value="0">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_paid_orderSumCount" class="col-sm-4 control-label">总场次</label>

                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_paid_orderSumCount"
                                               name="orderSumCount" autocomplete="off" disabled>
                                        <span class="input-group-addon">时</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reservations_paid_orderSumPrice" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 总金额
                                </label>

                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_paid_orderSumPrice"
                                               name="orderSumPrice" placeholder="总金额(元)" autocomplete="off"
                                               data-val="true" data-val-required="总金额不能为空"
                                               data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                               data-val-regex="总金额格式错误">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <div data-valmsg-for="orderSumPrice" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_paid_payCount" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支付场次
                                </label>

                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_paid_payCount"
                                               name="payCount"
                                               placeholder="支付场次" autocomplete="off"
                                               data-val="true" data-val-required="支付场次不能为空"
                                               data-val-regex-pattern="^[1-9]\d*$"
                                               data-val-regex="支付场次格式错误">
                                        <span class="input-group-addon">时</span>
                                    </div>
                                    <div data-valmsg-for="payCount" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reservations_paid_paySumPrice" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 支付金额
                                </label>

                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_paid_paySumPrice"
                                               name="paySumPrice"
                                               placeholder="支付金额(元)" autocomplete="off"
                                               data-val="true" data-val-required="支付金额不能为空"
                                               data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                               data-val-regex="支付金额格式错误">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="col-sm-4 checkbox" style="text-align: right;">
                                    <label class="control-label" style="font-weight: 700; padding: 0;">
                                        <input type="checkbox" value="1" style="margin-top: 2px;"> 余额
                                    </label>
                                </div>

                                <div class="col-sm-8">
                                    <select class="form-control" id="reservations_money_type" name="payType">
                                        <option value="">请选择</option>
                                        <option value="1">现金</option>
                                        <option value="2">支付宝</option>
                                        <option value="3">微信</option>
                                        <option value="4">银联</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="reservations_paid_money"
                                       class="col-sm-4 control-label text-success">实收金额</label>

                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="reservations_paid_money"
                                               name="paySumPrice" placeholder="实收金额(元)" autocomplete="off"
                                               value="0.00" disabled>
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="reservations_paid_remark" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="3" id="reservations_paid_remark"
                                              name="orderRemark" placeholder="备注"></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <p class="text-danger pull-left">在"预订人"输入框中，尝试着输入会员卡号、姓名、手机号作为检索条件。</p>
                    <button type="button" class="btn btn-success" id="reservations_pay_order">
                        <span class="glyphicon glyphicon-ok"></span> 确认支付
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="attentionModal" tabindex="-1" role="dialog" aria-labelledby="attentionModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="attentionModalLabel">签到开场</h5>
                </div>
                <div class="modal-body">
                    <form id="attention_user_form" class="form-horizontal" novalidate onsubmit="return false;">
                        <input type="hidden" id="attention_user_opType" name="opType" value="2">
                        <input type="hidden" id="attention_user_card" name="signMemberCardNo">
                        <input type="hidden" id="attention_user_id" name="memberId">
                        <input type="hidden" id="attention_user_reserve" name="reserveTimeIds">
                        <div class="form-group">
                            <label for="attention_user_name" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 姓名
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="attention_user_name"
                                       name="signName" placeholder="姓名" value="散客" autocomplete="off"
                                       data-val="true" data-val-required="姓名不能为空">
                                <div data-valmsg-for="signName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attention_user_mobile" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="attention_user_mobile" name="signMobile"
                                       placeholder="手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="signMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <button class="btn btn-success pull-right" id="attention_user_confirm">
                                    <span class="glyphicon glyphicon-ok"></span> 确 定
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="right-order-plane show-orders-list">
        <div class="title">
            <ul>
                <li><span class="ordered"></span></li>
                <li>已选定</li>
                <li><span class="unpaid"></span></li>
                <li>未支付</li>
                <li><span class="disabled"></span></li>
                <li>不可预定</li>
            </ul>
        </div>
        <div class="info">
            <dl>
                <!--<dt>项目：</dt><dd><strong class="category-name">羽毛球</strong></dd>-->
                <dt>预订日期：</dt>
                <dd class="current-book-date">${curDate}</dd>
                <dt>预订场次：</dt>
            </dl>
            <ul class="selected-booking">
                <li class="none">请点击左侧列表选择场次</li>
            </ul>
            <div class="court-display">已选择 <span class="number">0</span>场地<span class="append-msg">，再次单击取消</span></div>
            <div class="price-display" style="display: none;">共计<span class="number">0元</span></div>

            <div style="clear: both; padding-top: 10px; margin-bottom: 10px; text-align: center;">
                <button type="button" class="btn btn-default sequence-refresh" data-click="no" style="display: none;">
                    <span class="glyphicon glyphicon-refresh"></span> 换 场
                </button>
                <button type="button" class="btn btn-primary sequence-attention" data-click="no">
                    <span class="glyphicon glyphicon-flag"></span> 开 场
                </button>
                <button type="button" class="btn btn-default sequence-unlock" data-click="no" style="display: none;">
                    <span class="glyphicon glyphicon-lock"></span> 解 锁
                </button>
                <button type="button" class="btn btn-default sequence-lock" data-click="no">
                    <span class="glyphicon glyphicon-lock"></span> 锁 场
                </button>
            </div>

            <a href="javascript:void(0);" class="submit-button sequence-order" data-click="no">预订支付</a>
        </div>
    </div>

    <div class="side-bar show-orders-btn draggable">
        <button class="btn btn-primary">隐藏</button>
    </div>

    <%--<div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="zhifuModalLabel">预订支付</h5>
                </div>
                <div class="modal-body">
                    <div class="reservations-steps">
                        <h1>谁预订场地</h1>
                        <div class="reservations-steps-user">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="reservations_user_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <input type="hidden" id="reservations_user_opType" name="opType" value="2">
                                        <input type="hidden" id="reservations_user_member" name="memberId">
                                        <div class="form-group">
                                            <label for="reservations_user_name" class="col-sm-3 control-label">
                                                <span class="text-danger">*</span> 姓名
                                            </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_user_name"
                                                       name="name" placeholder="姓名" value="散客" autocomplete="off"
                                                       data-val="true" data-val-required="姓名不能为空">
                                                <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_user_mobile" class="col-sm-3 control-label">
                                                <span class="text-danger">*</span> 手机号码
                                            </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_user_mobile" name="mobile"
                                                       placeholder="手机号码" autocomplete="off"
                                                       data-val="true" data-val-required="手机号码不能为空"
                                                       data-val-regex-pattern="^1\d{10}$"
                                                       data-val-regex="手机号码格式错误">
                                                <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_user_amount" class="col-sm-3 control-label">估计(元)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_user_amount" name="amount"
                                                       placeholder="估计价格" value="" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success pull-right" id="reservations_user_pay" data-val="1">
                                                    <span class="glyphicon glyphicon-arrow-right"></span> 去支付
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <h1>预订支付</h1>
                        <div class="reservations-steps-pay">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="reservations_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <input type="hidden" id="reservations_paid_order" name="orderId">
                                        <input type="hidden" id="reservations_paid_subAmount" name="subAmount" value="0">
                                        <input type="hidden" id="reservations_paid_additionalPrice" name="additionalPrice" value="0">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_paid_orderSumCount" class="col-sm-6 control-label">
                                                    <span class="text-danger">*</span> 总场次(时)
                                                </label>

                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="reservations_paid_orderSumCount"
                                                           name="orderSumCount" autocomplete="off" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_paid_orderSumPrice" class="col-sm-6 control-label">
                                                    <span class="text-danger">*</span> 总金额(元)
                                                </label>

                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="reservations_paid_orderSumPrice"
                                                           name="orderSumPrice" placeholder="总金额(元)" autocomplete="off"
                                                           data-val="true" data-val-required="总金额不能为空"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="总金额格式错误">
                                                    <div data-valmsg-for="orderSumPrice" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_paid_payCount" class="col-sm-6 control-label">
                                                    <span class="text-danger">*</span> 支付场次(时)
                                                </label>

                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="reservations_paid_payCount" name="payCount"
                                                           placeholder="支付场次" autocomplete="off"
                                                           data-val="true" data-val-required="支付场次不能为空"
                                                           data-val-regex-pattern="^[1-9]\d*$"
                                                           data-val-regex="支付场次格式错误">
                                                    <div data-valmsg-for="payCount" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_paid_paySumPrice" class="col-sm-6 control-label">
                                                    <span class="text-danger">*</span> 支付金额(元)
                                                </label>

                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="reservations_paid_paySumPrice" name="paySumPrice"
                                                           placeholder="支付金额(元)" autocomplete="off"
                                                           data-val="true" data-val-required="支付金额不能为空"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="支付金额格式错误">
                                                    <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_money_type" class="col-sm-3 control-label">
                                                    <span class="text-danger">*</span> 支付方式
                                                </label>

                                                <div class="col-sm-9">
                                                    <select class="form-control" id="reservations_money_type" name="payType"
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
                                                <label for="reservations_paid_remark" class="col-sm-3 control-label">备注</label>

                                                <div class="col-sm-9">
                                                <textarea class="form-control" rows="3" id="reservations_paid_remark"
                                                          name="orderRemark" placeholder="备注"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_paid_balance" class="col-sm-3 control-label">
                                                    <span class="text-danger">*</span> 余额(元)
                                                </label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_paid_balance"
                                                           name="balance" autocomplete="off" value="0.00" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_paid_money" class="col-sm-3 control-label">
                                                    <span class="text-danger">*</span> 实收金额(元)
                                                </label>

                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="reservations_paid_money" name="paySumPrice"
                                                           placeholder="实收金额(元)" autocomplete="off" value="0.00" disabled>
                                                </div>
                                                <div class="col-sm-3">
                                                    <button class="btn btn-success" id="reservations_paid_confirm">
                                                        <span class="glyphicon glyphicon-ok"></span> 确 定
                                                    </button>
                                                </div>
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
    </div>--%>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="sequence"/>
</c:import>