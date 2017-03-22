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
            <ul class="nav nav-tabs">
                <li role="presentation" class="active">
                    <a href="">学生上课明细</a>
                </li>
                <li role="presentation">
                    <a href="#">学生上课汇总</a>
                </li>
                <li role="presentation">
                    <a href="#">学生上课分析</a>
                </li>
            </ul>
            <div class="panel-body">
                <form class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="开始日期">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="结束日期">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="学生姓名或者编号">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="课程名称或者编号">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索
                        </a>
                    </div>

                    <div class="form-group pull-right">
                        <a href="javascript:;" class="btn btn-danger" title="导出数据">
                            <span class="glyphicon glyphicon-print"></span>
                        </a>
                    </div>
                </form>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>学员编号</th>
                    <th>学员姓名</th>
                    <th>登记课程</th>
                    <th>登记时间</th>
                    <th>登记人</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>01</td>
                    <td>战三胖</td>
                    <td>英语全天</td>
                    <td>2017-05-01</td>
                    <td>张龙</td>
                </tr>
                <tr>
                    <td>02</td>
                    <td>战三胖</td>
                    <td>英语全天</td>
                    <td>2017-05-01</td>
                    <td>张龙</td>
                </tr>
                <tr>
                    <td>03</td>
                    <td>战三胖</td>
                    <td>英语全天</td>
                    <td>2017-05-01</td>
                    <td>张龙</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="学员上课统计"/>
</c:import>
