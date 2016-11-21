<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/settings/settings_notification.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>培训报名</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">培训报名</div>
            <div class="panel-body">
                <form id="trains_filter_form" class="form-inline col-sm-8" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;" name="status">
                            <option value="">全部状态</option>
                            <option value="1">未开始</option>
                            <option value="2">报名中</option>
                            <option value="3">已结束</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;" name="type">
                            <option value="">课程类别</option>
                            <option value="1">篮球</option>
                            <option value="2">羽毛球</option>
                            <option value="3">乒乓球</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary card-type-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                </form>
                <div class="col-sm-4 text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#addModal" data-backdrop="false">
                        <span class="glyphicon glyphicon-plus"></span> 增加课程
                    </button>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>课程名称</th>
                            <th>课程类别</th>
                            <th>课程描述</th>
                            <th>起止日期</th>
                            <th>报名人数</th>
                            <th>课程状态</th>
                            <th>责任老师</th>
                            <th>联系人</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>兴趣班</th>
                            <td>篮球</td>
                            <td>培养孩子的篮球兴趣; ....</td>
                            <td>2016-11-11 ~ 2016-12-23</td>
                            <td><a href="/office/trainsStudents">15</a></td>
                            <td class="text-danger">报名中</td>
                            <td>张老师</td>
                            <td>110****5678</td>
                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </button>
                                <button type="button" class="btn btn-warning" data-toggle="modal"
                                        data-target="#signModal" data-backdrop="false">
                                    <span class="glyphicon glyphicon-user"></span> 报名
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th>提高班</th>
                            <td>篮球</td>
                            <td>培养孩子的篮球兴趣; ....</td>
                            <td>2016-11-11 ~ 2016-12-23</td>
                            <td><a href="/office/trainsStudents">15</a></td>
                            <td class="text-muted">已结束</td>
                            <td>张老师</td>
                            <td>110****5678</td>
                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <th>兴趣班</th>
                            <td>羽毛球</td>
                            <td>培养孩子的篮球兴趣; ....</td>
                            <td>2016-11-11 ~ 2016-12-23</td>
                            <td><a href="/office/trainsStudents">15</a></td>
                            <td class="text-primary">未开始</td>
                            <td>张老师</td>
                            <td>110****5678</td>
                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </button>
                            </td>
                        </tr>
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

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="addModalLabel">课程编辑</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form class="form-horizontal" onsubmit="return false;">
                        <div class="form-group">
                            <label for="trains_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="trains_name" name="trainsName"
                                       placeholder="例如, 兴趣班, 乔丹班" autocomplete="off"
                                       data-val="true" data-val-required="课程名称不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                       data-val-regex="课程名称长度只能2~6个字符">
                                <div data-valmsg-for="trainsName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trains_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程类别
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="trains_type" name="trainsType">
                                    <option value="1">篮球</option>
                                    <option value="2">羽毛球</option>
                                    <option value="3">乒乓球</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trains_desc" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程描述
                            </label>

                            <div class="col-sm-8">
                                        <textarea class="form-control" id="trains_desc" name="trainsDesc" rows="3"
                                                  placeholder="课程描述"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="start_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 开始日期
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="start_date" name="startDate"
                                           placeholder="开始日期">
                                            <span class="input-group-addon member-birthday-select">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                </div>
                                <div data-valmsg-for="startDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="end_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 结束日期
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="end_date" name="endDate"
                                           placeholder="结束日期">
                                            <span class="input-group-addon member-birthday-select">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                </div>
                                <div data-valmsg-for="startDate" data-valmsg-replace="true"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="trains_teacher" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 责任老师
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="trains_teacher" name="trainsTeacher"
                                       placeholder="责任老师" autocomplete="off"
                                       data-val="true" data-val-required="责任老师不能为空">
                                <div data-valmsg-for="trainsTeacher" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contact_phone" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系电话
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="contact_phone" name="contactPhone"
                                       placeholder="联系电话" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="contactPhone" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="signModal" tabindex="-1" role="dialog" aria-labelledby="signModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="signModalLabel">我要报名</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form class="form-horizontal" onsubmit="return false;">
                        <div class="form-group">
                            <label for="trains_sign_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="trains_sign_name" name="trainsName"
                                       placeholder="姓名" autocomplete="off"
                                       data-val="true" data-val-required="姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                       data-val-regex="姓名长度只能2~6个字符">
                                <div data-valmsg-for="trainsName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trains_contact_phone" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系电话
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="trains_contact_phone" name="contactPhone"
                                       placeholder="联系电话" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="contactPhone" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trains_sign_desc" class="col-sm-4 control-label">备注</label>

                            <div class="col-sm-8">
                                        <textarea class="form-control" id="trains_sign_desc" name="trainsDesc" rows="3"
                                                  placeholder="备注"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="trains"/>
</c:import>
