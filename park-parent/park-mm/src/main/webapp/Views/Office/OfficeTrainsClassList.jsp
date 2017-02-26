<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/office/office_trains_class_list.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#class_form').validate({
                ignore: ":hidden"
            });

            $("#trains_filter_course").val('${courseId}');
            $("#trains_filter_class").val('${classStatus}');
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>培训班级管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">培训班级管理</div>
            <div class="panel-body">
                <form id="trains_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;" name="courseId" id="trains_filter_course">
                            <option value="">全部课程</option>
                            <c:forEach var="course" items="${courseNames.courseNames}">
                                <option value="${course.id}">${course.courseName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;" name="classStatus" id="trains_filter_class">
                            <option value="">全部班级</option>
                            <option value="1">未开始</option>
                            <option value="2">已开始</option>
                            <option value="3">已结束</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary trains-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#add_class_modal" data-backdrop="false">
                            <span class="glyphicon glyphicon-plus"></span> 添加班级
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive class-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>班级名称</th>
                            <th>班级描述</th>
                            <th>课程名称</th>
                            <th>价格</th>
                            <th>起止日期</th>
                            <th>报名人数</th>
                            <th>报名状态</th>
                            <th>责任老师</th>
                            <th>手机号码</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${list}">
                            <tr>
                                <td>${item.className}</td>
                                <c:if test="${fn:length(item.classRemark) > 10}">
                                    <td>${fn:substring(item.classRemark, 0, 10)}...</td>
                                </c:if>
                                <c:if test="${fn:length(item.classRemark) <= 10}">
                                    <td>${item.classRemark}</td>
                                </c:if>
                                <td>${item.courseName}</td>
                                <td>${item.classPrice}元</td>
                                <c:if test="${item.unSignClass == 1}">
                                    <td class="text-danger">${item.startTime} 至 ${item.endTime}</td>
                                    <td class="text-danger">0名</td>
                                    <td class="text-danger">未开始</td>
                                </c:if>
                                <c:if test="${item.signClass == 1}">
                                    <td class="text-success">${item.startTime} 至 ${item.endTime}</td>
                                    <td class="text-success">
                                        <a href="<%=basePath%>office/getTrainsStudents?classId=${item.id}">${item.studentsCount}名</a>
                                    </td>
                                    <td class="text-success">报名中</td>
                                </c:if>
                                <c:if test="${item.signedClass == 1}">
                                    <td class="text-muted">${item.startTime} 至 ${item.endTime}</td>
                                    <td class="text-muted">
                                        <a href="<%=basePath%>office/getTrainsStudents?classId=${item.id}">${item.studentsCount}名</a>
                                    </td>
                                    <td class="text-muted">已结束</td>
                                </c:if>
                                <td>${item.leaderName}</td>
                                <td>${item.leaderMobile}</td>
                                <td>
                                    <button type="button" class="btn btn-primary class-view" data-toggle="modal"
                                            data-target="#add_class_modal" data-backdrop="false" data-id="${item.id}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </button>
                                    <%--<button type="button" class="btn btn-danger" data-id="${item.id}">
                                        <span class="glyphicon glyphicon-remove"></span> 删除
                                    </button>--%>
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
                    <c:if test="${fn:length(list) == 0}">
                        <p class="text-muted no-list-count">没有检索到任何班级！</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="add_class_modal" tabindex="-1" role="dialog" aria-labelledby="add_class_modal_label">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="add_class_modal_label">班级编辑</h5>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form id="class_form" class="form-horizontal" onsubmit="return false;">
                                <input type="hidden" id="class_id" name="id">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="class_name" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 班级名称
                                        </label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="class_name" name="className"
                                                   placeholder="例如, 兴趣班, 乔丹班" autocomplete="off"
                                                   data-val="true" data-val-required="班级名称不能为空"
                                                   data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                                   data-val-regex="班级名称长度只能2~6个字符">
                                            <div data-valmsg-for="className" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="course_name" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 课程名称
                                        </label>

                                        <div class="col-sm-8">
                                            <select class="form-control" id="course_name" name="courseId"
                                                    data-val="true" data-val-required="请选择课程名称">
                                                <option value="">请选择</option>
                                                <c:forEach var="course" items="${courseNames.courseNames}">
                                                    <option value="${course.id}">${course.courseName}</option>
                                                </c:forEach>
                                            </select>
                                            <div data-valmsg-for="courseId" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="class_desc" class="col-sm-2 control-label">班级描述</label>

                                        <div class="col-sm-10">
                                        <textarea class="form-control" id="class_desc" name="classRemark" rows="3"
                                                  placeholder="课程描述"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="start_date" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 开始日期
                                        </label>

                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="start_date" name="startTime"
                                                       placeholder="开始日期" autocomplete="off"
                                                       data-val="true" data-val-required="开始日期不能为空"
                                                       data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                                       data-val-regex="开始日期格式错误" maxlength="10">
                                                <span class="input-group-addon class-start-select">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                            </div>
                                            <div data-valmsg-for="startTime" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="leader_teacher" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 责任老师
                                        </label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="leader_teacher" name="leaderName"
                                                   placeholder="责任老师" autocomplete="off"
                                                   data-val="true" data-val-required="责任老师不能为空"
                                                   data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                                   data-val-regex="责任老师长度只能2~6个字符">
                                            <div data-valmsg-for="leaderName" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="class_price" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 班级价格
                                        </label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="class_price" name="classPrice"
                                                   placeholder="班级价格" autocomplete="off"
                                                   data-val="true" data-val-required="班级价格不能为空"
                                                   data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                   data-val-regex="班级价格格式错误">
                                            <div data-valmsg-for="classPrice" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="end_date" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 结束日期
                                        </label>

                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="end_date" name="endTime"
                                                       placeholder="结束日期" autocomplete="off"
                                                       data-val="true" data-val-required="结束日期不能为空"
                                                       data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                                       data-val-regex="结束日期格式错误" maxlength="10">
                                                <span class="input-group-addon class-end-select">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                            </div>
                                            <div data-valmsg-for="endTime" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="contact_phone" class="col-sm-4 control-label">
                                            <span class="text-danger">*</span> 联系手机
                                        </label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="contact_phone" name="leaderMobile"
                                                   placeholder="联系手机" autocomplete="off"
                                                   data-val="true" data-val-required="手机号码不能为空"
                                                   data-val-regex-pattern="^1\d{10}$"
                                                   data-val-regex="手机号码格式错误" maxlength="11">
                                            <div data-valmsg-for="leaderMobile" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary class-confirm">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="class"/>
</c:import>
