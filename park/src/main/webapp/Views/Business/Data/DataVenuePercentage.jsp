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
    <script>
        $(document).ready(function () {
            $(".sport-list .sport-type").addClass("weui-form-preview__btn_primary")
                .removeClass("weui-form-preview__btn_default");
            $(".sport-list .sport-type[data-id='${sportId}']").addClass("weui-form-preview__btn_default")
                .removeClass("weui-form-preview__btn_primary");
        });
    </script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('data_echarts1'));

        var data = [{
            value: ${todaySiteCount.sumSiteCount - todaySiteCount.emptySiteCount},
            name: '已预订'
        }, {
            value: ${todaySiteCount.emptySiteCount},
            name: '未预订'
        }];
        var option = {
            backgroundColor: "#faf6f3",
            title: {
                text: '场地使用率',
                subtext: '',
                x: 'center',
                y: 'center',
                textStyle: {
                    fontWeight: 'normal',
                    fontSize: 16
                }
            },
            tooltip: {
                show: false,
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            legend: {
                show: true,
                orient: 'horizontal',
                top: '0%',
                data: ['已预订', '未预订']
            },
            series: [{
                type: 'pie',
                radius: ['25%', '60%'],
                color: ['#59ADF3', '#AF89D6'],
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{d}%',

                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontSize: 16
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: data
            }, {
                type: 'pie',
                radius: ['60%', '90%'],
                itemStyle: {
                    normal: {
                        color: '#EEEEEE'
                    },
                    emphasis: {
                        color: '#ADADAD'
                    }
                },
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{c}场',
                        textStyle: {
                            color: '#333333',
                            fontWeight: 'bold',
                            fontSize: 16
                        }
                    }
                },
                data: data
            }]
        };

        myChart.setOption(option);
    </script>
    <script>
        var myChart2 = echarts.init(document.getElementById('data_echarts2'));

        var option2 = {
            backgroundColor: "#faf6f3",
            color: ['#59ADF3', '#AF89D6'],
            tooltip : {
                show: false,
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                show: true,
                data:['教师', '学生']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [{
                type : 'category',
                data : ["${fn:replace(compareWeek, '星期', '上周')}", '今日'],
                axisLabel: {
                    textStyle: {
                        fontSize: 16
                    }
                }
            }],
            yAxis : [{
                type : 'value'
            }],
            series : [{
                name:'教师',
                type:'bar',
                data:[${compareSignCount.signTeacherCount}, ${todaySignCount.signTeacherCount}]
            }, {
                name:'学生',
                type:'bar',
                data:[${compareSignCount.signStudentCount}, ${todaySignCount.signStudentCount}]
            }]
        };
        myChart2.setOption(option2);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-form-preview">
            <div class="weui-form-preview__bd">
                <table>
                    <thead>
                    <tr>
                        <th>营业时间</th>
                        <th>总场次</th>
                        <th>空场次</th>
                        <th>利用率</th>
                        <th>${fn:replace(compareWeek, '星期', '上周')}</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${parkBusiness.businessStartTime}-${parkBusiness.businessEndTime}</td>
                        <td>${todaySiteCount.sumSiteCount}场</td>
                        <td>${todaySiteCount.emptySiteCount}场</td>
                        <td>${todaySiteCount.useRate}%</td>
                        <c:if test="${todaySiteCount.useRate < compareSiteCount.useRate}">
                            <td style="color: #F43530;">减少${compareSiteCount.useRate - todaySiteCount.useRate}%</td>
                        </c:if>
                        <c:if test="${todaySiteCount.useRate > compareSiteCount.useRate}">
                            <td style="color: #1AAD19;">增加${todaySiteCount.useRate - compareSiteCount.useRate}%</td>
                        </c:if>
                        <c:if test="${todaySiteCount.useRate == compareSiteCount.useRate}">
                            <td>相同</td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts1" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
                <table>
                    <tbody>
                    <tr>
                        <th>教师</th>
                        <td>${todaySignCount.signTeacherCount}人</td>
                        <c:if test="${todaySignCount.signTeacherCount < compareSignCount.signTeacherCount}">
                            <td style="color: #F43530;">同比减少${compareSignCount.signTeacherCount - todaySignCount.signTeacherCount}人</td>
                        </c:if>
                        <c:if test="${todaySignCount.signTeacherCount > compareSignCount.signTeacherCount}">
                            <td style="color: #1AAD19;">同比增加${todaySignCount.signTeacherCount - compareSignCount.signTeacherCount}人</td>
                        </c:if>
                        <c:if test="${todaySignCount.signTeacherCount == compareSignCount.signTeacherCount}">
                            <td>同比人数相同</td>
                        </c:if>
                    </tr>
                    <tr>
                        <th>学生</th>
                        <td>${todaySignCount.signStudentCount}人</td>
                        <c:if test="${todaySignCount.signStudentCount < compareSignCount.signStudentCount}">
                            <td style="color: #F43530;">同比减少${compareSignCount.signStudentCount - todaySignCount.signStudentCount}人</td>
                        </c:if>
                        <c:if test="${todaySignCount.signStudentCount > compareSignCount.signStudentCount}">
                            <td style="color: #1AAD19;">同比增加${todaySignCount.signStudentCount - compareSignCount.signStudentCount}人</td>
                        </c:if>
                        <c:if test="${todaySignCount.signStudentCount == compareSignCount.signStudentCount}">
                            <td>同比人数相同</td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts2" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
            </div>
            <div class="weui-form-preview__ft sport-list">
                <c:forEach var="sport" items="${siteSportNames}">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary sport-type"
                       href="/business/data/venuePercentage?sportId=${sport.sportId}"
                       data-id="${sport.sportId}">${sport.sportName}</a>
                </c:forEach>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地使用率"/>
</c:import>
