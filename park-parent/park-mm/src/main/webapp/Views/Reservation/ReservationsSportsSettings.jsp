<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/reservations/reservations_sports_settings.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/reservations/reservations_sports.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#sports_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>场地类型设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">场地类型设置</div>
            <div class="panel-body">
                <button data-toggle="modal" class="btn btn-primary sports-add">
                    <span class="glyphicon glyphicon-plus"></span> 增加场地类型
                </button>
            </div>
        </div>

        <div class="panel panel-default sports-list">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>场地类型</th>
                            <th>单价(元)</th>
                            <th>预订押金(元)</th>
                            <th>开放时间</th>
                            <th>状态</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="sport" items="${list}">
                            <tr>
                                <td>${sport.sportName}</td>
                                <td>${sport.sportMoney}</td>
                                <td>${sport.sportDeposit}</td>
                                <td>${sport.startTime}-${sport.endTime}</td>
                                <c:if test="${sport.sportStatus == 1}">
                                    <td class="text-success">开放</td>
                                </c:if>
                                <c:if test="${sport.sportStatus == 2}">
                                    <td class="text-danger">关闭</td>
                                </c:if>
                                <td>${sport.operatorName}</td>
                                <td>${sport.createTime}</td>
                                <td>
                                    <button data-toggle="modal" class="btn btn-primary sports-update"
                                            data-id="${sport.sportId}">
                                        <i class="glyphicon glyphicon-edit"></i> 修改
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="setting_modal" tabindex="-1" role="dialog" aria-labelledby="setting_modal_label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="setting_modal_label">设置场地类型</h4>
                </div>
                <div class="modal-body">
                    <form id="sports_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" id="sport_id" name="sportId">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">场地类型</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="sport_name" name="sportName"
                                       placeholder="场地类型" autocomplete="off"
                                       data-val="true" data-val-required="场地类型不能为空">
                                <div data-valmsg-for="sportName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">单价/小时</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="sport_money" name="sportMoney"
                                       placeholder="单价/小时" autocomplete="off"
                                       data-val="true" data-val-required="单价不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="单价金额格式错误">
                                <div data-valmsg-for="sportMoney" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">预订押金</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="sport_deposit" name="sportDeposit"
                                       placeholder="预订押金" autocomplete="off"
                                       data-val="true" data-val-required="预订押金不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="预订押金格式错误">
                                <div data-valmsg-for="sportDeposit" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开放时间</label>
                            <div class="col-sm-5">
                                <input class="form-control" type="text" id="start_time" name="startTime"
                                       placeholder="开始时间" autocomplete="off"
                                       data-val="true" data-val-required="开始时间不能为空"
                                       data-val-regex-pattern="^\d{2}:\d{2}$"
                                       data-val-regex="开始时间格式错误" maxlength="5">
                                <div data-valmsg-for="startTime" data-valmsg-replace="true"></div>
                            </div>
                            <div class="col-sm-5">
                                <input class="form-control" type="text" id="end_time" name="endTime"
                                       placeholder="结束时间" autocomplete="off"
                                       data-val="true" data-val-required="结束时间不能为空"
                                       data-val-regex-pattern="^\d{2}:\d{2}$"
                                       data-val-regex="结束时间格式错误" maxlength="5">
                                <div data-valmsg-for="endTime" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型状态</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" id="sport_status1" name="sportStatus" value="1" checked> 开放
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" id="sport_status2" name="sportStatus" value="2"> 关闭
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary sports-confirm">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="sports"/>
</c:import>