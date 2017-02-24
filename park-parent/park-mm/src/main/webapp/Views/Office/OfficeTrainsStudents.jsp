<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/office/office_trains_students.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>培训班级管理</span> &gt;&gt; <span>学生报名</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">学生报名</div>
            <div class="panel-body">
                <h3>${classInfo.className}</h3>
                <p>${classInfo.classRemark}</p>
                <c:if test="${isSigned}">
                    <p>
                        <button type="button" class="btn btn-warning add-sign" data-toggle="modal"
                                data-target="#student_sign_modal" data-backdrop="false">
                            <span class="glyphicon glyphicon-user"></span> 我要报名
                        </button>
                    </p>
                </c:if>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive sign-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>学生姓名</th>
                            <th>联系电话</th>
                            <th>支付状态</th>
                            <th>支付价格</th>
                            <th>报名时间</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="student" items="${list}">
                            <tr>
                                <td>${student.studentName}</td>
                                <td>${student.studentMobile}</td>
                                <c:if test="${student.payStatus == 1}">
                                    <td class="text-success">已支付</td>
                                    <td class="text-success">${student.payPrice}</td>
                                </c:if>
                                <c:if test="${student.payStatus == 2}">
                                    <td class="text-danger">未支付</td>
                                    <td class="text-danger">${student.payPrice}</td>
                                </c:if>
                                <td>${student.signTime}</td>
                                <td>${student.remark}</td>
                                <td>
                                    <c:if test="${student.payStatus == 2}">
                                        <button type="button" class="btn btn-warning sign-pay" data-id="${student.id}"
                                                data-toggle="modal" data-target="#student_pay_modal" data-backdrop="false"
                                                data-price="${classInfo.classPrice}">
                                            <span class="glyphicon glyphicon-usd"></span> 支付
                                        </button>
                                    </c:if>
                                    <c:if test="${isSigned}">
                                        <button type="button" class="btn btn-danger sign-delete" data-id="${student.id}">
                                            <span class="glyphicon glyphicon-trash"></span> 移除
                                        </button>
                                    </c:if>
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
                        <p class="text-muted no-list-count">还没有学生报名！</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="student_sign_modal" tabindex="-1" role="dialog" aria-labelledby="student_sign_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="student_sign_modal_label">我要报名</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form id="students_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="classId" id="students_class_id" value="${classInfo.id}">
                        <div class="form-group">
                            <label for="students_sign_name" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 学生姓名
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="students_sign_name" name="studentName"
                                       placeholder="学生姓名" autocomplete="off"
                                       data-val="true" data-val-required="学生姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                       data-val-regex="姓名长度只能2~6个字符">
                                <div data-valmsg-for="studentName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="students_contact_phone" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 联系电话
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="students_contact_phone" name="studentMobile"
                                       placeholder="联系电话" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误" maxlength="11">
                                <div data-valmsg-for="studentMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="students_pay_status1" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 支付状态
                            </label>

                            <div class="col-sm-9 text-left">
                                <label class="radio-inline">
                                    <input type="radio" name="payStatus" id="students_pay_status1" value="1"> 已支付
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="payStatus" id="students_pay_status2" value="2" checked> 未支付
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="students_class_price" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 支付价格
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="students_class_price" name="payPrice"
                                       placeholder="支付价格" autocomplete="off" value="${classInfo.classPrice}"
                                       data-val="true" data-val-required="支付价格不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="支付价格格式错误">
                                <div data-valmsg-for="payPrice" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trains_sign_desc" class="col-sm-3 control-label">备注</label>

                            <div class="col-sm-9">
                                <textarea class="form-control" id="trains_sign_desc" name="remark" rows="3"
                                          placeholder="备注"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary sign-confirm">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="student_pay_modal" tabindex="-1" role="dialog" aria-labelledby="student_pay_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="student_pay_modal_label">我要支付</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form id="students_pay_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="id" id="students_id">
                        <div class="form-group">
                            <label for="students_status1" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 支付状态
                            </label>

                            <div class="col-sm-9 text-left">
                                <label class="radio-inline">
                                    <input type="radio" name="payStatus" id="students_status1" value="1"> 已支付
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="payStatus" id="students_status2" value="2" checked> 未支付
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="students_paid_price" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 已支付
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="students_paid_price" name="paidPrice" disabled
                                       placeholder="已支付价格" autocomplete="off">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="students_pay_price" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 总支付
                            </label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="students_pay_price" name="payPrice"
                                       placeholder="输入总支付金额" autocomplete="off" value="${classInfo.classPrice}"
                                       data-val="true" data-val-required="总支付金额不能为空"
                                       data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="总支付金额格式错误">
                                <div data-valmsg-for="payPrice" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trains_pay_remark" class="col-sm-3 control-label">备注</label>

                            <div class="col-sm-9">
                                <textarea class="form-control" id="trains_pay_remark" name="remark" rows="3"
                                          placeholder="备注"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pay-confirm">
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
