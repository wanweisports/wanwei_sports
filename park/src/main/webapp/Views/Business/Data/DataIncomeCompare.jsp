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
        var myChart = echarts.init(document.getElementById('data_echarts1'));

        var option = {
            backgroundColor: "#faf6f3",
            title: {
                text: '营业收支数据对比',
                subtext: '对比今日，昨日，上周同日的营业收支数据'
            },
            tooltip: {
                show: false,
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            color: ['#59ADF3', '#EC7D31', '#AF89D6'],
            legend: {
                show: true,
                top: 0,
                right: 0,
                data: ['上周六', '周五', '周六']
            },
            grid: {
                left: '5%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                axisLine: {
                    lineStyle: {color: '#ccc'}
                },
                axisLabel: {
                    textStyle: {color: '#777'},
                    formatter: function (value) {
                        return (value / 10000) + "万";
                    }
                }
            },
            yAxis: {
                type: 'category',
                data: ['会员\n储值', '商品\n销售', '场地\n预订', '营业\n收入'],
                axisLabel: {
                    textStyle: {
                        fontSize: 16
                    }
                }
            },
            series: [
                {
                    name: '上周六',
                    type: 'bar',
                    data: [1930, 2243, 3660, 7833]
                },
                {
                    name: '周五',
                    type: 'bar',
                    data: [4930, 6243, 6660, 17833]
                },
                {
                    name: '周六',
                    type: 'bar',
                    data: [9930, 1243, 9930, 14833]
                }
            ]
        };

        myChart.setOption(option);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-form-preview">
            <div class="weui-form-preview__bd">
                <table>
                    <thead>
                    <tr>
                        <th></th>
                        <th>场地预订</th>
                        <th>会员储值</th>
                        <th>商品销售</th>
                        <th>总金额</th>
                    </thead>
                    <tbody>
                    <tr>
                        <th>上周六</th>
                        <td>￥3660元</td>
                        <td>￥1930元</td>
                        <td>￥2243元</td>
                        <td>￥7833元</td>
                    </tr>
                    <tr>
                        <th>周五</th>
                        <td>￥6660元</td>
                        <td>￥4930元</td>
                        <td>￥6243元</td>
                        <td>￥17833元</td>
                    </tr>
                    <tr>
                        <th>周六</th>
                        <td>￥3660元</td>
                        <td>￥9930元</td>
                        <td>￥1243元</td>
                        <td>￥14833元</td>
                    </tr>
                    </tbody>
                </table>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts1" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="/business/data/income">今日营业数据</a>
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">历史数据对比</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地收支"/>
</c:import>
