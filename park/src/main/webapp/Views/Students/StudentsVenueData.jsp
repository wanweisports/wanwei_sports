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
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>学生管理</span> &gt;&gt; <span>学生用场明细</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">学生用场明细</div>
            <div class="panel-body">
                <form class="form-inline" id="data_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" id="student_name" name="student_name"
                               placeholder="请输入学生姓名">
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
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>学生姓名</th>
                            <th>用场时间</th>
                            <th>场地类型</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>李洪旭</td>
                            <td>2016-10-25 12:11</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
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
    <c:param name="subNav" value="sdata"/>
</c:import>
