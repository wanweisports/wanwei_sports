<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/office/office_trains_course_list.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#course_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>培训课程管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">培训课程管理</div>
            <div class="panel-body">
                <form id="course_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" name="courseName" placeholder="课程名称"
                               value="${courseName}" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-success course-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <button type="button" class="btn btn-success course-add" data-toggle="modal"
                                data-target="#add_course_modal" data-backdrop="false">
                            <span class="glyphicon glyphicon-plus"></span> 添加课程
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive course-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>课程编号</th>
                            <th>课程名称</th>
                            <th>课程描述</th>
                            <th>课程状态</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="course" items="${list}">
                            <tr>
                                <td>${course.courseNo}</td>
                                <td>${course.courseName}</td>
                                <c:if test="${fn:length(course.courseRemark) > 30}">
                                    <td>${fn:substring(course.courseRemark, 0, 30)}...</td>
                                </c:if>
                                <c:if test="${fn:length(course.courseRemark) <= 30}">
                                    <td>${course.courseRemark}</td>
                                </c:if>
                                <c:if test="${course.courseStatus == 1}">
                                    <td class="text-success">开放</td>
                                </c:if>
                                <c:if test="${course.courseStatus == 2}">
                                    <td class="text-danger">关闭</td>
                                </c:if>
                                <td>${course.operatorName}</td>
                                <td>${course.updateTime}</td>
                                <td>
                                    <a href="#add_course_modal" class="btn btn-success course-view" data-toggle="modal"
                                       data-backdrop="false" data-id="${course.id}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                    <%--<button type="button" class="btn btn-danger course-delete" data-id="${course.id}">
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
                        <p class="text-muted no-list-count">没有检索到任何课程！</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="add_course_modal" tabindex="-1" role="dialog" aria-labelledby="add_course_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="add_course_modal_label">课程编辑</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form id="course_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" id="course_id" name="id">
                        <input type="hidden" id="course_no" name="courseNo">
                        <div class="form-group">
                            <label for="course_name" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 课程名称
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="course_name" name="courseName"
                                       placeholder="课程名称" autocomplete="off"
                                       data-val="true" data-val-required="课程名称不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                       data-val-regex="课程名称长度只能2~10个字符">
                                <div data-valmsg-for="courseName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="course_remark" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 课程描述
                            </label>

                            <div class="col-sm-9">
                                <textarea class="form-control" id="course_remark" name="courseRemark" rows="3"
                                          placeholder="课程描述"
                                          data-val="true" data-val-required="课程描述不能为空"></textarea>
                                <div data-valmsg-for="courseRemark" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="course_status1" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 课程状态
                            </label>

                            <div class="col-sm-9 text-left">
                                <label class="radio-inline">
                                    <input type="radio" name="courseStatus" id="course_status1" value="1" checked> 开放
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="courseStatus" id="course_status2" value="2"> 关闭
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success course-confirm">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="course"/>
</c:import>
