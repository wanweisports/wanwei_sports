<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/dist/members/members_list_query.js?v=${static_resource_version}"></script>
    <script>
        (function ($) {
            $("#payment_type").val('${memberType}');
        })(jQuery);
    </script>
</layout:override>
<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">会员查询</div>
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
                                    <option value="">全部类型</option>
                                    <option value="1">预付类型</option>
                                    <option value="2">记账类型</option>
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
            <div class="panel-heading">会员列表</div>
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
                                <td>${member.memberName}</td>
                                <td>${member.memberMobile}</td>
                                <td>${member.cardNo}</td>
                                <td>${member.cardTypeName}</td>
                                <td>${member.cardDeadline}</td>
                                <td>${member.cardBalance}</td>
                                <c:if test="${member.cardStatus == null}">
                                    <td></td>
                                </c:if>
                                <c:if test="${member.cardStatus == 1}">
                                    <td class="text-success">有效</td>
                                </c:if>
                                <c:if test="${member.cardStatus == 2}">
                                    <td class="text-danger">锁定</td>
                                </c:if>
                                <td>${member.operatorName}</td>
                                <td>${member.createTime}</td>
                                <td>
                                    <c:if test="${member.tempCardNo == null}">
                                        <a class="btn btn-primary" href="/member/memberInfo?memberId=${member.memberId}">
                                            <span class="glyphicon glyphicon-share-alt"></span> 查看
                                        </a>
                                    </c:if>
                                    <c:if test="${member.tempCardNo != null}">
                                        <a class="btn btn-warning" href="/member/membersInfoCar?memberId=${member.memberId}">
                                            <span class="glyphicon glyphicon-credit-card"></span> 绑卡
                                        </a>
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
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="list"/>
</c:import>
