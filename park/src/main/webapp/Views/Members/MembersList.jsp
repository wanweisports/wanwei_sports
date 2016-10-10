<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">会员查询</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="member_filter_form" class="form-horizontal" method="post" novalidate
                          onsubmit="return false;">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="member_mobile" class="col-sm-4 control-label">手机号码</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="member_mobile" name="memberMobile"
                                        placeholder="请输入手机号码" value="${memberMobile}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="payment_type" class="col-sm-4 control-label">支付类型</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="payment_type" name="memberType">
                                        <c:if test="${!memberType}">
                                            <option value="" selected>全部类型</option>
                                            <option value="1">预付类型</option>
                                            <option value="2">记账类型</option>
                                        </c:if>
                                        <c:if test="${memberType == '1'}">
                                            <option value="">全部类型</option>
                                            <option value="1" selected>预付类型</option>
                                            <option value="2">记账类型</option>
                                        </c:if>
                                        <c:if test="${memberType == '2'}">
                                            <option value="">全部类型</option>
                                            <option value="1">预付类型</option>
                                            <option value="2" selected>记账类型</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="card_no" class="col-sm-4 control-label">会员卡号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="card_no" name="cardNo"
                                           placeholder="请输入会员卡号" value="${cardNo}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="member_type" class="col-sm-4 control-label">会员类型</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="member_type" name="cardTypeId">
                                        <option value="">全部类型</option>
                                        <c:forEach var="type" items="${memberCarTypeNames}">
                                            <c:if test="${type.cardTypeId == cardTypeId}">
                                                <option value="${type.cardTypeId}" selected>${type.cardTypeName}</option>
                                            </c:if>
                                            <c:if test="${type.cardTypeId != cardTypeId}">
                                                <option value="${type.cardTypeId}">${type.cardTypeName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="member_idcard" class="col-sm-4 control-label">身份证号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="member_idcard" name="memberIdcard"
                                           placeholder="请输入身份证号" value="${memberIdcard}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <a href="javascript:;" class="btn btn-primary member-filter">
                                        <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                                    </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <!--<th>#</th>-->
                                <th>姓名</th>
                                <th>手机号码</th>
                                <th>会员卡号</th>
                                <th>会员类型</th>
                                <th>截止日期</th>
                                <th>余额(元)</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>办卡时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="member" items="${list}">
                            <tr>
                                <!--<td>${member.memberId}</td>-->
                                <td>${member.memberName}</td>
                                <td>${member.memberMobile}</td>
                                <td>${member.cardNo}</td>
                                <td>${member.cardTypeName}</td>
                                <td>${member.cardDeadline}</td>
                                <td>${member.cardBalance}</td>
                                <c:if test="${member.cardStatus==null}">
                                	<td></td>
                                </c:if>
                                <c:if test="${member.cardStatus==1}">
                                    <td class="text-success">有效</td>
                                </c:if>
                                <c:if test="${member.cardStatus==2}">
                                    <td class="text-danger">锁定</td>
                                </c:if>
                                <td>${member.operatorName}</td>
                                <td>${member.createTime}</td>
                                <td>
                                	<c:if test="${member.tempCardNo == null}">
	                                    <a class="btn btn-primary" href="member/memberInfo?memberId=${member.memberId}">
	                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
	                                    </a>
                                    </c:if>
                                    <c:if test="${member.tempCardNo != null}">
                                    	<a class="btn btn-primary" href="member/membersInfoCar?memberId=${member.memberId}">
	                                        <span class="glyphicon glyphicon-share-alt"></span> 绑卡
	                                    </a>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize}条/页</span>
                                <span>总${count}条</span>
                            </p>
                            <ul class="pagination pull-right">
                                <c:if test="${isFirstPage}">
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
                                <c:if test="${!isFirstPage}">
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
                                <c:if test="${isLastPage}">
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
                                <c:if test="${!isLastPage}">
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
    </div>
</div>
<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/members_list_query.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

