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
    <script src="Content/app/members/members_children.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#member_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">主会员信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" onsubmit="return false;">
                        <div class="form-group">
                            <label for="card_no" class="col-sm-2 control-label">会员卡号</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="card_no" name="cardNo" placeholder="会员卡号"
                                       value="${member.cardNo}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_name" class="col-sm-2 control-label">会员姓名</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="member_name" name="memberName"
                                       placeholder="会员姓名" value="${member.memberName}" disabled>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">子会员添加</div>
                <div class="panel-body">
                    <form id="member_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="parentMemberId" value="${member.memberId}">
                        <div class="form-group">
                            <label for="child_member_name" class="col-sm-2 control-label">会员姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="child_member_name" name="memberName"
                                       placeholder="请输入会员姓名" autocomplete="off"
                                       data-val="true" data-val-required="会员姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                       data-val-regex="会员姓名长度只能2~12个字符">
                                <div data-valmsg-for="memberName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="child_member_mobile" class="col-sm-2 control-label">手机号码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="child_member_mobile" name="memberMobile"
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="memberMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-success confirm-member">
                                    <span class="glyphicon glyphicon-ok"></span> 确 认
                                </button>
                                <button type="button" class="btn btn-danger" data-toggle="modal"
                                        data-target="#batch_import" data-backdrop="false">
                                    <span class="glyphicon glyphicon-import"></span> 批 量
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">子会员列表</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table member-children-list">
                            <thead>
                            <tr class="bg-info">
                                <th>会员姓名</th>
                                <th>手机号码</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${list}">
                                <tr>
                                    <td>${user.memberName}</td>
                                    <td>${user.memberMobile}</td>
                                    <td>
                                        <a class="btn btn-danger children-delete" href="javascript:;"
                                            data-id="${user.memberId}">
                                            <span class="glyphicon glyphicon-trash"></span>
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
                        <c:if test="${fn:length(list) == 0}">
                            <p class="text-muted no-list-count">没有检索到任何记录！</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="batch_import" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="batchImportModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="batchImportModalLabel">批量导入</h5>
                </div>
                <div class="modal-body">
                    <form id="member_import_form" onsubmit="return false;">
                        <input type="hidden" name="parentMemberId" value="${member.memberId}">
                        <div class="form-group">
                            <input type="file" id="child_member_file" name="memberFile">
                            <p class="help-block">请选择上传的excel或者csv文件。</p>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 导 入
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="子会员管理"/>
</c:import>
