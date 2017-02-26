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
    <script src="Content/app/members/members_card_refresh.js?v=${static_resource_version}"></script>
    <script>
        // 表单校验配置
        $(document).ready(function () {
            $('#member_card_form, #refresh_card_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员卡补办</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default member-card-panel">
            <div class="panel-heading">会员卡补办</div>
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
                                       placeholder="会员姓名, 手机号, 会员卡号" autocomplete="off"
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
                                <div class="input-group">
                                    <input type="text" class="form-control" value="<c:if test='${cardBalance!=null}'>${cardBalance}元</c:if>" disabled>
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

        <div class="panel panel-default refresh-card-panel">
            <div class="panel-body">
                <form id="refresh_card_form" class="form-horizontal" novalidate onsubmit="return false;">
                    <input type="hidden" id="refresh_cardId" name="cardId" value="${cardId}">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="refresh_money" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 补办金额(元)
                            </label>

                            <div class="col-sm-8 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="refresh_money" name="buBanMoney"
                                       placeholder="请输入补办价格(元)" autocomplete="off"
                                       data-val="true" data-val-required="补办价格不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="补办价格格式错误">
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
                                    <c:forEach var="pay" items="${payTypeList}">
                                        <c:if test="${pay.value != checkType}">
                                            <option value="${pay.value}">${pay.text}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="balanceStyle" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="refresh_send" class="col-sm-4 control-label">赠送金额(元)</label>

                            <div class="col-sm-8 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="refresh_send" name="givingAmount"
                                       placeholder="请输入赠送金额(元)" autocomplete="off"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="赠送金额格式错误">
                                <div data-valmsg-for="givingAmount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">新的卡号</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="newCardNo" name="newCardNo"
                                       placeholder="新会员卡号" autocomplete="off"
                                       data-val="true" data-val-required="新会员卡号不能为空" readonly>
                                <div data-valmsg-for="newCardNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="refresh_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                                <textarea class="form-control" id="refresh_remark" name="remark" rows="3"
                                      placeholder="请输入备注" autocomplete="off"></textarea>
                            </div>
                        </div>
                        <div class="alert alert-info text-center" role="alert">
                            合计金额：<span class="refresh-total-money ">0</span>元（ = 补办金额 + 赠送金额）
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="button" class="btn btn-primary col-sm-4 refresh-card-submit">
                                    <span class="glyphicon glyphicon-ok"></span> 确认 & 收款
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="refresh"/>
</c:import>
