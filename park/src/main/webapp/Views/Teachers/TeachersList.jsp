<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/teachers/teachers_list.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>教师管理</span> &gt;&gt; <span>教师查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">教师查询</div>
            <div class="panel-body">
                <form id="member_filter_form" class="form-inline" method="post" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="teacher_status" name="teacher_status" style="width: 160px;">
                            <option value="">全部状态</option>
                            <option value="1">正常</option>
                            <option value="2">锁定</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="teacher_card" name="teacher_card"
                               placeholder="请输入教师卡号">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="teacher_name" name="teacher_name"
                               placeholder="请输入教师姓名">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary member-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table teachers-list">
                        <thead>
                        <tr>
                            <th>卡号</th>
                            <th>姓名</th>
                            <th>手机号码</th>
                            <th>用场次数</th>
                            <th>截止日期</th>
                            <th>状态</th>
                            <th>操作人</th>
                            <th>办卡时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="vertical-align: middle;">1242354ewe</td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">11012345678</td>
                            <td style="vertical-align: middle;">142</td>
                            <td style="vertical-align: middle;">2016-12-11</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="/teachers/view">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a href="#buban_modal" class="btn btn-primary teachers-buban" data-toggle="modal"
                                    data-backdrop="false">
                                    <span class="glyphicon glyphicon-refresh"></span> 补办
                                </a>
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">1242354ewe</td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">11012345678</td>
                            <td style="vertical-align: middle;">142</td>
                            <td style="vertical-align: middle;">2016-12-11</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="/teachers/view">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a href="#buban_modal" class="btn btn-primary teachers-buban" data-toggle="modal"
                                   data-backdrop="false">
                                    <span class="glyphicon glyphicon-refresh"></span> 补办
                                </a>
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">1242354ewe</td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">11012345678</td>
                            <td style="vertical-align: middle;">142</td>
                            <td style="vertical-align: middle;">2016-12-11</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="/teachers/view">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a href="#buban_modal" class="btn btn-primary teachers-buban" data-toggle="modal"
                                   data-backdrop="false">
                                    <span class="glyphicon glyphicon-refresh"></span> 补办
                                </a>
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon glyphicon-trash"></span> 删除
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

    <div class="modal fade" id="buban_modal" tabindex="-1" role="dialog" aria-labelledby="buban_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="buban_modal_label">教师卡补办</h5>
                </div>
                <div class="modal-body" style="clear: both;">
                    <form id="buban_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="goodId">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="buban_no" name="buban_no"
                                       placeholder="请输入补办后的卡号"
                                       data-val="true" data-val-required="补办后的卡号不能为空"
                                       data-val-regex-pattern="^[1-9]\d*$">
                                <div data-valmsg-for="buban_no" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary confirm-buban" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 认
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="teacher"/>
    <c:param name="subNav" value="list"/>
</c:import>
