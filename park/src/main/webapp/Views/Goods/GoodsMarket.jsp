<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
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
                    <c:forEach var="good" items="${goods}">
                        <div class="col-sm-2 col-md-2 goods-list-item">
                            <div class="thumbnail">
                                <img class="good-image" src="${good.goodPic}" alt="${good.goodName}"
                                     style="width: 100%;height: 110px;">
                                <div class="caption" style="padding: 0">
                                    <p class="good-name" data-text="${good.goodName}"
                                       style="margin-bottom: 1px">${good.goodName}</p>
                                    <p class="text-primary good-price" data-text="${good.goodPrice}"
                                       style="margin-bottom: 1px">${good.goodPrice}元</p>
                                    <p style="margin-bottom: 1px; overflow: hidden">
                                        <!--<a href="javascript:;" class="btn btn-warning pull-left good-cart-buy"
                                           data-id="${good.goodId}" title="直接购买">
                                            <span class="glyphicon glyphicon-usd"></span>
                                        </a>-->
                                        <a href="javascript:;" class="btn btn-primary pull-right good-cart-add"
                                            data-id="${good.goodId}" title="加入购物车">
                                            <span class="glyphicon glyphicon-shopping-cart"></span>
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_success_modal" tabindex="-1" role="dialog" aria-labelledby="tips_success_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_success_modal_label">提示框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-success text-content">添加购物车成功!</p>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_error_modal" tabindex="-1" role="dialog" aria-labelledby="tips_error_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_error_modal_label">提示框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-danger text-content">添加购物车失败!</p>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="market"/>
</c:import>
