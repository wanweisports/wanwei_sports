<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/goods/goods_market.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/holder/holder.min.js?v=${static_resource_version}"></script>
    <script src="/Content/app/goods/goods_market.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品销售</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">商品销售</div>
            <div class="panel-body">
                <div class="col-sm-12 col-md-10">
                    <div class="btn-group btn-group-justified good-type-list">
                        <div class="btn-group">
                            <a href="/good/getGoodsMarket?goodType=" class="btn btn-primary"
                               data-type="">全部商品</a>
                        </div>
                        <c:forEach var="type" items="${goodTypeNames}">
                            <div class="btn-group">
                                <a href="/good/getGoodsMarket?goodType=${type.goodTypeId}" class="btn btn-primary"
                                       data-type="${type.goodTypeId}">${type.goodTypeName}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div>
                    <div class="col-sm-12 col-md-2">
                        <a href="good/getGoodsCart" class="btn btn-warning pull-right good-cart-count">
                            <span class="glyphicon glyphicon-shopping-cart"></span> 购物车
                            <span class="badge"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row goods-buy-list">
                    <c:forEach var="good" items="${goods}" varStatus="loop">
                        <div class="grid">
                            <div class="imgholder">
                                <img data-src="holder.js/300x110?text=${good.goodName}&theme=lava"
                                      src="${good.goodPic}" alt="${good.goodName}">
                            </div>
                            <c:if test="${fn:length(good.goodName) > 18}">
                                <strong>${fn:substring(good.goodName, 0, 18)}...</strong>
                            </c:if>
                            <c:if test="${fn:length(good.goodName) <= 18}">
                                <strong>${good.goodName}</strong>
                            </c:if>
                            <p class="money">${good.goodPrice}元</p>
                            <div class="meta">
                                <a href="javascript:;" class="good-cart-add" data-id="${good.goodId}">购物车>>></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="market"/>
</c:import>
