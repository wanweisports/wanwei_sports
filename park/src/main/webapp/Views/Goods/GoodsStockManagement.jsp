<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/goods/goods_stock_management.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#good_kucun_form').validate({
                ignore: ":hidden"
            });
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
                        <input type="text" class="form-control" id="good_no" name="goodNo"
                               placeholder="商品编号" value="${goodNo}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="good_name" name="goodName"
                               placeholder="商品名称" value="${goodName}">
                    </div>
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
                        <tr>
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>价格(元)</th>
                            <th>商品增加</th>
                            <th>商品入库</th>
                            <th>商品销售</th>
                            <th>商品损耗</th>
                            <th>库存剩余</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="data" items="${list}">
                            <tr>
                                <td>${data.goodNo}</td>
                                <td>${data.goodName}</td>
                                <td>${data.goodPrice}</td>
                                <c:choose>
                                    <c:when test="${data.opType == 1}">
                                        <td class="text-success">${data.countGoods}件</td>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                    </c:when>
                                    <c:when test="${data.opType == 2}">
                                        <td>--</td>
                                        <td class="text-success">${data.countGoods}件</td>
                                        <td>--</td>
                                        <td>--</td>
                                    </c:when>
                                    <c:when test="${data.opType == 3}">
                                        <td>--</td>
                                        <td>--</td>
                                        <td class="text-danger">${data.countGoods}件</td>
                                        <td>--</td>
                                    </c:when>
                                    <c:when test="${data.opType == 4}">
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                        <td class="text-danger">${data.countGoods}件</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${data.goodCount}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>G0001</td>
                            <td>斯伯丁NBA篮球	</td>
                            <td>139.00</td>
                            <td class="text-success">+ 60件</td>
                            <td class="text-success">+ 10件</td>
                            <td class="text-danger">- 3件</td>
                            <td class="text-danger">- 4件</td>
                            <td>63件</td>
                        </tr>
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
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="stock"/>
</c:import>
