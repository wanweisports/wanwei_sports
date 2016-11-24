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
                            <a href="javascript:;" class="btn btn-primary">今天</a>
                            <a href="javascript:;" class="btn btn-default">昨天</a>
                            <a href="javascript:;" class="btn btn-default">本周</a>
                            <a href="javascript:;" class="btn btn-default">本月</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="good_no" name="goodNo"
                            placeholder="商品编号" value="${goodNo}">
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
                        <a href="javascript:;" class="btn btn-primary goods-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">商品销售总计:</li>
                <li style="margin-right: 15px;">全部类别 <span class="badge">42件</span></li>
                <li style="margin-right: 15px;">食品饮料 <span class="badge">0件</span></li>
                <li style="margin-right: 15px;">服饰鞋帽 <span class="badge">21次</span></li>
                <li style="margin-right: 15px;">运动器具 <span class="badge">21次</span></li>
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger">
                    <span class="glyphicon glyphicon-export"></span> 导出数据
                </a>
                <a href="javascript:;" class="btn btn-primary" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
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
                            <th>操作名称</th>
                            <th>操作数量</th>
                            <th>备注</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>销售</td>
                            <td>-10</td>
                            <td>无</td>
                            <td>系统管理员</td>
                            <td>2016-10-07 14:39:35</td>
                        </tr>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>入库</td>
                            <td>10</td>
                            <td>无</td>
                            <td>系统管理员</td>
                            <td>2016-10-07 14:36:46</td>
                        </tr>
                        <tr>
                            <td>09898</td>
                            <td>泳镜</td>
                            <td>入库</td>
                            <td>100</td>
                            <td>无</td>
                            <td>系统管理员</td>
                            <td>2016-08-07 18:13:45</td>
                        </tr>
                        <tr>
                            <td>556677</td>
                            <td>脉动</td>
                            <td>销售</td>
                            <td>-1</td>
                            <td></td>
                            <td>系统管理员</td>
                            <td>2016-08-06 11:22:30</td>
                        </tr>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>销售</td>
                            <td>-1</td>
                            <td></td>
                            <td>系统管理员</td>
                            <td>2016-08-06 11:22:30</td>
                        </tr>
                        <tr>
                            <td>556677</td>
                            <td>脉动</td>
                            <td>销售</td>
                            <td>-1</td>
                            <td></td>
                            <td>系统管理员</td>
                            <td>2016-08-05 12:55:39</td>
                        </tr>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>销售</td>
                            <td>-1</td>
                            <td></td>
                            <td>系统管理员</td>
                            <td>2016-08-05 12:55:39</td>
                        </tr>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>销售</td>
                            <td>-5</td>
                            <td></td>
                            <td>系统管理员</td>
                            <td>2016-08-03 15:53:28</td>
                        </tr>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>销售</td>
                            <td>-3</td>
                            <td></td>
                            <td>系统管理员</td>
                            <td>2016-08-03 01:19:12</td>
                        </tr>
                        <tr>
                            <td>0102</td>
                            <td>矿泉水</td>
                            <td>入库</td>
                            <td>200</td>
                            <td>无</td>
                            <td>系统管理员</td>
                            <td>2016-08-03 00:49:10</td>
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
    <c:param name="subNav" value="detail"/>
</c:import>
