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
    当前位置: <span>教师管理</span> &gt;&gt; <span>教师用场统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default">
            <div class="panel-heading">教师用场统计</div>
            <div class="panel-body">
                <form class="form-inline" id="data_filter_form" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" id="student_sports" name="student_sports" style="width: 160px;">
                            <option value="">全部场地</option>
                            <option value="1">羽毛球</option>
                            <option value="2">篮球</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="student_name" name="student_name"
                               placeholder="请输入教师姓名">
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

        <div class="alert alert-info clearfix">
            <ul class="nav nav-pills pull-left">
                <li style="margin-right: 15px;">场地类型总计:</li>
                <c:forEach var="item" items="${itemCounts}">
                    <li style="margin-right: 15px;">${item.sportName} <span class="badge">${item.typeCount}次</span><span class="badge">${item.typeTime}小时</span></li>
                </c:forEach>
                <li style="margin-right: 15px;">全部 <span class="badge">42次</span><span class="badge">46小时</span></li>
                <li style="margin-right: 15px;">羽毛球 <span class="badge">21次</span><span class="badge">22小时</span></li>
                <li style="margin-right: 15px;">篮球 <span class="badge">21次</span><span class="badge">24小时</span></li>
            </ul>
            <div class="pull-right">
                <a href="javascript:;" class="btn btn-danger">
                    <span class="glyphicon glyphicon-export"></span> 导出数据
                </a>
                <a href="javascript:;" class="btn btn-primary" style="display: none;">
                    <span class="glyphicon glyphicon-stats"></span> 图表显示
                </a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive card-type-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>教师姓名</th>
                            <th>手机号</th>
                            <th>签到时间</th>
                            <th>用场时长</th>
                            <th>场地类型</th>
                            <th>操作人</th>
                            <th>操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="data" items="${pageBean.list}" varStatus="loop">
                            <tr>
                                <td>${loop.index}</td>
                                <td>${data.memberName}</td>
                                <td>${data.memberMobile}</td>
                                <td>${data.signTime}</td>
                                <td>${data.duration}小时</td>
                                <td>${data.sportName}</td>
                                <td>${data.operatorName}</td>
                                <td>${data.opTime}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>1</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>2小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>2小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>李洪旭</td>
                            <td>11012345678</td>
                            <td>2016-10-25 12:11</td>
                            <td>1小时</td>
                            <td>羽毛球</td>
                            <td>李晓丹</td>
                            <td>2016-09-03</td>
                        </tr>
                        </tbody>
                    </table>
                    <nav class="pull-right" <c:if test="${pageBean.count <= pageBean.pageSize}">style="display: none;"</c:if> >
                        <p class="pull-left" style="margin: 12px 14px;">
                            <span>${pageBean.pageSize}条/页</span>
                            <span>总${pageBean.count}条</span>
                        </p>
                        <ul class="pagination pull-right">
                            <c:if test="${pageBean.currentPage == 1}">
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
                            <c:if test="${pageBean.currentPage != 1}">
                                <li>
                                    <a class="page-first" href="javascript:;" data-index="1">
                                        <span>首页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-prev" href="javascript:;" data-index="${pageBean.currentPage - 1}">
                                        <span>上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${pageBean.lastPage}">
                                <c:if test="${i == pageBean.currentPage}">
                                    <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                                <c:if test="${i != pageBean.currentPage}">
                                    <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageBean.currentPage == pageBean.lastPage}">
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
                            <c:if test="${pageBean.currentPage != pageBean.lastPage}">
                                <li>
                                    <a class="page-next" href="javascript:;" data-index="${pageBean.currentPage + 1}">
                                        <span>下一页</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="page-last" href="javascript:;" data-index="${pageBean.lastPage}">
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
    <c:param name="nav" value="teacher"/>
    <c:param name="subNav" value="data"/>
</c:import>
