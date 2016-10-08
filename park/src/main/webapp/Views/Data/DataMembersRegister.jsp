<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">会员注册统计</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline">
                        <div class="form-group">
                            <select class="form-control" style="width: 200px;">
                                <option value="0">今日数据</option>
                                <option value="1">昨日数据</option>
                                <option value="2">当前周数据</option>
                                <option value="3">当前月数据</option>
                            </select>
                        </div>
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 筛选 / 显示
                        </a>
                        <a href="javascript:;" class="btn btn-primary pull-right">
                            <span class="glyphicon glyphicon-export"></span> 导出数据
                        </a>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>会员类型</th>
                                <th>单价(元)</th>
                                <th>销售数量(个)</th>
                                <th>销售金额(元)</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="reg" items="${registers}">
                                <tr>
                                    <td>${reg.index}</td>
                                    <td>${reg.card_type_name}</td>
                                    <td>${reg.card_type_money}</td>
                                    <td>${reg.card_type_num}</td>
                                    <td>${reg.card_type_total}</td>
                                </tr>
                            </c:forEach>
                            <tr class="info">
                                <th></th>
                                <th></th>
                                <th>合计</th>
                                <th>${card_type_num_total}</th>
                                <th>${card_type_total_total}</th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />