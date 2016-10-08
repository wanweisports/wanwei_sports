<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">会员查询</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="member_filter_form" class="form-horizontal" onsubmit="return false;">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="member_mobile" class="col-sm-4 control-label">手机号码</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="member_mobile" name="memberMobile"
                                        placeholder="请输入手机号码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="card_no" class="col-sm-4 control-label">会员卡号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="card_no" name="cardNo"
                                        placeholder="请输入会员卡号">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="member_idcard" class="col-sm-4 control-label">身份证号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="member_idcard" name="memberIdcard"
                                        placeholder="请输入身份证号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="member_type" class="col-sm-4 control-label">会员类型</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="member_type" name="cardTypeId">
                                        <option value="">全部类型</option>
                                        <c:forEach var="type" items="${memberCarTypeNames}">
                                        	<option value="${type.cardTypeId}">${type.cardTypeName}</option>
                                        </c:forEach>
                                        <!-- 
                                        <option value="1">金卡会员</option>
                                        <option value="2">银卡会员</option>
                                        <option value="3">普卡会员</option>
                                         -->
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="payment_type" class="col-sm-4 control-label">支付类型</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="payment_type" name="memberType">
                                        <option value="">全部类型</option>
                                        <option value="1">预付类型</option>
                                        <option value="2">记账类型</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <a href="javascript:;" class="btn btn-primary member-filter">
                                        <span class="glyphicon glyphicon-search"></span> 检索会员
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
                                <th>#</th>
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
                                <td>${member.memberId}</td>
                                <td>${member.memberName}</td>
                                <td>${member.memberMobile}</td>
                                <td>${member.cardNo}</td>
                                <td>${member.cardTypeName}</td>
                                <td>${member.cardDeadline}</td>
                                <td>${member.cardBalance}</td>
                                <td>
                                    <c:if test="${member.cardStatus==1}">
                                        有效
                                    </c:if>
                                    <c:if test="${member.cardStatus==2}">
                                        锁定
                                    </c:if>
                                </td>
                                <td>${member.operatorName}</td>
                                <td>${member.createTime}</td>
                                <td>
                                    <a class="btn btn-primary" href="member/memberInfo?memberId=${member.memberId}">
                                        <span class="glyphicon glyphicon-arrow-right"></span> 查看
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav class="pull-right">
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize}条/页</span>
                                <span>总${count}条</span>
                            </p>
                            <ul class="pagination pull-right">
                                <li><a href="javascript:;" onclick="window.location.href='member/memberList?page=1'"><span>首页</span></a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/memberList?page=${currentPage-1}'"><span>上一页</span></a></li>
                                <li><a href="javascript:;">1</a></li>
                                <li class="active"><a href="javascript:;">2</a></li>
                                <li><a href="javascript:;">3</a></li>
                                <li><a href="javascript:;">...</a></li>
                                <li><a href="javascript:;">11</a></li>
                                <li><a href="javascript:;">12</a></li>
                                <li><a href="javascript:;">13</a></li>
                                <li><a href="javascript:;">14</a></li>
                                <li><a href="javascript:;">15</a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/memberList?page=${currentPage+1}'"><span>下一页</span></a></li>
                                <li><a href="javascript:;" onclick="window.location.href='member/memberList?page=${lastPage}'"><span>末页</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/users_members.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

