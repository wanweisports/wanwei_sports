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
                        <input type="text" class="form-control" placeholder="课程名称">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="开课时间">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="结课时间">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索课程
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus"></span> 增加课程
                        </a>
                    </div>
                </form>
            </div>

            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>课程编号</th>
                    <th>课程名称</th>
                    <th>开课时间</th>
                    <th>结课时间</th>
                    <th>学费</th>
                    <th>有效次数</th>
                    <th>课时</th>
                    <th>上课时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>01</td>
                    <td>英语全天</td>
                    <td>2017-05-01</td>
                    <td>2017-06-01</td>
                    <td>￥800.00</td>
                    <td>0</td>
                    <td>100</td>
                    <td>上课中</td>
                    <td>星期六：12:00-13:00；星期日：12:00-13:00</td>
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
                    <td>英语全天</td>
                    <td>2017-05-01</td>
                    <td>2017-06-01</td>
                    <td>￥800.00</td>
                    <td>0</td>
                    <td>100</td>
                    <td>已结束</td>
                    <td>星期六：12:00-13:00；星期日：12:00-13:00</td>
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
                    <td>英语全天</td>
                    <td>2017-05-01</td>
                    <td>2017-06-01</td>
                    <td>￥800.00</td>
                    <td>0</td>
                    <td>100</td>
                    <td>报名中</td>
                    <td>星期六：12:00-13:00；星期日：12:00-13:00</td>
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
                    <h4 class="modal-title">课程设置</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" novalidate onsubmit="return false;">
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程编号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="课程编号" value="01" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="课程名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程时间
                            </label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" placeholder="开课时间">
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" placeholder="结课时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 上课时间
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="上课时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 学费
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="学费">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 有效次数
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="有效次数">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课时
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="课时">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 课程状态
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" value="1"> 报名中
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="1"> 上课中
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="1"> 已结束
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
    <c:param name="title" value="课程设置"/>
</c:import>
