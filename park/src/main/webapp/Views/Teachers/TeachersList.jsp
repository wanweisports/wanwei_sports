<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/teachers/teachers_list.js?v=${static_resource_version}"></script>
    <script>
        // 表单校验配置
        $(document).ready(function () {
            $('#refresh_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>教师管理</span> &gt;&gt; <span>教师查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">教师查询</div>
            <div class="panel-body">
                <form id="member_filter_form" class="form-inline" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" id="member_mobile" name="memberMobile"
                               placeholder="手机号码" value="${memberMobile}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="card_no" name="cardNo"
                               placeholder="教师卡号" value="${cardNo}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="member_idcard" name="memberIdcard"
                               placeholder="身份证号" value="${memberIdcard}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary member-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table teachers-list">
                        <thead>
                        <tr class="bg-info">
                            <th>教师姓名</th>
                            <th>手机号码</th>
                            <th>教师卡号</th>
                            <th>截止日期</th>
                            <th>用场次数</th>
                            <th>状态</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${list}">
                            <tr>
                                <td>${member.memberName}</td>
                                <td>${member.memberMobile}</td>
                                <td>${member.cardNo}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.cardDeadline == 0}">不限制</c:when>
                                        <c:otherwise>${member.cardDeadline}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>0次</td>
                                <c:if test="${member.cardStatus == 1}">
                                    <td class="text-success">有效</td>
                                </c:if>
                                <c:if test="${member.cardStatus == 2}">
                                    <td class="text-danger">锁定</td>
                                </c:if>
                                <td>${member.operatorName}</td>
                                <td>${member.createTime}</td>
                                <td>
                                    <a class="btn btn-primary" href="/teachers/view?memberId=${member.memberId}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                    <a href="#refresh_modal" class="btn btn-warning teachers-refresh" data-toggle="modal"
                                       data-backdrop="false" data-cardId="${member.cardId}" data-cardNo="${member.cardNo}">
                                        <span class="glyphicon glyphicon-refresh"></span> 补办
                                    </a>
                                    <a class="btn btn-danger teachers-delete" href="javascript:;"
                                        data-id="${member.memberId}">
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

    <div class="modal fade" id="refresh_modal" tabindex="-1" role="dialog" aria-labelledby="refresh_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="refresh_modal_label">教师卡补办</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <form id="refresh_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" id="refresh_cardId" name="cardId">
                        <input type="hidden" name="buBanMoney" value="0">
                        <input type="hidden" name="balanceStyle" value="1">
                        <input type="hidden" name="givingAmount" value="0">
                        <input type="hidden" name="remark" value="教师卡免费补办">
                        <div class="form-group">
                            <label for="refresh_cardNo" class="col-sm-2 control-label">旧的卡号</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="refresh_cardNo" name="cardNo" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="refresh_newNo" class="col-sm-2 control-label">新的卡号</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="refresh_newNo" name="newCardNo"
                                       placeholder="请输入新卡号" autocomplete="off"
                                       data-val="true" data-val-required="新卡号不能为空">
                                <div data-valmsg-for="newCardNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary confirm-refresh" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 认
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="refreshModal" tabindex="-1" role="dialog" aria-labelledby="refreshModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="refreshModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">教师卡补办成功!</div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="deleteModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" role="alert">删除后无法恢复！您确定要删除此会员吗？</div>
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
    <c:param name="subNav" value="list"/>
</c:import>
