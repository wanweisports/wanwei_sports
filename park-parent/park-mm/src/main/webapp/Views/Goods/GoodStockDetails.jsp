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
    <script src="/Content/app/goods/goods_stock_details.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".stock-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".stock-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>库存操作明细</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">库存操作明细</div>
            <div class="panel-body">
                <form class="form-inline" id="goods_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/good/getGoodsStockDetails?countNum=11" data-count="11" class="btn btn-default stock-date">今日</a>
                            <a href="/good/getGoodsStockDetails?countNum=21" data-count="21" class="btn btn-default stock-date">本周</a>
                            <a href="/good/getGoodsStockDetails?countNum=31" data-count="31" class="btn btn-default stock-date">本月</a>
                            <a href="/good/getGoodsStockDetails?countNum=41" data-count="41" class="btn btn-default stock-date">本年</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart" placeholder="开始日期"
                               value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd" placeholder="结束日期"
                               value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="good_no" name="goodNo"
                               placeholder="商品编号" value="${goodNo}">
                    </div>
                    <div class="form-group">
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
                            <th>变化原因</th>
                            <th>变化数量</th>
                            <th>备注</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="data" items="${list}">
                            <tr>
                                <td>${data.goodNo}</td>
                                <td>${data.goodName}</td>
                                <c:if test="${data.opType == 1}">
                                    <td class="text-success">增加商品</td>
                                    <td class="text-success">${data.countChange}件</td>
                                </c:if>
                                <c:if test="${data.opType == 2}">
                                    <td class="text-success">商品入库</td>
                                    <td class="text-success">${data.countChange}件</td>
                                </c:if>
                                <c:if test="${data.opType == 3}">
                                    <td class="text-danger">商品销售</td>
                                    <td class="text-danger">${data.countChange}件</td>
                                </c:if>
                                <c:if test="${data.opType == 4}">
                                    <td class="text-danger">商品损耗</td>
                                    <td class="text-danger">${data.countChange}件</td>
                                </c:if>
                                <td>${data.remark}</td>
                                <td>${data.operatorName}</td>
                                <td>${data.createTime}</td>
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

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="detail"/>
</c:import>
