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
            value: 3660,
            name: '场地预订'
        }, {
            value: 1243,
            name: '商品销售'
        }, {
            value: 9930,
            name: '会员储值'
        }];
        var option = {
            backgroundColor: "#faf6f3",
            title: {
                text: '营业收入',
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
                data: ['场地预订', '商品销售', '会员储值']
            },
            series: [{
                type: 'pie',
                radius: ['25%', '60%'],
                color: ['#59ADF3', '#AF89D6', '#EC7D31'],
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{d}%',

                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontSize: 14
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
                        formatter: '{c}元',
                        textStyle: {
                            color: '#333333',
                            fontWeight: 'bold',
                            fontSize: 14
                        }
                    }
                },
                data: data
            }]
        };

        myChart.setOption(option);
    </script>

    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart2 = echarts.init(document.getElementById('data_echarts2'));

        var data2 = [{
            value: 3966,
            name: '现金'
        }, {
            value: 1966,
            name: '支付宝'
        }, {
            value: 966,
            name: '微信'
        }, {
            value: 4966,
            name: '银联'
        }, {
            value: 2966,
            name: '支票'
        }];
        var option2 = {
            backgroundColor: "#faf6f3",
            title: {
                text: '营业收入',
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
                data: ['现金', '支付宝', '微信', '银联', '支票']
            },
            series: [{
                type: 'pie',
                radius: ['25%', '60%'],
                color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#EC7D31'],
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{d}%',

                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontSize: 14
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: data2
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
                        formatter: '{c}元',
                        textStyle: {
                            color: '#333333',
                            fontWeight: 'bold',
                            fontSize: 14
                        }
                    }
                },
                data: data2
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
                        <div class="title">总收入</div>
                        <div class="money">￥14833元</div>
                    </div>
                    <div class="weui-flex__item field-block__item">
                        <div class="title">财务核对(无误)</div>
                        <div class="money">￥14833元</div>
                    </div>
                </div>
                <div class="weui-flex field-block">
                    <div class="weui-flex__item field-block__item" style="background: #59ADF3;">
                        <div class="title">场地预订</div>
                        <div class="money">￥3660元</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #EC7D31;">
                        <div class="title">会员储值</div>
                        <div class="money">￥9930元</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #AF89D6;">
                        <div class="title">商品销售</div>
                        <div class="money">￥1243元</div>
                    </div>
                </div>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts1" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
                <div class="weui-flex field-block">
                    <div class="weui-flex__item field-block__item" style="background: #86D560;">
                        <div class="title">现金</div>
                        <div class="money">￥3966元</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #AF89D6;">
                        <div class="title">支付宝</div>
                        <div class="money">￥1966元</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #59ADF3;">
                        <div class="title">微信</div>
                        <div class="money">￥966元</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #FF999A;">
                        <div class="title">银联</div>
                        <div class="money">￥4966元</div>
                    </div>
                    <div class="weui-flex__item field-block__item" style="background: #EC7D31;">
                        <div class="title">支票</div>
                        <div class="money">￥2966元</div>
                    </div>
                </div>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts2" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">今日营业数据</a>
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="/business/data/incomeCompare">历史数据对比</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地收支"/>
</c:import>
