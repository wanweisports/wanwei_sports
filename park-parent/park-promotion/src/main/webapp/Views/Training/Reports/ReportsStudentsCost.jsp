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
                <form class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="javascript:;" class="btn btn-primary">日</a>
                            <a href="javascript:;" class="btn btn-default">周</a>
                            <a href="javascript:;" class="btn btn-default">月</a>
                            <a href="javascript:;" class="btn btn-default">年</a>
                        </div>
                    </div>
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
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索
                        </a>
                    </div>

                    <div class="form-group pull-right">
                        <div class="btn-group">
                            <a href="javascript:;" class="btn btn-primary">全部</a>
                            <a href="javascript:;" class="btn btn-default">已缴</a>
                            <a href="javascript:;" class="btn btn-default">未缴</a>
                        </div>

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
                    <th>缴费日期</th>
                    <th>应付金额</th>
                    <th>优惠金额</th>
                    <th>实收金额</th>
                    <th>欠费金额</th>
                    <th>操作员</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>01</td>
                    <td>战三胖</td>
                    <td>2017-05-01</td>
                    <td>￥1000.00</td>
                    <td>￥200.00</td>
                    <td>￥800.00</td>
                    <td>￥0.00</td>
                    <td>张龙</td>
                    <td>
                        <a href="javascript:;" class="btn btn-danger" title="学生缴费">
                            <span class="glyphicon glyphicon-cloud-upload"></span>
                        </a>
                        <a href="javascript:;" class="btn btn-danger" title="学生退费">
                            <span class="glyphicon glyphicon-cloud-download"></span>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>02</td>
                    <td>战三胖</td>
                    <td>2017-05-01</td>
                    <td>￥1000.00</td>
                    <td>￥200.00</td>
                    <td>￥800.00</td>
                    <td>￥0.00</td>
                    <td>张龙</td>
                    <td>
                        <a href="javascript:;" class="btn btn-danger" title="学生缴费">
                            <span class="glyphicon glyphicon-cloud-upload"></span>
                        </a>
                        <a href="javascript:;" class="btn btn-danger" title="学生退费">
                            <span class="glyphicon glyphicon-cloud-download"></span>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>03</td>
                    <td>战三胖</td>
                    <td>2017-05-01</td>
                    <td>￥1000.00</td>
                    <td>￥200.00</td>
                    <td>￥800.00</td>
                    <td>￥0.00</td>
                    <td>张龙</td>
                    <td>
                        <a href="javascript:;" class="btn btn-danger" title="学生缴费">
                            <span class="glyphicon glyphicon-cloud-upload"></span>
                        </a>
                        <a href="javascript:;" class="btn btn-danger" title="学生退费">
                            <span class="glyphicon glyphicon-cloud-download"></span>
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="学员交费统计"/>
</c:import>
