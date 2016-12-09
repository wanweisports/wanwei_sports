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
    <script src="/Content/app/office/office_schedule.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#user_schedule_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>排班管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <style>
        .progress {
            margin-bottom: 0;
        }
        .edit-schedule {
            cursor: pointer;
        }
    </style>
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">排班表</div>
            <div class="panel-body">
                <form id="data_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/office/schedule?date=1" data-date="1" class="btn btn-default schedule-date">上周</a>
                            <a href="/office/schedule?date=1" data-date="1" class="btn btn-primary schedule-date">本周</a>
                            <a href="/office/schedule?date=1" data-date="1" class="btn btn-default schedule-date">下周</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"
                               placeholder="开始日期" value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd"
                               placeholder="结束日期" value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary data-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="#schedule_modal" class="btn btn-primary add-schedule" data-toggle="modal"
                           data-backdrop="false">
                            <span class="glyphicon glyphicon-plus"></span> 添加值班
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">周一（2016-12-05）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="21">
                                <div class="progress edit-schedule" data-target="#schedule_modal" data-toggle="modal"
                                     data-backdrop="false" data-id="1">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="12"></td>
                        </tr>
                        <tr>
                            <td colspan="19"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td colspan="27"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">周二（2016-12-06）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="10">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="23"></td>
                        </tr>
                        <tr>
                            <td colspan="10"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="16"></td>
                        </tr>
                        <tr>
                            <td colspan="18"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="24"></td>
                            <td colspan="9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">周三（2016-12-07）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="21">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="12"></td>
                        </tr>
                        <tr>
                            <td colspan="19"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td colspan="27"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">周四（2016-12-08）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="10">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="23"></td>
                        </tr>
                        <tr>
                            <td colspan="10"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="16"></td>
                        </tr>
                        <tr>
                            <td colspan="18"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="24"></td>
                            <td colspan="9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">周五（2016-12-09）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="21">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="12"></td>
                        </tr>
                        <tr>
                            <td colspan="19"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td colspan="27"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">周六（2016-12-10）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="10">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="23"></td>
                        </tr>
                        <tr>
                            <td colspan="10"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="16"></td>
                        </tr>
                        <tr>
                            <td colspan="18"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="24"></td>
                            <td colspan="9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">周日（2016-12-11）</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>10:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>14:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>18:00</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="21">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="12"></td>
                        </tr>
                        <tr>
                            <td colspan="19"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td colspan="27"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="schedule_modal" tabindex="-1" role="dialog" aria-labelledby="schedule_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="schedule_modal_label">值班安排</h5>
                </div>
                <div class="modal-body">
                    <form id="user_schedule_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" id="user_schedule_id" name="schedulingId">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 选择日期
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="user_schedule_date" name="date"
                                       placeholder="选择日期" autocomplete="off"
                                       data-val="true" data-val-required="选择日期不能为空"
                                       data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                       data-val-regex="选择日期格式错误">
                                <div data-valmsg-for="date" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 起止时间
                            </label>
                            <div class="col-sm-5">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="user_schedule_start" name="startTime"
                                           placeholder="开始时间" autocomplete="off"
                                           data-val="true" data-val-required="开始时间不能为空">
                                </div>
                                <div data-valmsg-for="startTime" data-valmsg-replace="true"></div>
                            </div>
                            <div class="col-sm-5">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="user_schedule_end" name="endTime"
                                           placeholder="结束时间" autocomplete="off"
                                           data-val="true" data-val-required="结束时间不能为空">
                                </div>
                                <div data-valmsg-for="endTime" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 值班老师
                            </label>
                            <div class="col-sm-10">
                                <select class="form-control" id="user_schedule_operator" name="operatorId"
                                        data-val="true" data-val-required="请选择值班老师">
                                    <option value="">请选择</option>
                                    <c:forEach var="operator" items="${operators}">
                                        <option value="${operator.id}">${operator.operatorName}(${operator.roleName})</option>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="operatorId" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">工作内容</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="user_schedule_job" name="schedulingJob"
                                          placeholder="工作内容" autocomplete="off"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="user_schedule_submit">
                        <span class="glyphicon glyphicon-ok"></span> 保 存
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">值班信息提交成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="schedule"/>
</c:import>
