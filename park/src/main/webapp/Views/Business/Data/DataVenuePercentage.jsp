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

        var data = [{
            value: 16 * 10 - 4,
            name: '实际使用'
        }, {
            value: 4,
            name: '未使用'
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
                show: false,
                orient: 'horizontal',
                bottom: '0%',
                data: ['实际使用', '未使用']
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
                show: false,
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
                data : ['上周六', '本周六'],
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
                data:[30, 20]
            }, {
                name:'学生',
                type:'bar',
                data:[65, 30]
            }]
        };
        myChart2.setOption(option2);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-form-preview">
            <div class="weui-form-preview__bd">
                <div class="weui-flex field-block">
                    <div class="weui-flex__item field-block__item">
                        <div class="title">营业时间</div>
                        <div class="money">06:00-22:00</div>
                    </div>
                    <div class="weui-flex__item field-block__item">
                        <div class="title">同比上周</div>
                        <div class="money">增加10%</div>
                    </div>
                </div>
                <div class="weui-flex field-block">
                    <div class="weui-flex__item field-block__item" style="background: #59ADF3;">
                        <div class="title">总场次</div>
                        <div class="money">160场</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #AF89D6;">
                        <div class="title">空场次</div>
                        <div class="money">4场</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #EC7D31;">
                        <div class="title">利用率</div>
                        <div class="money">97.5%</div>
                    </div>
                </div>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts1" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
                <div class="weui-flex field-block">
                    <div class="weui-flex__item field-block__item" style="background: #59ADF3;">
                        <div class="title">教师</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #59ADF3;">
                        <div class="title">20人</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #EC7D31;">
                        <div class="title">同比减少10人</div>
                    </div>
                </div>
                <div class="weui-flex field-block">
                    <div class="weui-flex__item field-block__item" style="background: #AF89D6;">
                        <div class="title">学生</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #AF89D6;">
                        <div class="title">30人</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #EC7D31;">
                        <div class="title">同比减少35人</div>
                    </div>
                </div>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts2" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">羽毛球</a>
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">篮球</a>
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">乒乓球</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地使用率"/>
</c:import>
