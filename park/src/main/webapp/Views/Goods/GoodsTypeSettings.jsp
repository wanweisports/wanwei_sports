<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/goods/goods_type_settings.js?v=${static_resource_version}"></script>
    <script>
        // 表单校验设置
        $('#good_type_form').validate({
            ignore: ":hidden"
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品类别设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">商品类别查询</div>
            <div class="panel-body">
                <button type="button" class="btn btn-primary good-type-add" data-toggle="modal"
                        data-target="#addModal" data-backdrop="false">
                    <span class="glyphicon glyphicon-plus"></span> 增加商品类别
                </button>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive good-type-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>商品类别</th>
                            <th>类别描述</th>
                            <th>操作时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="type" items="${list}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${type.goodTypeName}</td>
                                <td>${type.goodTypeDescribe}</td>
                                <td>${type.createTime}</td>
                                <td>
                                    <a class="btn btn-primary type-item" href="#addModal" data-toggle="modal"
                                       data-backdrop="false" data-id="${type.goodTypeId}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="addModalLabel">设置商品类别</h5>
                </div>
                <div class="modal-body" style="overflow: hidden;">
                    <form id="good_type_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="goodTypeId" id="good_type_id">
                        <div class="form-group">
                            <label for="good_type_name" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 类别名称
                            </label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="good_type_name" name="goodTypeName"
                                       placeholder="例如:饮食类,器械类" autocomplete="off"
                                       data-val="true" data-val-required="类别名称不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,5}$"
                                       data-val-regex="类别名称长度只能2~6个字符">
                                <div data-valmsg-for="goodTypeName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_type_remark" class="col-sm-2 control-label">类别描述</label>

                            <div class="col-sm-10">
                                <textarea class="form-control" id="good_type_remark" name="goodTypeDescribe" rows="3"
                                          placeholder="类别描述"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="save_good_type">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
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
                    <div class="alert alert-success" role="alert">商品类别设置保存成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="type"/>
</c:import>

