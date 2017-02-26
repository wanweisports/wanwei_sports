<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/autosuggest/autosuggest.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/autosuggest/autosuggest.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/reservations/reservations_batch.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#reservations_batch_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>批量预订</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <form id="reservations_batch_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">批量预订<p class="pull-right text-danger">在"预订人"输入框中，尝试着输入会员卡号、姓名、手机号作为检索条件。</p></div>
                <div class="panel-body">
                    <input type="hidden" id="reservations_batch_opType" name="opType" value="2"><!--1会员2散客-->
                    <input type="hidden" id="reservations_batch_member" name="memberId">
                    <input type="hidden" name="reserveType" value="1"><!--1PC-->
                    <input type="hidden" name="reserveModel" value="2"><!--1普通2批量-->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="reservations_batch_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 预订人
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="reservations_batch_name" name="name"
                                       placeholder="预订人姓名" autocomplete="off"
                                       data-val="true" data-val-required="预订人不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                       data-val-regex="预订人长度只能2~12个字符">
                                <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reservations_batch_site" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 场地类型
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="reservations_batch_site" name="siteClass"
                                        data-val="true" data-val-required="请选择场地类型">
                                    <option value="">请选择</option>
                                    <c:forEach var="sport" items="${siteSportNames}">
                                        <option value="${sport.sportId}">${sport.sportName}</option>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="siteclass" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="reservations_batch_mobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="reservations_batch_mobile" name="mobile"
                                       placeholder="手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误" maxlength="11">
                                <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reservations_batch_startDate" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 起始日期
                            </label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="reservations_batch_startDate" name="reserveStartDate"
                                           placeholder="起始日期" autocomplete="off"
                                           data-val="true" data-val-required="起始日期不能为空"
                                           data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                           data-val-regex="起始日期格式错误" maxlength="10">
                                    <span class="input-group-addon start-date-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="reserveStartDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-11">
                                <a href="/members/list" class="btn btn-primary" title="选择会员">
                                    <span class="glyphicon glyphicon-th-list"></span> 选择会员
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reservations_batch_endDate" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 终止日期
                            </label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="reservations_batch_endDate" name="reserveEndDate"
                                           placeholder="终止日期" autocomplete="off"
                                           data-val="true" data-val-required="终止日期不能为空"
                                           data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                           data-val-regex="终止日期格式错误" maxlength="10">
                                    <span class="input-group-addon end-date-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="reserveEndDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 预订周
                            </label>
                            <div class="col-sm-10">
                                <div>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="1" data-text="周一"> 周一
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="2" data-text="周二"> 周二
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="3" data-text="周三"> 周三
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="4" data-text="周四"> 周四
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="5" data-text="周五"> 周五
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="6" data-text="周六"> 周六
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="reserveWeek" value="7" data-text="周日"> 周日
                                    </label>
                                </div>
                                <div data-valmsg-for="reserveWeek" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="reservations_batch_siteId" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 场地编号
                                </label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="reservations_batch_siteId" name="siteId"
                                        data-val="true" data-val-required="请选择场地编号">
                                        <option value="">请选择</option>
                                    </select>
                                    <div data-valmsg-for="siteId" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="reservations_batch_start" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 开始时间
                                </label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="reservations_batch_start" name="siteStartTime"
                                           autocomplete="off" placeholder="开始时间"
                                           data-val="true" data-val-required="开始时间不能为空"
                                           data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                           data-val-regex="开始时间格式错误" maxlength="5">
                                    <div data-valmsg-for="siteStartTime" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="reservations_batch_end" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 结束时间
                                </label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="reservations_batch_end" name="siteEndTime"
                                           autocomplete="off" placeholder="结束时间"
                                           data-val="true" data-val-required="结束时间不能为空"
                                           data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                           data-val-regex="结束时间格式错误" maxlength="5">
                                    <div data-valmsg-for="siteEndTime" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="table-responsive sc-table">
                            <table class="table table-striped reservations-list">
                                <tr class="bg-info sc-table-header">
                                    <th>类型</th>
                                    <th>预订日期</th>
                                    <th>预订周</th>
                                    <th>预订时间</th>
                                    <th>场地</th>
                                    <th>操作</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="alert alert-info" role="alert">
                            <p>卡内余额：<span class="text-danger reservations-batch-cardMoney">0.00</span>元</p>
                            <p>总金额：<span class="text-danger reservations-batch-totalMoney">0.00</span>元</p>
                            <p>总场次：<span class="text-danger reservations-batch-totalNum">0</span>时</p>
                        </div>
                        <div class="form-group col-sm-12">
                            <button type="button" class="btn btn-primary col-sm-12" id="reservations_batch_add">
                                <span class="glyphicon glyphicon-plus"></span> 预订加场
                            </button>
                        </div>
                        <div class="form-group col-sm-12">
                            <button type="button" class="btn btn-primary col-sm-12" id="reservations_batch_confirm">
                                <span class="glyphicon glyphicon-usd"></span> 预订确认
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="modal fade" id="pay_modal" tabindex="-1" role="dialog" aria-labelledby="pay_modal_label">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="pay_modal_label">预订支付</h5>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form id="reservations_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
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
                                                       name="payCount" placeholder="支付场次" autocomplete="off"
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
                                                       name="paySumPrice" placeholder="支付金额(元)" autocomplete="off"
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
                                        <label for="reservations_money_type" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 支付方式
                                        </label>

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
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="reservations_paid_remark" class="col-sm-2 control-label">备注</label>

                                        <div class="col-sm-10">
                                            <textarea class="form-control" rows="3" id="reservations_paid_remark"
                                                      name="orderRemark" placeholder="备注"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="reservations_paid_money"
                                               class="col-sm-2 control-label text-success">实收金额</label>

                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="reservations_paid_money"
                                                       name="paySumPrice" placeholder="实收金额(元)" autocomplete="off"
                                                       value="0.00" disabled>
                                                <span class="input-group-addon">元</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="button" class="btn btn-primary" id="reservations_paid_confirm">
                                                <span class="glyphicon glyphicon-ok"></span> 支付
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="batch"/>
</c:import>
