<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                    <tr class="bg-info">
                        <th></th>
                        <th>姓名</th>
                        <th>手机号码</th>
                        <th>会员卡号</th>
                        <th>截止日期</th>
                        <th>余额(元)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="member" items="${list}">
                        <tr>
                            <td>
                                <a class="btn btn-primary" href="javascript:;" data-id="${member.memberId}">
                                    <span class="glyphicon glyphicon-ok"></span> 选择
                                </a>
                            </td>
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
                                    <c:when test="${member.tempCardNo == null}">${member.cardBalance}元</c:when>
                                    <c:otherwise> -- </c:otherwise>
                                </c:choose>
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
