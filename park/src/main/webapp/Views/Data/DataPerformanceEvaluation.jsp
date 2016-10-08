<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">用户业绩统计</li>
        </ol>
        <div class="settings-filter">
            <form class="form-inline">
                <div class="form-group">
                    <select class="form-control">
                        <option value="0">今日数据</option>
                        <option value="1">昨日数据</option>
                        <option value="2">当前周数据</option>
                        <option value="3">当前月数据</option>
                    </select>
                </div>
                <a href="javascript:;" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 显示
                </a>
                <a href="javascript:;" class="btn btn-info pull-right">
                    <span class="glyphicon glyphicon-search"></span> 导出数据
                </a>
            </form>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>会员类型</th>
                        <th>单价(元)</th>
                        <th>销售数量</th>
                        <th>销售金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>金卡会员</td>
                        <td>1000.00</td>
                        <td>2</td>
                        <td>2000.00</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>银卡会员</td>
                        <td>500.00</td>
                        <td>12</td>
                        <td>6000.00</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>普通会员</td>
                        <td>10.00</td>
                        <td>226</td>
                        <td>2260.00</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>临时会员</td>
                        <td>0.00</td>
                        <td>1000</td>
                        <td>0.00</td>
                    </tr>
                    <tr class="warning">
                        <td></td>
                        <td></td>
                        <td>合计</td>
                        <td>1232</td>
                        <td>12300.00</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
