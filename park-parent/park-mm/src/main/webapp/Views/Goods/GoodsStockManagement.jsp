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
    <script src="/Content/app/goods/goods_stock_management.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".good-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".good-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品进销存</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">商品进销存</div>
            <div class="panel-body">
                <form class="form-inline" id="goods_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <%--<a href="/good/getGoodsStock?countNum=100" data-count="100" class="btn btn-primary good-date">全部</a>--%>
                            <a href="/good/getGoodsStock?countNum=11" data-count="11" class="btn btn-default good-date">今日</a>
                            <a href="/good/getGoodsStock?countNum=21" data-count="21" class="btn btn-default good-date">本周</a>
                            <a href="/good/getGoodsStock?countNum=31" data-count="31" class="btn btn-default good-date">本月</a>
                            <a href="/good/getGoodsStock?countNum=41" data-count="41" class="btn btn-default good-date">本年</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"
                               placeholder="开始日期" value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd"
                               placeholder="结束日期" value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="good_no" name="goodNo"
                               placeholder="商品编号" value="${goodNo}">
                    </div>
                    <%--<div class="form-group">
                        <input type="text" class="form-control" id="good_name" name="goodName"
                               placeholder="商品名称" value="${goodName}">
                    </div>--%>
                    <div class="form-group">
                        <label>&nbsp;</label>
                        <a href="javascript:;" class="btn btn-primary goods-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="javascript:;" class="btn btn-danger">
                            <span class="glyphicon glyphicon-export"></span> 导出数据
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table goods-list">
                        <thead>
                        <tr class="bg-info">
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>零售价(元)</th>
                            <th>商品增加</th>
                            <th>商品入库</th>
                            <th>商品销售</th>
                            <th>销售金额</th>
                            <th>商品损耗</th>
                            <th>库存剩余</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="good" items="${stock}">
                            <tr <c:if test="${good.goodNo == null}">class="bg-success"</c:if></tr>
                                <td>${good.goodNo}</td>
                                <td>${good.goodName}</td>
                                <td>${good.goodPrice}</td>

                                <c:if test="${good.typeAdd == null}">
                                    <td>0件</td>
                                </c:if>
                                <c:if test="${good.typeAdd != null}">
                                    <td class="text-success">${good.typeAdd}件</td>
                                </c:if>

                                <c:if test="${good.typeIn == null}">
                                    <td>0件</td>
                                </c:if>
                                <c:if test="${good.typeIn != null}">
                                    <td class="text-success">${good.typeIn}件</td>
                                </c:if>

                                <c:if test="${good.typeOut == null}">
                                    <td>0件</td>
                                    <td>0.00元</td>
                                </c:if>
                                <c:if test="${good.typeOut != null}">
                                    <td class="text-danger">${good.typeOut}件</td>
                                    <td class="text-danger">${good.typeOutTotal}元</td>
                                </c:if>

                                <c:if test="${good.typeMinus == null}">
                                    <td>0件</td>
                                </c:if>
                                <c:if test="${good.typeMinus != null}">
                                    <td class="text-danger">${good.typeMinus}件</td>
                                </c:if>

                                <c:if test="${good.goodCount == null}">
                                    <td>0件</td>
                                </c:if>
                                <c:if test="${good.goodCount != null}">
                                    <td>${good.goodCount}件</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="stock"/>
</c:import>
