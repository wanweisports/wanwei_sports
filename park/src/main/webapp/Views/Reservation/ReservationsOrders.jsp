<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
   <link href="/Content/style/reservations/reservations_orders.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/reservations/reservations_orders.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>预订订单</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">预订订单查询</div>
            <div class="panel-body">
                <form id="orders_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="user_role" name="roleId" style="width:160px;">
                            <option value="">全部订单</option>
                            <option value="">未支付</option>
                            <option value="">已支付</option>
                            <option value="">已完成</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary orders-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table orders-list">
                        <thead>
                        <tr>
                            <th>订单详情</th>
                            <th>订单状态</th>
                            <th>订单价格</th>
                            <th>订单状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${list}" varStatus="loop">
                            <tr class="tr-th">
                                <td colspan="5">
                                    <span class="order-date-time">${order.createTime}</span>
                                    <span class="order-number">订单号：<a href="">${order.orderNo}</a></span>
                                    <c:if test="${order.orderServiceType == 1}">
                                        <span>订单类型: 场地预订</span>
                                    </c:if>
                                    <c:if test="${order.orderServiceType == 2}">
                                        <span>订单类型: 商品订单</span>
                                    </c:if>
                                    <c:if test="${order.orderServiceType == 3}">
                                        <span>订单类型: 批量预订</span>
                                    </c:if>

                                    <button class="btn btn-warning pull-right">
                                        <span class="glyphicon glyphicon-trash"></span> 删除
                                    </button>
                                </td>
                            </tr>
                            <c:forEach var="item" items="${order.orderDetailList}">
                                <tr class="tr-bd">
                                    <td>
                                        <p>预订场地: ${item.itemName}</p>
                                        <p>预订价格: ${item.itemPrice}</p>
                                        <p>预订时间: ${item.itemStartTime} ~ ${item.itemEndTime}</p>
                                    </td>

                                    <c:if test="${item.orderDetailStatus == 1}">
                                        <td>已完成</td>
                                    </c:if>
                                    <c:if test="${item.orderDetailStatus == 2}">
                                        <td class="text-danger">未完成</td>
                                    </c:if>
                                    <c:if test="${item.orderDetailStatus == 3}">
                                        <td class="text-success">进行中</td>
                                    </c:if>

                                    <td>${order.orderSumPrice}</td>

                                    <td>
                                        <c:if test="${order.payStatus == 1}">
                                            <p class="text-success">已支付</p>
                                        </c:if>
                                        <c:if test="${order.payStatus == 2}">
                                            <p class="text-danger">未支付</p>
                                        </c:if>
                                        <c:if test="${order.payStatus == 3}">
                                            <p class="text-danger">部分支付</p>
                                        </c:if>

                                        <c:if test="${order.orderStatus == 1}">
                                            <p class="text-success">已完成</p>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 2}">
                                            <p class="text-danger">未完成</p>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 3}">
                                            <p>已取消</p>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${item.orderDetailStatus != 1}">
                                            <button class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span> 取消
                                            </button>
                                        </c:if>
                                        <button class="btn btn-primary">
                                            <span class="glyphicon glyphicon-usd"></span> 支付
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
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
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="order"/>
</c:import>