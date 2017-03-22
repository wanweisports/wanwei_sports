<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/goods/goods_list.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#plus_count_form, #minus_count_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">商品查询</div>
            <div class="panel-body">
                <form class="form-inline" id="goods_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" id="good_name" name="goodName"
                               placeholder="商品名称" value="${goodName}">
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="good_type" name="goodType" style="width: 160px;">
                            <option value="">商品类别</option>
                            <c:forEach var="type" items="${goodTypeNames}">
                                <option value="${type.goodTypeId}" <c:if test='${type.goodTypeId == goodType}'>selected</c:if>>${type.goodTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="good_state" name="goodStatus" style="width: 160px;">
                            <option value="">商品状态</option>
                            <option value="1" <c:if test="${goodStatus == 1}">selected</c:if> >在售</option>
                            <option value="2" <c:if test="${goodStatus == 2}">selected</c:if> >预售</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;</label>
                        <a href="javascript:;" class="btn btn-success goods-filter">
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
                        <tr class="bg-info">
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>当前库存</th>
                            <th>商品单价(元)</th>
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
                                        <a href="javascript:;" class="btn btn-success goods-enter"
                                           data-id="${good.goodId}">
                                            <span class="glyphicon glyphicon-arrow-up"></span> 上架
                                        </a>
                                    </c:if>
                                    <c:if test="${good.goodStatus == 1}">
                                        <a href="javascript:;" class="btn btn-warning goods-outer"
                                           data-id="${good.goodId}">
                                            <span class="glyphicon glyphicon-arrow-down"></span> 下架
                                        </a>
                                    </c:if>
                                    <a href="#plus_count_modal" class="btn btn-success goods-count" data-toggle="modal"
                                       data-id="${good.goodId}" data-count="${good.goodCount}" data-backdrop="false">
                                        <span class="glyphicon glyphicon-plus"></span> 增加库存
                                    </a>
                                    <a href="#minus_count_modal" class="btn btn-danger goods-minus-count" data-toggle="modal"
                                       data-id="${good.goodId}" data-count="${good.goodCount}" data-backdrop="false">
                                        <span class="glyphicon glyphicon-adjust"></span> 损耗
                                    </a>
                                    <a href="/good/viewGood?goodId=${good.goodId}" class="btn btn-success">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                </td>
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

    <div class="modal fade" id="plus_count_modal" tabindex="-1" role="dialog" aria-labelledby="plus_count_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="plus_count_modal_label">增加库存</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <div class="alert alert-info" role="alert">当前库存: <span id="plus_current_good_count"></span>件</div>
                    <form id="plus_count_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="goodId" id="plus_good_id">
                        <div class="form-group">
                            <div class="col-sm-12 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="plus_good_count" name="goodCount"
                                       placeholder="请输入增加的库存量" autocomplete="off"
                                       data-val="true" data-val-required="增加的库存量不能为空"
                                       data-val-regex-pattern="^[1-9]\d*$"
                                       data-val-regex="增加的库存量格式错误">
                                <div data-valmsg-for="goodCount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success confirm-plus-count" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 认
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="minus_count_modal" tabindex="-1" role="dialog" aria-labelledby="minus_count_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="minus_count_modal_label">库存损耗</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <div class="alert alert-danger" role="alert">当前库存量: <span id="minus_current_good_count"></span>件</div>
                    <form id="minus_count_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="goodId" id="minus_good_id">
                        <div class="form-group">
                            <div class="col-sm-12 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="minus_good_count" name="goodCount"
                                       placeholder="请输入损耗的库存量" autocomplete="off"
                                       data-val="true" data-val-required="损耗的库存量不能为空"
                                       data-val-regex-pattern="^[1-9]\d*$"
                                       data-val-regex="损耗的库存量格式错误">
                                <div data-valmsg-for="goodCount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success confirm-minus-count" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 认
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="list"/>
</c:import>
