<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 <div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">会员类型设置</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="card_filter_form" class="form-inline col-sm-8" onsubmit="return false;">
                        <div class="form-group">
                            <select class="form-control" style="width:200px;" name="cardTypeStatus">
                                <c:if test="${!cardTypeStatus}">
                                    <option value="" selected>全部状态</option>
                                    <option value="1">正常</option>
                                    <option value="2">锁定</option>
                                </c:if>
                                <c:if test="${cardTypeStatus == 1}">
                                    <option value="">全部状态</option>
                                    <option value="1" selected>正常</option>
                                    <option value="2">锁定</option>
                                </c:if>
                                <c:if test="${cardTypeStatus == 2}">
                                    <option value="">全部状态</option>
                                    <option value="1">正常</option>
                                    <option value="2" selected>锁定</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary card-type-filter">
                                <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                            </a>
                        </div>
                    </form>
                    <div class="col-sm-4 text-right">
                        <button type="button" class="btn btn-primary card-type-add" data-toggle="modal"
                                data-target="#addModal">
                            <span class="glyphicon glyphicon-plus"></span> 增加会员类型
                        </button>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive card-type-list">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>会员类别</th>
                                <th>支付类型</th>
                                <th>会员周期</th>
                                <th>时间限制</th>
                                <th>会员折扣</th>
                                <th>提前时间</th>
                                <th>会费(元)</th>
                                <th>信用额度(元)</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="type" items="${list}">
                                <tr>
                                    <td>
                                        <a class="type-item" href="#addModal" data-toggle="modal" data-id="${type.cardTypeId}">
                                            ${type.cardTypeName}
                                        </a>
                                    </td>
                                    <td>
                                    <c:if test="${type.cardType == '1'}">预存类型</c:if>
                                    <c:if test="${type.cardType == '2'}">记账类型</c:if>
                                    </td>
                                    <td>${type.cardTypeMonth}个月</td>
                                    <td>
                                        <%-- fn函数：切分逗号分隔的开始时间和结束时间为数组【c:set：定义变量】 --%>
                                        <c:set var="timeStart" value="${fn:split(type.cardTypeTimeStart, ',')}" />
                                        <c:set var="timeEnd" value="${fn:split(type.cardTypeTimeEnd, ',')}" />
                                        <%-- 进行遍历输出显示周 --%>
                                        <c:forEach var="week" items="${fn:split(type.cardTypeWeek, ',')}" varStatus="status">
                                            周${week}: ${timeStart[status.index]}-${timeEnd[status.index]}<br> <%-- status.index：循环的下标,从0开始 --%>
                                        </c:forEach>
                                    </td>
                                    <td>${type.cardTypeDiscount / 10.0}折</td>
                                    <td>${type.cardTypeAhead}天</td>
                                    <td>${type.cardTypeMoney}</td>
                                    <td>${type.cardTypeCredit}</td>

                                    <c:if test="${type.cardTypeStatus=='1'}">
                                        <td class="text-success">正常</td>
                                    </c:if>
                                    <c:if test="${type.cardTypeStatus=='2'}">
                                        <td class="text-danger">锁定</td>
                                    </c:if>
                                    
                                    <td>${type.operatorName}</td>
                                    <td>${type.createTime}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" style="width: 680px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addModalLabel">设置会员类别</h4>
            </div>
            <div class="modal-body" style="overflow: hidden;">
                <form id="card_type_form" class="form-horizontal" method="post" onsubmit="return false;">
                    <input type="hidden" name="cardTypeId" id="card_type_id">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="card_type_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员类别
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="card_type_name" name="cardTypeName"
                                       placeholder="例如:普通会员,金卡会员" autocomplete="off"
                                       data-val="true" data-val-required="会员类别不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                       data-val-regex="会员类别长度只能2~6个字符">
                                <div data-valmsg-for="cardTypeName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="card_type_month" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员周期
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="card_type_month" name="cardTypeMonth">
                                    <option value="0">不限制</option>
                                    <option value="1">1个月</option>
                                    <option value="2">2个月</option>
                                    <option value="3">3个月</option>
                                    <option value="4">4个月</option>
                                    <option value="5">5个月</option>
                                    <option value="6">6个月</option>
                                    <option value="7">7个月</option>
                                    <option value="8">8个月</option>
                                    <option value="9">9个月</option>
                                    <option value="10">10个月</option>
                                    <option value="11">11个月</option>
                                    <option value="12">12个月</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="card_payment_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支付类型
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="card_payment_type" name="cardType">
                                    <option value="1">预存类型</option>
                                    <option value="2">记账类型</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="card_type_ahead" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 提前时间
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="card_type_ahead" name="cardTypeAhead"
                                       placeholder="提前预订时间(天)" autocomplete="off"
                                       data-val="true" data-val-required="提前预订时间不能为空"
                                       data-val-regex-pattern="^[0-9]|[1-9][0-9]$"
                                       data-val-regex="提前预订时间只能是数字">
                                <div data-valmsg-for="cardTypeAhead" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 时间限制
                            </label>

                            <div class="col-sm-10">
                                <div class="input-group">
                                    <label class="input-group-addon">
                                        <input type="checkbox" name="cardTypeWeek" value="1" checked> 周一
                                    </label>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" name="cardTypeWeek" value="2" checked> 周二
                                </span>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" name="cardTypeWeek" value="3" checked> 周三
                                </span>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" name="cardTypeWeek" value="4" checked> 周四
                                </span>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" name="cardTypeWeek" value="5" checked> 周五
                                </span>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" name="cardTypeWeek" value="6" checked> 周六
                                </span>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" name="cardTypeWeek" value="7" checked> 周日
                                </span>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeStart">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                    <div class="pull-left" style="width: 40%">
                                        <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="20:00" selected>20:00</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="card_type_money" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会费
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="card_type_money" name="cardTypeMoney"
                                       placeholder="会费(元)" autocomplete="off"
                                       data-val="true" data-val-required="会费不能为空"
                                       data-val-regex-pattern="^[0-9]|[1-9][0-9]$"
                                       data-val-regex="会费只能是数字">
                                <div data-valmsg-for="cardTypeMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group card-type-overdraw" style="display: none;">
                            <label for="card_type_overdraw" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 信用额度
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="card_type_overdraw" name="cardTypeCredit"
                                       placeholder="信用额度(元)" autocomplete="off"
                                       data-val="true" data-val-required="信用额度不能为空"
                                       data-val-regex-pattern="^[0-9]|[1-9][0-9]$"
                                       data-val-regex="信用额度只能是数字">
                                <div data-valmsg-for="cardTypeCredit" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="card_type_discount" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员折扣
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="card_type_discount" name="cardTypeDiscount"
                                       placeholder="会员折扣" autocomplete="off"
                                       data-val="true" data-val-required="会员折扣不能为空"
                                       data-val-regex-pattern="^[0-9]|[1-9][0-9]$"
                                       data-val-regex="会员折扣只能是数字">
                                <div data-valmsg-for="cardTypeDiscount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="cardTypeStatus1" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 状态
                            </label>

                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" id="cardTypeStatus1" name="cardTypeStatus" value="1" checked> 正常
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" id="card_type_status2" name="cardTypeStatus" value="2"> 锁定
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="save_card_type"><!-- data-dismiss="modal" -->
                    <span class="glyphicon glyphicon-ok"></span> 确 定
                </button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/lib/jquery/jquery.validate/jquery.validate.js"></script>
<script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js"></script>
<script src="Content/app/members/members_card_types.js?__inline"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

