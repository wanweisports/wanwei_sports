<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/autosuggest/autosuggest.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-steps/jquery.steps.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/reservations/reservations_sequence.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/autosuggest/autosuggest.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery-steps/jquery.steps.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/moment/moment.min.js?v=${static_resource_version}"></script>
    <script src="/Content/app/reservations/reservations_sequence.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#reservations_user_form, #reservations_paid_form').validate({
                ignore: ":hidden"
            });

            // 设置运动类型
            $(".sports-item[data-value='${sportId}']").removeClass("btn-default").addClass("btn-primary");
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
                        <a href="/site/getSiteReservationInfo?sportId=${sport.sportId}" class="btn btn-default sports-item"
                                data-value="${sport.sportId}" data-text="${sport.sportName}">
                            <c:choose>
                                <c:when test="${sport.sportName == shuttercock}">
                                    <img class="sports-icon sports-active" src="/Content/images/sports/shuttercock-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive" src="/Content/images/sports/shuttercock.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == basketball}">
                                    <img class="sports-icon sports-active" src="/Content/images/sports/basketball-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive" src="/Content/images/sports/basketball.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == swimming}">
                                    <img class="sports-icon sports-active" src="/Content/images/sports/swimming-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive" src="/Content/images/sports/swimming.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == football}">
                                    <img class="sports-icon sports-active" src="/Content/images/sports/football-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive" src="/Content/images/sports/football.png?v=${static_resource_version}">
                                </c:when>
                                <c:when test="${sport.sportName == pingpong}">
                                    <img class="sports-icon sports-active" src="/Content/images/sports/pingpong-active.png?v=${static_resource_version}">
                                    <img class="sports-icon sports-inactive" src="/Content/images/sports/pingpong.png?v=${static_resource_version}">
                                </c:when>
                            </c:choose>
                            ${sport.sportName}
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="panel-body">
                <input type="hidden" value="${curDate}" id="current_date">
                <input type="hidden" value="${curSportId}" id="current_sport">
                <nav class="navbar navbar-default date-list">
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav sequence-date">
                            <li class="other-date-select">
                                <div class="input-group" style="margin-top: 3px;">
                                    <input type="text" class="form-control" id="other_date" name="otherDate"
                                           placeholder="选择日期">
                                    <span class="input-group-addon other-date-calendar">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <form class="form-inline" novalidate onsubmit="return false;" style="clear: both;">
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
                        <button type="button" class="btn btn-primary sequence-order">
                            <span class="glyphicon glyphicon-ok"></span> 预 订
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default sequence-show">
            <div class="panel-body">
                <table class="table table-bordered venue-large" id="timing_table">
                    <tr class="timing-header">
                        <td></td>
                        <c:forEach var="site" items="${sites}" varStatus="loop">
                            <td data-id="${site.siteId}" data-col="${loop.index}">${site.siteName}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach var="time" items="${timePeriod}">
                        <tr class="timing-body" data-start="${time.startTime}" data-end="${time.endTime}">
                            <td class="time">${time.startTime} ~ ${time.endTime}</td>
                            <c:forEach var="site" items="${sites}" varStatus="loop">
                                <td class="null" data-id="${site.siteId}" data-start="${time.startTime}"
                                    data-end="${time.endTime}" data-name="${site.siteName}"
                                    data-col="${loop.index + 1}"></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="panel panel-default sequence-tips" style="display: none;">
            <div class="panel-body">
                <span class="unpaid">未付款</span>
                <span class="ordered">已付款</span>
                <span class="locked">已锁定</span>
                <span class="disabled">不可预订</span>
            </div>
        </div>
    </div>

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
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
                                        <input type="hidden" id="reservations_op_type" name="opType" value="2">
                                        <input type="hidden" id="reservations_member" name="memberId" value="">
                                        <div class="form-group">
                                            <label for="reservations_name" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_name"
                                                       name="name" placeholder="姓名" value="散客" autocomplete="off"
                                                       data-val="true" data-val-required="姓名不能为空">
                                                <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_mobile" class="col-sm-3 control-label">手机号</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_mobile" name="mobile"
                                                       placeholder="手机号码" autocomplete="off"
                                                       data-val="true" data-val-required="手机号码不能为空"
                                                       data-val-regex-pattern="^1\d{10}$"
                                                       data-val-regex="手机号码格式错误">
                                                <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_amount" class="col-sm-3 control-label">预计(元)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_amount" name="amount"
                                                       placeholder="预计价格" value="" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <p class="sc-submit-tips"></p>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-primary pull-right reservations-pay" data-val="1">
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
                                        <input type="hidden" id="reservations_order_id" name="orderId">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_order_no" class="col-sm-2 control-label">订单号</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="reservations_order_no"
                                                           name="orderno" placeholder="订单号" value="" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_ex_money" class="col-sm-4 control-label">附加金额</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_ex_money" name="additionalPrice"
                                                           placeholder="附加金额(元)" autocomplete="off"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="附加金额格式错误">
                                                    <div data-valmsg-for="additionalPrice" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_money_type" class="col-sm-4 control-label">支付方式</label>

                                                <div class="col-sm-8">
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
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_se_money" class="col-sm-4 control-label">优惠金额</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_se_money" name="subAmount"
                                                           placeholder="优惠金额(元)" autocomplete="off"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="优惠金额格式错误">
                                                    <div data-valmsg-for="subAmount" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                            <!--<div class="form-group">
                                                <label for="reservations_money_no" class="col-sm-4 control-label">支票号</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_money_no" name="checkNo"
                                                           placeholder="支票号" value="" autocomplete="off">
                                                </div>
                                            </div>-->
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_pay_remark" class="col-sm-2 control-label">备注</label>

                                                <div class="col-sm-10">
                                                        <textarea class="form-control" rows="3" id="reservations_pay_remark"
                                                                  name="orderRemark" placeholder="备注"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_real_money" class="col-sm-2 control-label">实收金额</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_real_money" name="paySumPrice"
                                                           placeholder="请输入实收金额(元)" autocomplete="off"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="实收金额格式错误">
                                                    <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                                                    <!--<p class="bg-info">应收: 100元</p>-->
                                                </div>
                                                <div class="col-sm-2">
                                                    <button class="btn btn-primary reservations-pay-confirm">
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
    </div>

    <div class="modal fade tips-modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-danger text-message">您确定要锁定这些场地?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                    <button type="button" class="btn btn-primary">确 定</button>
                </div>
            </div>
        </div>
    </div>

    <div class="right-order-plane show-orders-list">
        <div class="title">
            <ul>
                <li><span class="ordered"></span></li><li>已选定</li>
                <li><span class="unpaid"></span></li><li>未选定</li>
                <li><span class="disabled"></span></li><li>不可预定</li>
            </ul>
        </div>
        <div class="info">
            <dl>
                <dt>项目：</dt><dd><strong class="category-name">羽毛球</strong></dd>
                <dt>日期：</dt><dd class="current-book-date">2016年11月18日(周五)</dd>
                <dt>场次：</dt>
            </dl>
            <ul class="selected-booking">
                <li class="none">请点击左侧列表选择场次</li>
            </ul>
            <div class="court-display">已选择 <span class="number">0</span>场地<span class="append-msg">，再次单击取消</span></div>
            <div class="price-display" style="display: none;">共计<span class="number">0元</span></div>

            <div style="clear: both; padding-top: 10px;">
                <button type="button" class="btn btn-default sequence-refresh" data-click="no">
                    <span class="glyphicon glyphicon-refresh"></span> 换 场
                </button>
                <button type="button" class="btn btn-default sequence-unlock" data-click="no" style="display: none;">
                    <span class="glyphicon glyphicon-lock"></span> 解 锁
                </button>
                <button type="button" class="btn btn-default sequence-lock" data-click="no">
                    <span class="glyphicon glyphicon-lock"></span> 锁 场
                </button>
            </div>

            <a href="javascript:void(0);" class="submit-button sequence-order" data-click="no" style="display: none;">预订支付</a>
        </div>
    </div>

    <div class="side-bar show-orders-btn">
        <a href="javascript:;" class="btn btn-warning">隐藏</a>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="sequence"/>
</c:import>