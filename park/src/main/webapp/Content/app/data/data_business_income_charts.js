(function ($) {
    var Members_Register = {
        opts: {
            URL: '/data/getBusinessIncomeGroupByDate'
        },
        init: function () {
            this.initEvents();
            this.initChartsData();
            this.renderBusinessIncomeTypes();
            this.renderBusinessIncomeCompare();

            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#createTimeStart').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });

            $('#createTimeEnd').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });
        },
        initEvents: function () {
            var content = this;

            // 筛选库存明细列表
            $(".data-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#data_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });

            // 显示
            $(".data-chart").on("click", function (e) {
                e.preventDefault();

                if ($(".chart-show").is(":hidden")) {
                    $(".chart-show").show();
                } else {
                    $(".chart-show").hide();
                }

            });
        },
        renderBusinessIncomeCompare: function () {
            var myChart = echarts.init(document.getElementById('business_income_compare_show'));

            var option = {
                color: ['#3e6591', '#eb7d22', '#d73f45'],
                grid: {
                    left: 250
                },
                xAxis: {
                    axisLine: {
                        lineStyle: {color: '#ccc'}
                    },
                    axisLabel: {
                        textStyle: {color: '#777'}
                    }
                },
                yAxis: [{
                    inverse: true,
                    splitLine: {
                        show: true
                    },
                    axisTick: {
                        length: 100,
                        lineStyle: {color: '#ccc'}
                    },
                    axisLine: {
                        lineStyle: {color: '#ccc'}
                    },
                    data: ['-', '-', '-', '-', '-']
                }, {
                    name: '                     所属行业',
                    nameLocation: 'start',
                    nameTextStyle: {
                        fontWeight: 'bold'
                    },
                    position: 'left',
                    offset: 130,
                    axisLine: {
                        onZero: false,
                        show: false
                    },
                    axisTick: {
                        length: 70,
                        inside: true,
                        lineStyle: {color: '#ccc'}
                    },
                    axisLabel: {
                        inside: true
                    },
                    inverse: true,
                    data: ['电商', '游戏', '金融', '旅游', '直播']
                }, {
                    name: '                产品名',
                    nameLocation: 'start',
                    nameTextStyle: {
                        fontWeight: 'bold'
                    },
                    position: 'left',
                    offset: 220,
                    axisLine: {
                        onZero: false,
                        show: false
                    },
                    axisTick: {
                        length: 100,
                        inside: true,
                        lineStyle: {color: '#ccc'}
                    },
                    axisLabel: {
                        inside: true
                    },
                    inverse: true,
                    data: ['APP数据分析', 'DMP', '企业版', '移动广告鉴别', '']
                }],
                series: [{
                    type: 'bar',
                    data: [220, 182, 191, 234, 290],
                    label: {
                        normal: {
                            show: true,
                            position: 'left',
                            textStyle: {color: '#000'},
                            formatter: '合同金额',
                        }
                    }
                }, {
                    type: 'bar',
                    data: [210, 132, 91, 204, 220],
                    label: {
                        normal: {
                            show: true,
                            position: 'left',
                            textStyle: {color: '#000'},
                            formatter: '已收款',
                        }
                    }
                }, {
                    type: 'bar',
                    data: [120, 132, 131, 254, 278],
                    label: {
                        normal: {
                            show: true,
                            position: 'left',
                            textStyle: {color: '#000'},
                            formatter: '应收款',
                        }
                    }
                }, {
                    type: 'bar',
                    data: ['-', '-', '-', '-', '-'],
                    yAxisIndex: 1
                }, {
                    type: 'bar',
                    data: ['-', '-', '-', '-', '-'],
                    yAxisIndex: 2
                }]
            };

            myChart.setOption(option);
        },
        renderBusinessIncomeTypes: function () {
            var myChart = echarts.init(document.getElementById('business_income_type_show'));

            var data = [{
                value: 3661,
                name: '<10w'
            }, {
                value: 5713,
                name: '10w-50w'
            }, {
                value: 9938,
                name: '50w-100w'
            }, {
                value: 17623,
                name: '100w-500w'
            }, {
                value: 3299,
                name: '>500w'
            }];
            var option = {
                backgroundColor: '#fff',
                title: {
                    text: '营业收入',
                    subtext: '2016年',
                    x: 'center',
                    y: 'center',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 16
                    }
                },
                tooltip: {
                    show: true,
                    trigger: 'item',
                    formatter: "{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'horizontal',
                    bottom: '0%',
                    data: ['<10w', '10w-50w', '50w-100w', '100w-500w', '>500w']
                },
                series: [{
                    type: 'pie',
                    selectedMode: 'single',
                    radius: ['25%', '58%'],
                    color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#FFCC67'],

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
                    radius: ['58%', '83%'],
                    itemStyle: {
                        normal: {
                            color: '#F2F2F2'
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
                                color: '#777777',
                                fontWeight: 'bold',
                                fontSize: 14
                            }
                        }
                    },
                    data: data
                }]
            };

            myChart.setOption(option);
        },
        formatChart: function (data) {
            var xData = function() {
                var data = [];
                for (var i = 1; i < 15; i++) {
                    data.push(i + "月份");
                }
                return data;
            }();

            return {
                backgroundColor: "#344b58",
                title: {
                    text: "本年营业收支统计",
                    x: "4%",
                    textStyle: {
                        color: '#fff',
                        fontSize: '20'
                    }
                },
                tooltip: {
                    trigger: "axis",
                    axisPointer: {
                        type: "shadow",
                        textStyle: {
                            color: "#fff"
                        }
                    }
                },
                grid: {
                    borderWidth: 0,
                    top: 110,
                    bottom: 95,
                    textStyle: {
                        color: "#fff"
                    }
                },
                legend: {
                    x: '4%',
                    top: '11%',
                    textStyle: {
                        color: '#90979c'
                    },
                    data: ['会员', '场地', '商品', '平均']
                },
                calculable: true,
                xAxis: [{
                    type: "category",
                    axisLine: {
                        lineStyle: {
                            color: '#90979c'
                        }
                    },
                    splitLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    splitArea: {
                        show: false
                    },
                    axisLabel: {
                        interval: 0

                    },
                    data: xData
                }],
                yAxis: [{
                    type: "value",
                    splitLine: {
                        show: false
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#90979c'
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        interval: 0

                    },
                    splitArea: {
                        show: false
                    }

                }],
                dataZoom: [{
                    show: true,
                    height: 30,
                    xAxisIndex: [0],
                    bottom: 30,
                    start: 10,
                    end: 80,
                    handleIcon: 'path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2,1.8-4,4-4h59.8c2.2,0,4,1.8,4,4V413z',
                    handleSize: '110%',
                    handleStyle:{
                        color:"#d3dee5"

                    },
                    textStyle:{color:"#fff"},
                    borderColor:"#90979c"
                }, {
                    type: "inside",
                    show: true,
                    height: 15,
                    start: 1,
                    end: 35
                }],
                series: [{
                    name: "会员",
                    type: "bar",
                    stack: "总量",
                    barMaxWidth: 35,
                    itemStyle: {
                        normal: {
                            color: "rgba(255,144,128,1)",
                            label: {
                                show: true,
                                textStyle: {
                                    color: "#fff"
                                },
                                position: "insideTop",
                                formatter: function(p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    },
                    data: [709, 1917, 2455, 2610, 1719, 1433, 1544, 3285, 5208, 3372, 2484, 4078]
                }, {
                    name: "场地",
                    type: "bar",
                    stack: "总量",
                    itemStyle: {
                        normal: {
                            color: "rgba(0,191,183,1)",
                            barBorderRadius: 0,
                            label: {
                                show: true,
                                position: "insideTop",
                                formatter: function(p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    },
                    data: [327, 1776, 507, 1200, 800, 482, 204, 1390, 1001, 951, 381, 220]
                }, {
                    name: "商品",
                    type: "bar",
                    stack: "总量",
                    itemStyle: {
                        normal: {
                            color: "rgba(255,153,0,1)",
                            barBorderRadius: 0,
                            label: {
                                show: true,
                                position: "top",
                                formatter: function(p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    },
                    data: [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000]
                }, {
                    name: "合计",
                    type: "line",
                    stack: "总量",
                    symbolSize:10,
                    symbol:'circle',
                    itemStyle: {
                        normal: {
                            color: "rgba(252,230,48,1)",
                            barBorderRadius: 0,
                            label: {
                                show: true,
                                position: "top",
                                formatter: function(p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    },
                    data: [2036, 4693, 3962, 4810, 3519, 2915, 2748, 5675, 7209, 5323, 3865, 5298]
                }]
            };
        },
        initChartsData: function () {
            var content = this;
            var myChart = echarts.init(document.getElementById('chart_show'));
            var data = $("#data_charts").val();

            console.log(data);

            myChart.setOption(content.formatChart(data));

            myChart.on('click', function (parmas) {
                console.log(parmas);
            });
        }
    };

    Members_Register.init();
})(jQuery);
