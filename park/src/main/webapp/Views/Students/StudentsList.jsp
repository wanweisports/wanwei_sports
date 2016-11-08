<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/dist/students/students_list_query.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>学生管理</span> &gt;&gt; <span>学生查询</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">学生查询</div>
            <div class="panel-body">
                <form id="student_filter_form" class="form-inline" method="post" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="student_degree" name="student_degree">
                            <option value="">所在年级</option>
                            <option value="1">16级02班</option>
                            <option value="2">16级03班</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="student_name" name="student_name"
                               placeholder="请输入学生姓名">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary member-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus"></span> 添加学生
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>照片</th>
                            <th>姓名</th>
                            <th>班级</th>
                            <th>使用次数</th>
                            <th>状态</th>
                            <th>操作人</th>
                            <th>办卡时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="vertical-align: middle;">
                                <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" class="img-rounded"
                                     style="width: 100px; height: 80px;">
                            </td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;">10</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">
                                <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" class="img-rounded"
                                     style="width: 100px; height: 80px;">
                            </td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">
                                <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" class="img-rounded"
                                     style="width: 100px; height: 80px;">
                            </td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">
                                <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" class="img-rounded"
                                     style="width: 100px; height: 80px;">
                            </td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle;">
                                <img src="/Content/images/demo/mp60650501_1456481736483_2.jpeg" class="img-rounded"
                                     style="width: 100px; height: 80px;">
                            </td>
                            <td style="vertical-align: middle;">王晓红</td>
                            <td style="vertical-align: middle;">16级01班</td>
                            <td style="vertical-align: middle;" class="text-success">正常</td>
                            <td style="vertical-align: middle;">张丹丹</td>
                            <td style="vertical-align: middle;">2016-12-11 10:00:12</td>
                            <td style="vertical-align: middle;">
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="student"/>
    <c:param name="subNav" value="list"/>
</c:import>
