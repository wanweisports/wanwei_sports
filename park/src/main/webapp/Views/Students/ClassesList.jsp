<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>学生管理</span> &gt;&gt; <span>班级管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">班级管理</div>
            <div class="panel-body">
                <a href="#classModal" class="btn btn-primary" data-toggle="modal" data-backdrop="false">
                    <span class="glyphicon glyphicon-plus"></span> 添加班级
                </a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>班级名称</th>
                            <th>总计人数</th>
                            <th>总计用场</th>
                            <th>状态</th>
                            <th>操作人</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">
                                <a href="">22人</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <a href="">1232次</a>
                            </td>
                            <td style="vertical-align: middle;">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
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

    <div class="modal fade" id="classModal" tabindex="-1" role="dialog" aria-labelledby="classModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="classModalLabel">增加班级</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <form id="class_form" class="form-horizontal" onsubmit="return false;">
                        <div class="form-group">
                            <label for="class_name" class="col-sm-2 control-label">班级名称</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="class_name" name="className"
                                       placeholder="请输入班级名称">
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="student"/>
    <c:param name="subNav" value="class"/>
</c:import>
