<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>"></layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"></layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="姓名">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索操作员
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus"></span> 增加操作员
                        </a>
                    </div>
                </form>
            </div>

            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>所任职务</th>
                    <th>所赋权限</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>01</td>
                    <td>张萨芬1</td>
                    <td></td>
                    <td>
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-cog"></span> 经理权限
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                        <button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>02</td>
                    <td>张萨芬2</td>
                    <td></td>
                    <td>
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-cog"></span> 经理权限
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                        <button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>03</td>
                    <td>张萨芬3</td>
                    <td></td>
                    <td>
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-cog"></span> 经理权限
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                        <button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">操作员设置</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" novalidate onsubmit="return false;">
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 编号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="操作员编号" value="01" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="操作员姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 所任职务
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="所任职务">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 状态
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" value="1"> 正常
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="1"> 锁定
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span> 取消
                    </button>
                    <button type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-ok"></span> 保存
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <p class="text-muted">确定删除吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span> 取消
                </button>
                <button type="button" class="btn btn-primary">
                    <span class="glyphicon glyphicon-ok"></span> 确定
                </button>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="操作员设置"/>
</c:import>
