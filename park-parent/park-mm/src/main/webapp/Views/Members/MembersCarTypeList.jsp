<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/members/members_card_types.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 表单校验设置
            $('#card_type_form').validate({
                ignore: ":hidden"
            });

            // 选中的卡类型状态
            $("#cardTypeStatus").val('${cardTypeStatus}');
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员类型设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">会员设置</div>
            <div class="panel-body">
                <form id="card_filter_form" class="form-inline col-sm-8" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;" name="cardTypeStatus"
                                id="cardTypeStatus">
                            <option value="">全部状态</option>
                            <option value="1">正常</option>
                            <option value="2">锁定</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary card-type-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                </form>
                <div class="col-sm-4 text-right" style="display: none;">
                    <button type="button" class="btn btn-primary card-type-add" data-toggle="modal"
                            data-target="#addModal" data-backdrop="false">
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
                        <tr class="bg-info">
                            <th>序号</th>
                            <th>会员类别</th>
                            <th>会员周期</th>
                            <th>会费(元)</th>
                            <th>押金(元)</th>
                            <th>开放时间</th>
                            <th>状态</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="type" items="${list}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${type.cardTypeName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${type.cardTypeMonth > 0}">${type.cardTypeMonth}个月</c:when>
                                        <c:otherwise>不限制</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${type.cardTypeMoney}</td>
                                <td>${type.cardDeposit}</td>
                                <td>
                                        <%-- fn函数：切分逗号分隔的开始时间和结束时间为数组【c:set：定义变量】 --%>
                                    <c:set var="timeStart" value="${fn:split(type.cardTypeTimeStart, ',')}" />
                                    <c:set var="timeEnd" value="${fn:split(type.cardTypeTimeEnd, ',')}" />
                                        <%-- 进行遍历输出显示周 --%>
                                    <c:forEach var="week" items="${fn:split(type.cardTypeWeek, ',')}" varStatus="status">
                                        周${week}: ${timeStart[status.index]}-${timeEnd[status.index]}<br> <%-- status.index：循环的下标,从0开始 --%>
                                    </c:forEach>
                                </td>

                                <c:if test="${type.cardTypeStatus=='1'}">
                                    <td class="text-success">正常</td>
                                </c:if>
                                <c:if test="${type.cardTypeStatus=='2'}">
                                    <td class="text-danger">锁定</td>
                                </c:if>

                                <td>${type.operatorName}</td>
                                <td>${type.createTime}</td>
                                <td>
                                    <a class="btn btn-primary type-item" href="#addModal" data-toggle="modal"
                                       data-backdrop="false" data-id="${type.cardTypeId}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
                    <h5 class="modal-title" id="addModalLabel">设置会员类别</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form id="card_type_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="cardTypeId" id="card_type_id">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="card_type_name" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 会员类别
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="card_type_name" name="cardTypeName"
                                           placeholder="例如:会员卡,教师卡" autocomplete="off"
                                           data-val="true" data-val-required="类别名称不能为空"
                                           data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                           data-val-regex="类别名称长度只能2~6个字符">
                                    <div data-valmsg-for="cardTypeName" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="card_type_month" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 会员周期
                                </label>

                                <div class="col-sm-8">
                                    <select class="form-control" id="card_type_month" name="cardTypeMonth">
                                        <option value="0">不限制</option>
                                        <c:forEach var="i" begin="1" end="12">
                                            <option value="${i}">${i}个月</option>
                                        </c:forEach>
                                    </select>
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
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                    <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-group-addon">
                                            <input type="checkbox" name="cardTypeWeek" value="2" checked> 周二
                                        </label>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeStart">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-group-addon">
                                            <input type="checkbox" name="cardTypeWeek" value="3" checked> 周三
                                        </label>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeStart">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-group-addon">
                                            <input type="checkbox" name="cardTypeWeek" value="4" checked> 周四
                                        </label>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeStart">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-group-addon">
                                            <input type="checkbox" name="cardTypeWeek" value="5" checked> 周五
                                        </label>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeStart">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-group-addon">
                                            <input type="checkbox" name="cardTypeWeek" value="6" checked> 周六
                                        </label>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeStart">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-group-addon">
                                            <input type="checkbox" name="cardTypeWeek" value="7" checked> 周日
                                        </label>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeStart">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="pull-left" style="width: 40%">
                                            <select class="form-control timeWeek" name="cardTypeTimeEnd">
                                                <c:forEach var="i" begin="0" end="24">
                                                    <c:if test="${i < 10}">
                                                        <option value="0${i}:00">0${i}:00</option>
                                                    </c:if>
                                                    <c:if test="${i >= 10}">
                                                        <option value="${i}:00">${i}:00</option>
                                                    </c:if>
                                                </c:forEach>
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
                                           data-val-regex-pattern="^(0(\.[0-9]{1,2})?)|([1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="会费格式错误">
                                    <div data-valmsg-for="cardTypeMoney" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="card_deposit" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 押金
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="card_deposit" name="cardDeposit"
                                           placeholder="押金" autocomplete="off"
                                           data-val="true" data-val-required="押金不能为空"
                                           data-val-regex-pattern="^(0(\.[0-9]{1,2})?)|([1-9][0-9]*(\.[0-9]{1,2})?)$"
                                           data-val-regex="押金格式错误">
                                    <div data-valmsg-for="cardDeposit" data-valmsg-replace="true"></div>
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
                    <button type="button" class="btn btn-primary" id="save_card_type">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="setting"/>
</c:import>

