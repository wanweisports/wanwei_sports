<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/business/data/data_income.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/echarts/echarts.min.js?v=${static_resource_version}"></script>
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
                data: [
                    "${fn:replace(compareWeek, '星期', '上周')}",
                    "${fn:replace(yesterdayWeek, '星期', '周')}",
                    "${fn:replace(todayWeek, '星期', '周')}"
                ]
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
                        if (value / 10000 >= 1) {
                            return (value / 10000) + "万";
                        } else if (value / 1000 >= 1) {
                            return (value / 1000) + "千";
                        } else {
                            return value;
                        }
                    }
                }
            },
            yAxis: {
                type: 'category',
                data: ['会员', '场地', '商品', '营业\n收入'],
                axisLabel: {
                    textStyle: {
                        fontSize: 16
                    }
                }
            },
            series: [{
                name: "${fn:replace(compareWeek, '星期', '上周')}",
                type: 'bar',
                data: [
                    ${compare.cardSum},
                    ${compare.siteSum},
                    ${compare.goodsSum},
                    ${compare.siteSum + compare.cardSum + compare.goodsSum}
                ]
            }, {
                name: "${fn:replace(yesterdayWeek, '星期', '周')}",
                type: 'bar',
                data: [
                    ${yesterday.cardSum},
                    ${yesterday.siteSum},
                    ${yesterday.goodsSum},
                    ${yesterday.siteSum + yesterday.cardSum + yesterday.goodsSum}
                ]
            }, {
                name: "${fn:replace(todayWeek, '星期', '周')}",
                type: 'bar',
                data: [
                    ${today.cardSum},
                    ${today.siteSum},
                    ${today.goodsSum},
                    ${today.siteSum + today.cardSum + today.goodsSum}
                ]
            }]
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
                        <th>日期</th>
                        <th>会员</th>
                        <th>场地</th>
                        <th>商品</th>
                        <th>总金额</th>
                    </thead>
                    <tbody>
                    <tr>
                        <th>${fn:replace(compareWeek, '星期', '上周')}</th>
                        <td>￥${compare.cardSum}</td>
                        <td>￥${compare.siteSum}</td>
                        <td>￥${compare.goodsSum}</td>
                        <td>￥${compare.siteSum + compare.cardSum + compare.goodsSum}</td>
                    </tr>
                    <tr>
                        <th>${fn:replace(yesterdayWeek, '星期', '周')}</th>
                        <td>￥${yesterday.cardSum}</td>
                        <td>￥${yesterday.siteSum}</td>
                        <td>￥${yesterday.goodsSum}</td>
                        <td>￥${yesterday.siteSum + yesterday.cardSum + yesterday.goodsSum}</td>
                    </tr>
                    <tr>
                        <th>${fn:replace(todayWeek, '星期', '周')}</th>
                        <td>￥${today.cardSum}</td>
                        <td>￥${today.siteSum}</td>
                        <td>￥${today.goodsSum}</td>
                        <td>￥${today.siteSum + today.cardSum + today.goodsSum}</td>
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
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="<%=basePath%>business/data/income">今日营业数据</a>
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">历史数据对比</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地收支"/>
</c:import>
