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
                text: '营业收支',
                show: false,
                textAlign: 'center'
            },
            tooltip: {},
            legend: {
                data:['金额'],
                show: false
            },
            xAxis: {
                data: ["总金额","场地预订","商品销售","会员储值","其他收入"],
                textStyle: "#ffffff"
            },
            yAxis: {
                axisLine: {show: false},
                axisLabel: {show: false},
                axisTick: {show: false},
                splitLine: {
                    show: true,
                    lineStyle: {
                        type: "dashed"
                    }
                }
            },
            series: [{
                name: '金额',
                type: 'bar',
                label: {
                    normal: {
                        show: true,
                        position: 'inside'
                    }
                },
                data: [${sumPrice}, ${siteCounts.sumPrice}, ${goodsCounts.sumPrice}, ${cardCounts.sumPrice}, 0.00]
            }]
        };

        myChart.setOption(option);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">总金额(元)</div>
                <div class="money">${sumPrice}</div>
            </div>
        </div>
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">场地预订(元)</div>
                <div class="money">${siteCounts.sumPrice}</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">商品销售(元)</div>
                <div class="money">${goodsCounts.sumPrice}</div>
            </div>
        </div>
        <div class="weui-flex field-block">
            <div class="weui-flex__item field-block__item">
                <div class="title">会员储值(元)</div>
                <div class="money">${cardCounts.sumPrice}</div>
            </div>
            <div class="weui-flex__item field-block__item">
                <div class="title">其他收入(元)</div>
                <div class="money">0.00</div>
            </div>
        </div>
        <div>
            <div id="data_echarts" style="width: 100%;height:400px;"></div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地收支"/>
</c:import>
