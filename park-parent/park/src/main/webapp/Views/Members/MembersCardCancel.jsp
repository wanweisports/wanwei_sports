<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/common/style.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/members/members_card_cancel.js?v=${static_resource_version}"></script>
    <script>
        // 表单校验配置
        $(document).ready(function () {
            $('#member_card_form, #cancel_card_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default member-card-panel">
            <div class="panel-heading">会员卡注销</div>
            <div class="panel-body">
                <form id="member_card_form" class="form-horizontal" novalidate onsubmit="return false;">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="card_no" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 会员卡号
                            </label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="card_no" name="cardNo" value="${cardNo}"
                                       placeholder="请输入会员卡号" autocomplete="off"
                                       data-val="true" data-val-required="会员卡号不能为空">
                                <div data-valmsg-for="cardNo" data-valmsg-replace="true"></div>
                            </div>
                            <div class="col-sm-4">
                                <a href="javascript:;" class="btn btn-success member-card-filter">
                                    <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员姓名</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${memberName }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">手机号码</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${memberMobile }" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">当前余额(元)</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="<c:if test='${cardBalance!=null}'>${cardBalance}元</c:if>" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">截止日期</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="${cardDeadline }" disabled>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default recharge-card-panel">
            <div class="panel-body">
                <form id="cancel_card_form" class="form-horizontal" novalidate onsubmit="return false;">
                    <input type="hidden" id="cancel_cardId" name="cardId" value="${cardId}">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="cancel_money" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 退款金额(元)
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="cancel_money" name="cancelMoney"
                                       placeholder="请输入退款金额(元)" autocomplete="off"
                                       data-val="true" data-val-required="退款金额不能为空"
                                       data-val-regex-pattern="^[1-9][0-9]*$"
                                       data-val-regex="退款金额格式错误" value="${cardBalance}">
                                <div data-valmsg-for="cancelMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
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
                                </select>
                                <div data-valmsg-for="balanceStyle" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="cancel_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                            <textarea class="form-control" id="cancel_remark" name="remark" rows="3"
                                      placeholder="请输入备注" autocomplete="off"></textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-footer" style="overflow: hidden;">
                <button type="button" class="btn btn-success cancel-card-submit pull-right">
                    <span class="glyphicon glyphicon-ok"></span> 确认 & 退款
                </button>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="会员卡注销"/>
</c:import>
