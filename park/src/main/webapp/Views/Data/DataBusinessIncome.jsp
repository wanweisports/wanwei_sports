<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">营业收入统计</li>
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
                                <th>项目</th>
                                <th>现金</th>
                                <th>POS机</th>
                                <th>支付宝</th>
                                <th>微信</th>
                                <th>支票</th>
                                <th>项目小计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>金卡</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>银卡</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>普卡</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>补卡</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr class="info">
                                <th>金额小计</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                            </tr>
                            <tr>
                                <td>场地预订</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr>
                                <td>包场预订</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr class="info">
                                <th>金额小计</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                            </tr>
                            <tr>
                                <td>商品消费</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                                <td>0.00</td>
                            </tr>
                            <tr class="info">
                                <th>金额总计</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                                <th>0.00</th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top:10px">
            <div class="col-sm-6">值班经理签字: <span class="text-success">李洪旭</span></div>
            <div class="col-sm-6">财务经理签字: <span class="text-success">李洪旭</span></div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
