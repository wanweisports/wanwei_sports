<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/reservations/reservations_sequence_pda.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/echarts/echarts.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/reservations/reservations_sequence_pda.js?v=${static_resource_version}"></script>
    <script>
        function drawChart2() {
            var option = {
                tooltip: {},
                legend: {
                    data:['咨询量', '预订量']
                },
                xAxis: {
                    data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
                },
                yAxis: {},
                series: [{
                    name: '咨询量',
                    type: 'line',
                    data: [5, 20, 36, 10, 10, 20, 40]
                }, {
                    name: '预订量',
                    type: 'line',
                    data: [15, 10, 46, 20, 13, 24, 44]
                }]
            };

            var chart = echarts.init(document.getElementById('line_chart'));
            chart.setOption(option);
            var chart2 = echarts.init(document.getElementById('line_chart2'));
            chart2.setOption(option);
        }


        function drawChart3() {

            var option = {
                tooltip: {},
                legend: {
                    data:['咨询量', '预订量']
                },
                xAxis: {
                    data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
                },
                yAxis: {},
                series: [{
                    name: '咨询量',
                    type: 'bar',
                    data: [5, 20, 36, 10, 10, 20, 40]
                }, {
                    name: '预订量',
                    type: 'bar',
                    data: [15, 10, 46, 20, 13, 24, 44]
                }]
            };

            var chart = echarts.init(document.getElementById('column_chart'));
            chart.setOption(option);
            var chart2 = echarts.init(document.getElementById('column_chart2'));
            chart2.setOption(option);
        }

        drawChart2();
        drawChart3();
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>场地热点分析</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default heat-filter">
            <div class="panel-heading">场地热点分析</div>
            <div class="panel-body">
                <form id="data_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" style="width: 160px;">
                            <option value="0">本周数据</option>
                            <option value="1">本月数据</option>
                            <option value="1">本季度数据</option>
                            <option value="1">本年数据</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"
                               placeholder="开始日期" value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd"
                               placeholder="结束日期" value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary data-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default heat-show">
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr>
                        <td></td>
                        <td>场地1</td>
                        <td>场地2</td>
                        <td>场地3</td>
                        <td>场地4</td>
                        <td>场地5</td>
                        <td>场地6</td>
                        <td>场地7</td>
                        <td>场地8</td>
                        <td>场地9</td>
                        <td>场地10</td>
                    </tr>
                    <tr>
                        <td class="time">08:00 ~ 09:00</td>
                        <td>
                            <a href="#myModal" data-toggle="modal" data-backdrop="false">
                                <span class="order-40">42%</span>
                                <span class="consult-60">61%</span>
                            </a>
                        </td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">09:00 ~ 10:00</td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-80">90%</span><span class="consult-00">11%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-80">90%</span><span class="consult-00">11%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">10:00 ~ 11:00</td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-80">90%</span><span class="consult-00">11%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">11:00 ~ 12:00</td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-80">90%</span><span class="consult-00">11%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">13:00 ~ 14:00</td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-80">90%</span><span class="consult-00">11%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                    </tr>
                    <tr>
                        <td class="time">14:00 ~ 15:00</td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-00">14%</span><span class="consult-80">92%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                    </tr>
                    <tr>
                        <td class="time">15:00 ~ 16:00</td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">16:00 ~ 17:00</td>
                        <td><span class="order-60">62%</span><span class="consult-20">33%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">17:00 ~ 18:00</td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">19:00 ~ 20:00</td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">20:00 ~ 21:00</td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                    <tr>
                        <td class="time">21:00 ~ 22:00</td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-20">32%</span><span class="consult-40">53%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                        <td><span class="order-40">42%</span><span class="consult-60">61%</span></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="panel panel-default heat-tips">
            <div class="panel-body">
                <p>
                    预订率:
                    <span class="order-00">0 - 20%</span>
                    <span class="order-20">20% - 40%</span>
                    <span class="order-40">40% - 60%</span>
                    <span class="order-60">60% - 80%</span>
                    <span class="order-80">80% - 100%</span>
                </p>
                <p>
                    咨询率:
                    <span class="consult-00">0 - 20%</span>
                    <span class="consult-20">20% - 40%</span>
                    <span class="consult-40">40% - 60%</span>
                    <span class="consult-60">60% - 80%</span>
                    <span class="consult-80">80% - 100%</span>
                </p>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div id="line_chart2" style="width: 49%; height: 320px; display: inline-block"></div>
                <div id="column_chart2" style="width: 49%; height: 320px; display: inline-block"></div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="chartModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="chartModalLabel">某场次统计详情</h5>
                </div>
                <div class="modal-body">
                    <div id="line_chart" style="width: 510px; height: 320px; margin: 0 auto"></div>
                    <div id="column_chart" style="width: 510px; height: 320px; display: none;"></div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th></th><th>周一</th><th>周二</th><th>周三</th><th>周四</th><th>周五</th><th>周六</th><th>周日</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>咨询量</td><td>5</td><td>20</td><td>36</td><td>10</td><td>10</td><td>20</td><td>40</td>
                        </tr>
                        <tr>
                            <td>预订量</td><td>15</td><td>10</td><td>46</td><td>20</td><td>13</td><td>24</td><td>44</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="pda"/>
</c:import>
