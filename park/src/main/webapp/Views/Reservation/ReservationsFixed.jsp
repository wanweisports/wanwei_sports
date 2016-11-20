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
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#reservations_fixed_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>定场预订</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <form id="reservations_fixed_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default sc-booking-user">
                <div class="panel-heading">定场预订</div>
                <div class="panel-body">
                    <input type="hidden" name="memberId" value="">
                    <input type="hidden" name="opType" value="2"> <!--1会员2散客-->
                    <input type="hidden" name="reserveType" value="1"><!--1PC-->
                    <input type="hidden" name="reserveModel" value="2"><!--1普通2批量-->
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="block_user_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 预订人
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="block_user_name" name="name"
                                       placeholder="预订人" autocomplete="off" value="散客"
                                       data-val="true" data-val-required="预订人不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                       data-val-regex="预订人长度只能2~12个字符">
                                <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block_user_degree" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 场地类型
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="block_user_degree" name="siteclass"
                                        data-val="true" data-val-required="请选择场地类型">
                                    <option value="1">羽毛球</option>
                                </select>
                                <div data-valmsg-for="siteclass" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block_time_start" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 开始时间
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="block_time_start" name="siteStartTime">
                                    <option value="08:00">08:00</option>
                                    <option value="09:00">09:00</option>
                                    <option value="10:00">10:00</option>
                                    <option value="11:00">11:00</option>
                                    <option value="12:00">12:00</option>
                                    <option value="13:00">13:00</option>
                                    <option value="14:00">14:00</option>
                                    <option value="15:00">15:00</option>
                                    <option value="16:00">16:00</option>
                                    <option value="17:00">17:00</option>
                                    <option value="18:00">18:00</option>
                                    <option value="19:00">19:00</option>
                                    <option value="20:00">20:00</option>
                                    <option value="21:00">21:00</option>
                                    <option value="22:00">22:00</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="block_user_phone" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="block_user_phone" name="mobile"
                                       placeholder="手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 预订日期
                            </label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="block_date" name="reserveStartDate"
                                           placeholder="预订日期" autocomplete="off"
                                           data-val="true" data-val-required="预订日期不能为空">
                                    <span class="input-group-addon start-date-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="reserveStartDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block_time_end" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 结束时间
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="block_time_end" name="siteEndTime">
                                    <option value="08:00">08:00</option>
                                    <option value="09:00">09:00</option>
                                    <option value="10:00">10:00</option>
                                    <option value="11:00">11:00</option>
                                    <option value="12:00">12:00</option>
                                    <option value="13:00">13:00</option>
                                    <option value="14:00">14:00</option>
                                    <option value="15:00">15:00</option>
                                    <option value="16:00">16:00</option>
                                    <option value="17:00">17:00</option>
                                    <option value="18:00">18:00</option>
                                    <option value="19:00">19:00</option>
                                    <option value="20:00">20:00</option>
                                    <option value="21:00">21:00</option>
                                    <option value="22:00">22:00</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <a href="javascript:void(0);" class="btn btn-primary user-search" title="搜索">
                                    <span class="glyphicon glyphicon-search"></span> 搜索
                                </a>
                                <a href="/members/list" class="btn btn-primary" title="选择会员">
                                    <span class="glyphicon glyphicon-th-list"></span> 选择会员
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block_venue_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 场地编号
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control" id="block_venue_name" name="siteId">
                                    <option value="1">场地1</option>
                                    <option value="2">场地2</option>
                                    <option value="3">场地3</option>
                                    <option value="4">场地4</option>
                                    <option value="5">场地5</option>
                                    <option value="6">场地6</option>
                                    <option value="7">场地7</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default sc-booking-venue">
                <div class="panel-body">
                    <div class="col-sm-9">
                        <div class="table-responsive sc-table">
                            <table class="table table-striped sc-booking-venues reservations-list">
                                <tr class="sc-table-header">
                                    <th>类型</th>
                                    <th>预订日期</th>
                                    <th>预订时间</th>
                                    <th>场地</th>
                                    <th>操作</th>
                                </tr>
                                <tr>
                                    <td>羽毛球</td>
                                    <td>2016-07-01</td>
                                    <td>10:00 ~ 11:00</td>
                                    <td>场地1</td>
                                    <td>
                                        <a href="javascript:;" class="btn btn-danger">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>羽毛球</td>
                                    <td>2016-07-01</td>
                                    <td>14:00 ~ 15:00</td>
                                    <td>场地1</td>
                                    <td>
                                        <a href="javascript:;" class="btn btn-danger">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <p class="sc-submit-tips text-center"></p>
                        <div class="form-group col-sm-12">
                            <button type="button" class="btn btn-primary col-sm-12 booking-add">
                                <span class="glyphicon glyphicon-plus"></span> 加场
                            </button>
                        </div>
                        <div class="form-group col-sm-12">
                            <button type="submit" class="btn btn-primary col-sm-12 booking-pay">
                                <span class="glyphicon glyphicon-usd"></span> 预 订
                            </button>
                        </div>
                        <!--<div class="form-group col-sm-12" style="display: none;">
                            <button type="submit" class="btn btn-primary col-sm-12 booking-confirm">
                                <span class="glyphicon glyphicon-ok"></span> 预订确认
                            </button>
                        </div>-->
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="zhifuModalLabel">预订支付</h5>
                </div>
                <div class="modal-body">
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
                                           placeholder="请输入附加金额(元)" autocomplete="off"
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
                                           placeholder="请输入优惠金额(元)" autocomplete="off"
                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="优惠金额格式错误">
                                    <div data-valmsg-for="subAmount" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reservations_money_no" class="col-sm-4 control-label">支票号</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="reservations_money_no" name="checkNo"
                                           placeholder="支票号" value="" autocomplete="off">
                                </div>
                            </div>
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="fixed"/>
</c:import>
