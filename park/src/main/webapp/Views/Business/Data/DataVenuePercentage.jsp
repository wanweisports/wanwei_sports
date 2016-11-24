<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/business/data/data_income.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/echarts/echarts.min.js?v=${static_resource_version}"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('data_echarts'));

        // 指定图表的配置项和数据
        var option = {
            color: ['#ff8a4a'],
            backgroundColor: '#36A1DB',
            title: {
                text: '场地使用率',
                show: false,
                textAlign: 'center'
            },
            tooltip: {},
            legend: {
                data:['小时', '概率'],
                show: false
            },
            xAxis: [{
                data: ["场地1","场地2","场地3","场地4","场地5","场地6","场地7","场地8","场地9"]
            }],
            yAxis: [{
                type: 'value',
                name: '小时',
                axisLabel: {
                    formatter: '{value}'
                }
            }, {
                type: 'value',
                name: '概率',
                axisLabel: {
                    formatter: '{value}%'
                }
            }],
            series: [{
                name: '小时',
                type: 'bar',
                label: {
                    normal: {
                        show: true,
                        position: 'inside'
                    }
                },
                data: [100, 120, 300, 400, 900, 120, 300, 400, 900]
            }, {
                name: '概率',
                type: 'line',
                yAxisIndex: 1,
                data: [10, 12, 30, 40, 90, 12, 30, 40, 90]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">场地使用率</div>
                <div class="money">40%</div>
                <div class="money">1200时</div>
            </div>
        </div>
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">场地1</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">场地2</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">场地3</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
        </div>
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">场地4</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">场地5</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">场地6</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
        </div>
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">场地7</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">场地8</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">场地9</div>
                <div class="money">10%</div>
                <div class="money">100时</div>
            </div>
        </div>
        <div>
            <div id="data_echarts" style="width: 100%;height:400px;"></div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地使用率"/>
</c:import>
