<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/home/index.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/members/members_list_query.js?v=${static_resource_version}"></script>
    <script>
        (function ($) {
            $("#payment_type").val('${memberType}');
        })(jQuery);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">会员查询</div>
            <div class="panel-body">
                <form id="member_filter_form" class="form-inline" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" id="member_mobile" name="memberMobile"
                               placeholder="手机号码" value="${memberMobile}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="card_no" name="cardNo"
                               placeholder="会员卡号" value="${cardNo}">
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
                <div class="table-responsive members-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-primary">
                            <th>姓名</th>
                            <th>手机号码</th>
                            <th>会员卡号</th>
                            <th>截止日期</th>
                            <th>余额(元)</th>
                            <th>子会员</th>
                            <th>操作人</th>
                            <th>注册时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${list}">
                            <tr>
                                <td>${member.memberName}</td>
                                <td>${member.memberMobile}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.tempCardNo == null}">${member.cardNo}</c:when>
                                        <c:otherwise> -- </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.cardDeadline == 0}">不限制</c:when>
                                        <c:otherwise>${member.cardDeadline}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.tempCardNo == null}">
                                            <a href="/member/getBalances?cardId=${member.cardId}&memberId=${member.memberId}">${member.cardBalance}元</a>
                                        </c:when>
                                        <c:otherwise> -- </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${member.tempCardNo == null && member.childrenCount > 0}">
                                            <a href="/member/getMembersChildren?memberId=${member.memberId}">${member.childrenCount}人</a>
                                        </c:when>
                                        <c:when test="${member.tempCardNo == null && member.childrenCount == 0}">
                                            <a href="/member/getMembersChildren?memberId=${member.memberId}"> 无 </a>
                                        </c:when>
                                        <c:otherwise> -- </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${member.operatorName}</td>
                                <td>${member.createTime}</td>
                                <td>
                                    <c:if test="${member.tempCardNo == null}">
                                        <a class="btn btn-primary" href="/member/memberInfo?memberId=${member.memberId}">
                                            <span class="glyphicon glyphicon-share-alt"></span> 查看
                                        </a>
                                    </c:if>
                                    <c:if test="${member.tempCardNo != null}">
                                        <a class="btn btn-danger" href="/member/bindMembersCard?memberId=${member.memberId}">
                                            <span class="glyphicon glyphicon-credit-card"></span> 绑卡
                                        </a>
                                    </c:if>
                                    <%--<a class="btn btn-danger members-delete" href="javascript:;" data-id="${member.memberId}">
                                        <span class="glyphicon glyphicon-trash"></span> 删除
                                    </a>--%>
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
                        <p class="text-muted no-list-count">没有检索到会员！</p>
                    </c:if>
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
                    <input type="hidden" id="delete_memberId">
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

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="list"/>
</c:import>
