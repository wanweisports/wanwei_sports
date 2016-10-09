<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">进销存管理</li>
        </ol>
        <div class="settings-filter">
            <form class="form-inline">
                <div class="form-group">
                    <label for="good_name">商品名称</label>
                    <input type="text" class="form-control" id="good_name" name="good_name"
                           placeholder="请输入商品名称">
                </div>
                <div class="form-group">
                    <label for="good_state">&nbsp;商品状态</label>
                    <select class="form-control" id="good_state" name="good_state">
                        <option value="">全部状态</option>
                        <option value="1">在售</option>
                        <option value="2">预售</option>
                        <option value="3">下架</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>&nbsp;</label>
                    <a href="javascript:;" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span> 检索商品
                    </a>
                </div>
            </form>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>库存数量</th>
                        <th>价格(元)</th>
                        <th>会员价格(元)</th>
                        <th>商品状态</th>
                        <th>操作人</th>
                        <th>操作时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="good" items="${goods}">
                    <tr>
                        <td>${good.good_no}</td>
                        <td>${good.good_name}</td>
                        <td>${good.good_count}</td>
                        <td>${good.good_price}</td>
                        <td>${good.discount_price}</td>
                        <c:if test="${good.good_state == 1}">
                            <td class="text-success">预售</td>
                        </c:if>
                        <c:if test="${good.good_state == 2}">
                            <td class="text-success">在售</td>
                        </c:if>
                        <c:if test="${good.good_state == 3}">
                            <td class="text-danger">下架</td>
                        </c:if>
                        <td>李晓丹</td>
                        <td>2016-09-03</td>
                        <td>
                            <c:if test="${good.good_state == 1 || good.good_state == 2}">
                                <a href="#xiajiaModal" class="btn btn-warning" data-toggle="modal">
                                    <span class="glyphicon glyphicon-arrow-down"></span> 下架
                                </a>
                            </c:if>
                            <c:if test="${good.good_state == 3}">
                                <a href="#shangjiaModal" class="btn btn-primary" data-toggle="modal">
                                    <span class="glyphicon glyphicon-arrow-up"></span> 上架
                                </a>
                            </c:if>
                            <a href="#kucunModal" class="btn btn-primary" data-toggle="modal">
                                <span class="glyphicon glyphicon-hdd"></span> 增加库存
                            </a>
                            <a href="/goods/stockView/${good.good_id}" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span> 查看
                            </a>
                        </td>
                        <td>
                            <a href="#myModal" data-toggle="modal" data-original-title="" class="btn btn-primary">
                                <i class="glyphicon glyphicon-edit"></i> 修改
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav class="pull-right">
                    <p class="pull-left" style="margin: 24px 14px;">
                        <span>${pageSize }条/页</span>
                        <span>总${count}条</span>
                    </p>
                    <ul class="pagination pull-right">
                        <c:if test="${isFirstPage}">
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
                        <c:if test="${!isFirstPage}">
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
                        <c:if test="${isLastPage}">
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
                        <c:if test="${!isLastPage}">
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

<div class="modal fade" id="kucunModal" tabindex="-1" role="dialog" aria-labelledby="kucunModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="kucunModalLabel">增加库存</h4>
            </div>
            <div class="modal-body" style="clear: both;">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <div class="alert alert-info" role="alert">当前库存: 1000件</div>
                        <input type="text" class="form-control" placeholder="请输入增加的库存量">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <span class="glyphicon glyphicon-ok"></span> 确 认
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="shangjiaModal" tabindex="-1" role="dialog" aria-labelledby="shangjiaModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="shangjiaModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>商品成功上架!</p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="xiajiaModal" tabindex="-1" role="dialog" aria-labelledby="xiajiaModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="xiajiaModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>商品成功下架!</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
