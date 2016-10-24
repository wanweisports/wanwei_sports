<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/app/members/members_balance_list.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员查询</span> &gt;&gt; <span>会员详情</span> &gt;&gt; <span>会员卡储值查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">会员卡储值查询</div>
            <div class="panel-body">
                <form class="form-inline" id="balance_filter_form" onsubmit="return false;">
                    <input type="hidden" name="cardId" value="${cardId}">
                    <div class="form-group">
                        <select class="form-control" name="balanceServiceType" style="width: 160px;">
                            <option value="">全部类型</option>
                            <option value="10" <c:if test="${balanceServiceType == 10}">selected</c:if>>注册会员</option>
                            <option value="11" <c:if test="${balanceServiceType == 11}">selected</c:if>>会员充值</option>
                            <option value="12" <c:if test="${balanceServiceType == 12}">selected</c:if>>会员升级</option>
                            <option value="13" <c:if test="${balanceServiceType == 13}">selected</c:if>>会员补办</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart" placeholder="开始时间"
                               value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd" placeholder="结束时间"
                               value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="手机号" name="memberMobile"
                               value="${memberMobile}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary balance-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <!--<div class="form-group pull-right">
                        <a href="/member/getConsumes?cardId=${cardId}" class="btn btn-primary">
                            <span class="glyphicon glyphicon-th-list"></span> 消费明细
                        </a>
                    </div>-->
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>交易流水号</th>
                            <th>会员姓名</th>
                            <th>订单类型</th>
                            <th>支付方式</th>
                            <th>支付金额</th>
                            <th>订单状态</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="balance" items="${list}">
                            <tr>
                                <td>${balance.balanceNo}</td>
                                <td>${balance.memberName}</td>
                                <td>${balance.balanceServiceTypeName}</td>
                                <td>${balance.balanceStyleName}</td>
                                <td>${balance.realAmount}</td>
                                <td>${balance.balanceStatus}</td>
                                <td>${balance.operatorName}</td>
                                <td>${balance.createTime}</td>
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

