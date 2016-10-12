<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">进销存管理</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline" id="goods_filter_form" onsubmit="return false;">
                        <div class="form-group">
                            <label for="good_name">商品名称</label>
                            <input type="text" class="form-control" id="good_name" name="goodName"
                                   placeholder="请输入商品名称" value="${goodName}">
                        </div>
                        <div class="form-group">
                            <label for="good_state">&nbsp;商品状态</label>
                            <select class="form-control" id="good_state" name="goodStatus" style="width: 160px;">
                                <option value="">全部状态</option>
                                <option value="1" <c:if test="${goodStatus == 1}">selected</c:if> >在售</option>
                                <option value="2" <c:if test="${goodStatus == 2}">selected</c:if> >预售</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>&nbsp;</label>
                            <a href="javascript:;" class="btn btn-primary goods-filter">
                                <span class="glyphicon glyphicon-search"></span> 检索 & 显示
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
                                <th>库存数量</th>
                                <th>价格(元)</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="good" items="${list}">
                                <tr>
                                    <td>${good.goodNo}</td>
                                    <td>${good.goodName}</td>
                                    <td>${good.goodCount}</td>
                                    <td>${good.goodPrice}</td>
                                    <c:if test="${good.goodStatus == 1}">
                                        <td class="text-success">在售</td>
                                    </c:if>
                                    <c:if test="${good.goodStatus == 2}">
                                        <td class="text-danger">预售</td>
                                    </c:if>
                                    <td>${good.operatorName}</td>
                                    <td>${good.createTime}</td>
                                    <td>
                                        <c:if test="${good.goodStatus == 2}">
                                            <a href="javascript:;" class="btn btn-primary goods-enter"
                                               data-id="${good.goodId}">
                                                <span class="glyphicon glyphicon-arrow-up"></span> 上架
                                            </a>
                                        </c:if>
                                        <c:if test="${good.goodStatus == 1}">
                                            <a href="javascript:;" class="btn btn-primary goods-outer"
                                               data-id="${good.goodId}">
                                                <span class="glyphicon glyphicon-arrow-down"></span> 下架
                                            </a>
                                        </c:if>
                                        <a href="#kucunModal" class="btn btn-primary goods-count" data-toggle="modal"
                                           data-id="${good.goodId}" data-count="${good.goodCount}">
                                            <span class="glyphicon glyphicon-hdd"></span> 增加库存
                                        </a>
                                        <a href="good/updateGood?goodId=${good.goodId}" class="btn btn-primary">
                                            <span class="glyphicon glyphicon-share-alt"></span> 查看
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize}条/页</span>
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
                <div class="alert alert-info" role="alert">当前库存: <span id="nowGoodCount"></span>件</div>
                <form id="good_kucun_form" class="form-horizontal" onsubmit="return false;">
                    <input type="hidden" name="goodId">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="good_count" name="goodCount"
                                   placeholder="请输入增加的库存量"
                                   data-val="true" data-val-required="库存量不能为空">
                            <div data-valmsg-for="goodCount" data-valmsg-replace="true"></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary confirm-count" data-dismiss="modal">
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
<script src="Content/lib/jquery/jquery.validate/jquery.validate.js"></script>
<script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js"></script>
<script src="Content/app/goods/goods_stock_management.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />
