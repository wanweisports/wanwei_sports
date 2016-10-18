<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/dist/good/goods_market.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="row" style="margin-bottom: 10px">
            <div class="col-sm-12 col-md-10">
                <div class="btn-group btn-group-justified">
                    <div class="btn-group">
                        <button type="button" class="btn btn-warning">全部商品</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">饮料类</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">食品类</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">服饰类</button>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-2">
                <a href="good/getGoodsCart" class="btn btn-warning pull-right good-cart-count">
                    <span class="glyphicon glyphicon-shopping-cart"></span> 购物车
                    <span class="badge"></span>
                </a>
            </div>
        </div>
        <div>
            <div class="row goods-buy-list">
                <c:forEach var="good" items="${goods}">
                    <div class="col-sm-4 col-md-3 goods-list-item">
                        <div class="thumbnail">
                            <img class="good-image" src="${good.goodPic}" alt="${good.goodName}">
                            <div class="caption">
                                <p class="good-name" data-text="${good.goodName}">${good.goodName}</p>
                                <p class="good-price" data-text="${good.goodPrice}">${good.goodPrice}元</p>
                                <p class="text-right">
                                    <a href="javascript:;" class="btn btn-primary good-cart-add" data-id="${good.goodId}">
                                        <span class="glyphicon glyphicon-plus"></span> 购物车
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="market"/>
</c:import>
