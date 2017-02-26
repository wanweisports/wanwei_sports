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
    <script src="Content/app/teachers/teachers_meal_data.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#teacher_meal_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>教师管理</span> &gt;&gt; <span>教师订餐统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">教师订餐统计</div>
            <div class="panel-body">
                <form class="form-inline" id="data_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="javascript:;" class="btn btn-primary">今天</a>
                            <a href="javascript:;" class="btn btn-default">昨天</a>
                            <a href="javascript:;" class="btn btn-default">本周</a>
                            <a href="javascript:;" class="btn btn-default">本月</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="student_name" name="student_name"
                               placeholder="请输入教师姓名">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart" placeholder="开始日期"
                               value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd" placeholder="结束日期"
                               value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="#meal_modal" class="btn btn-warning add-meal" data-toggle="modal"
                           data-backdrop="false">
                            <span class="glyphicon glyphicon-tag"></span> 订餐登记
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">订餐总计:</li>
                <li style="margin-right: 15px;">普通餐 <span class="badge">${total}份</span></li>
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger">
                    <span class="glyphicon glyphicon-export"></span> 导出数据
                </a>
                <a href="javascript:;" class="btn btn-primary" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive teachers-meals-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>序号</th>
                            <th>订单号</th>
                            <th>订餐人</th>
                            <th>手机号</th>
                            <th>订餐类型</th>
                            <th>订餐份数</th>
                            <th>订餐时间</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <!--<tr>
                            <td>1</td>
                            <td>20161214111123</td>
                            <td>李老师</td>
                            <td>11012345678</td>
                            <td>普通餐</td>
                            <td>2份</td>
                            <td>2016-12-14</td>
                            <td>
                                <a class="btn btn-danger teachers-delete" href="javascript:;">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>20161214111123</td>
                            <td>李老师</td>
                            <td>11012345678</td>
                            <td>普通餐</td>
                            <td>4份</td>
                            <td>2016-12-14</td>
                            <td>
                                <a class="btn btn-danger teachers-delete" href="javascript:;">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>-->
                        <c:forEach var="data" items="${list}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${data.orderNo}</td>
                                <td>${data.mealOpName}</td>
                                <td>${data.mealOpMobile}</td>
                                <td>普通餐</td>
                                <td>${data.mealCount}份</td>
                                <td>${data.mealDate}</td>
                                <td>
                                    <a class="btn btn-danger teachers-delete" href="javascript:;" data-id="${data.mealId}">
                                        <span class="glyphicon glyphicon-trash"></span> 删除
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                        <p class="pull-left" style="margin: 12px 14px;">
                            <span>${pageSize}条/页</span>
                            <span>总${count}条</span>
                        </p>
                        <ul class="pagination pull-right">
                            <c:if test="${currentPage == 1}">
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>首页</span>
                                    </a>
                                </li>
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage != 1}">
                                <li>
                                    <a class="page-first" href="javascript:;" data-index="1">
                                        <span>首页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-prev" href="javascript:;" data-index="${currentPage - 1}">
                                        <span>上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${lastPage}">
                                <c:if test="${i == currentPage}">
                                    <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                                <c:if test="${i != currentPage}">
                                    <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${currentPage == lastPage}">
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>下一页</span>
                                    </a>
                                </li>
                                <li class="disabled">
                                    <a href="javascript:;" data-index="1">
                                        <span>末页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage != lastPage}">
                                <li>
                                    <a class="page-next" href="javascript:;" data-index="${currentPage + 1}">
                                        <span>下一页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-last" href="javascript:;" data-index="${lastPage}">
                                        <span>末页</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="meal_modal" tabindex="-1" role="dialog" aria-labelledby="meal_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="meal_modal_label">教师订餐</h5>
                </div>
                <div class="modal-body">
                    <form id="teacher_meal_form" class="form-horizontal" novalidate onsubmit="return false;">
                        <input type="hidden" id="teacher_meal_mealType" name="mealType" value="1">
                        <input type="hidden" id="teacher_meal_orderId" name="orderId">
                        <input type="hidden" id="teacher_meal_memberId" name="memberId">
                        <input type="hidden" id="teacher_meal_mealId" name="mealId">
                        <div class="form-group">
                            <label for="teacher_meal_mealOpName" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 教师姓名
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="teacher_meal_mealOpName" name="mealOpName"
                                       placeholder="教师姓名" autocomplete="off"
                                       data-val="true" data-val-required="教师姓名不能为空">
                                <div data-valmsg-for="mealOpName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacher_meal_mealOpMobile" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="teacher_meal_mealOpMobile" name="mealOpMobile"
                                       placeholder="手机号码" autocomplete="off" readonly="readonly"
                                       data-val="true" data-val-required="手机号码不能为空">
                                <div data-valmsg-for="mealOpMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacher_meal_orderNo" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 订单编号
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="teacher_meal_orderNo" name="orderNo"
                                       placeholder="订单编号" autocomplete="off" readonly="readonly"
                                       data-val="true" data-val-required="订单编号不能为空">
                                <div data-valmsg-for="orderNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teacher_meal_mealCount" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 订餐份数
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="teacher_meal_mealCount" name="mealCount"
                                       placeholder="订餐份数" autocomplete="off"
                                       data-val="true" data-val-required="订餐份数不能为空">
                                <div data-valmsg-for="mealCount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <button class="btn btn-primary pull-right" id="teacher_meal_confirm" >
                                    <span class="glyphicon glyphicon-ok"></span> 确 定
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_success_modal" tabindex="-1" role="dialog" aria-labelledby="tips_success_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_success_modal_label">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">订餐信息保存成功!</div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_delete_modal" tabindex="-1" role="dialog" aria-labelledby="tips_delete_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_delete_modal_label">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" role="alert">删除后无法恢复！您确定要删除此订餐信息吗？</div>
                    <input type="hidden" id="delete_teacherId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary confirm-delete">
                        <span class="glyphicon glyphicon-ok"></span> 确 认
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="teacher"/>
    <c:param name="subNav" value="meals"/>
</c:import>
