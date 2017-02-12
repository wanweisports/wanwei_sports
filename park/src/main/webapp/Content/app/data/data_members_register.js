(function ($) {
    var Members_Register = {
        opts: {
            URL: '/data/getMembersRegister',
            TPL: function (data) {
                return ('<tr><td>#CARD_TYPE_NAME#</td><td>#ALL_WEEKS#</td>' +
                    '<td>#MONDAY#</td><td>#TUESDAY#</td><td>#WEDNESDAY#</td>' +
                    '<td>#THURSDAY#</td><td>#FRIDAY#</td><td>#SATURDAY#</td><td>#SUNDAY#</td></tr>')
                        .replace('#CARD_TYPE_NAME#', data.cardTypeName)
                        .replace('#ALL_WEEKS#', data.allWeek)
                        .replace('#MONDAY#', data.Monday)
                        .replace('#TUESDAY#', data.Tuesday)
                        .replace('#WEDNESDAY#', data.Wednesday)
                        .replace('#THURSDAY#', data.Thursday)
                        .replace('#FRIDAY#', data.Friday)
                        .replace('#SATURDAY#', data.Saturday)
                        .replace('#SUNDAY#', data.Sunday);
            },
            conditions: {
                countNum: $("#count_num").val()
            }
        },
        init: function () {
            this.initEvents();

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

            this.getDataMembersStored();
            this.getDataMembersConsumed();
            this.getDataMembersCount();
        },
        initEvents: function () {
            var content = this;

            // 筛选库存明细列表
            $(".data-filter").on("click", function (e) {
                e.preventDefault();

                var conditions = $("#data_form").serialize();

                location.assign(content.opts.URL + '?' + conditions);
            });
        },
        renderMemberStoredCharts: function (title, list) {
            var seriesData = [];

            function __formatBar(data) {
                var series = [];
                for (var i = 0; i < data.length - 1; i++) {
                    data[i].data.splice(0, 0, data[i].realAmountSum);
                    var item = {
                        name: data[i].cardTypeName,
                        type: 'bar',
                        data: data[i].data,
                        stack: '数量',
                        barMaxWidth: '40px',
                        label: {
                            normal: {
                                show: false,
                                position: 'insideTop',
                                formatter: function (p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    };
                    if (i == (data.length - 1)) {
                        item.label.normal.position = "top";
                    }
                    series.push(item);
                }

                return series;
            }

            function __formatLine(data) {
                var series = [];
                for (var i = data.length - 1; i < data.length; i++) {
                    data[i].data.splice(0, 0, data[i].realAmountSum);
                    var item = {
                        name: data[i].cardTypeName,
                        type: "line",
                        data: data[i].data,
                        stack: "数量",
                        symbolSize: 10,
                        symbol: 'circle',
                        itemStyle: {
                            normal: {
                                barBorderRadius: 0,
                                label: {
                                    show: true,
                                    position: "top",
                                    formatter: function (p) {
                                        return p.value > 0 ? (p.value) : '';
                                    }
                                }
                            }
                        }
                    };
                    series.push(item);
                }

                return series;
            }

            seriesData = seriesData.concat(__formatBar(list));
            seriesData = seriesData.concat(__formatLine(list));

            var options = {
                backgroundColor: '#FFFFFF',
                color: ['#59ADF3', '#FF999A', '#FFCC67', '#44CC67'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {
                        type : 'shadow'
                    }
                },
                grid: {
                    left: 80,
                    top: 30
                },
                xAxis: {
                    type: 'category',
                    data: title,
                    axisLine: {
                        onZero: false,
                        lineStyle: {
                            width: 3
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        margin: 10,
                        textStyle: {
                            fontWeight: 'bold'
                        }
                    },
                    offset: 1
                },
                yAxis: {
                    type: 'value'
                },
                series: seriesData
            };

            var chart = echarts.init(document.getElementById('member_stored_chart'));
            chart.setOption(options);
        },
        renderMemberStoredCompareCharts: function (current, previous) {
            function __options() {
                return  {
                    backgroundColor: '#FFFFFF',
                    color: ['#59ADF3', '#FF999A', '#FFCC67'],
                    tooltip: {
                        trigger: 'item',
                        formatter: '{b}:{c}'
                    },
                    grid: {
                        left: 60,
                        top: 20
                    },
                    xAxis: {
                        type: 'category',
                        data: ["最高", "同比", "当前"],
                        axisLine: {
                            onZero: false,
                            lineStyle: {
                                width: 3
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            margin: 10,
                            textStyle: {
                                fontWeight: 'bold'
                            }
                        },
                        offset: 1
                    },
                    yAxis: {
                        type: 'value',
                        axisTick: {
                            show: false
                        },
                        nameRotate: 0,
                        axisLine: {
                            onZero: false,
                            lineStyle: {
                                width: 3
                            }
                        },
                        axisLabel: {
                            margin: 10,
                            textStyle: {
                                fontWeight: 'bold'
                            },
                            formatter: '{value}'
                        }
                    },
                    series: [{
                        type: 'bar',
                        data: [30, previous[previous.length - 1].count, current[current.length - 1].count],
                        itemStyle: {
                            normal: {
                                color: function(params) {
                                    var colorList = ['#59ADF3', '#FF999A', '#FFCC67'];
                                    return colorList[params.dataIndex]
                                }
                            }
                        },
                        barMaxWidth: '40px',
                        label: {
                            normal: {
                                show: true,
                                position: 'top',
                                formatter: '{c}'
                            }
                        }
                    }]
                };
            }

            var chart = echarts.init(document.getElementById('member_stored_compared_chart'));
            chart.setOption(__options());
        },
        getDataMembersStored: function () {
            var content = this;
            var $memberCount = $(".data-members-count");

            $.post('/data/getMembersStoredData', content.opts.conditions, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var current = data.current;
                    //var previous = data.previous;
                    content.renderMemberStoredCharts(current.titleList, current.list);
                    //content.renderMemberStoredCompareCharts(current.list, previous.list);
                    $memberCount.find("tr:last-child").addClass("bg-success");
                }
            });
        },
        renderMemberConsumedCharts: function (data) {
            var seriesData = data[data.length - 1];

            var options = {
                color: ['#59ADF3', '#FF999A', '#FFCC67'],
                tooltip : {
                    trigger: 'item',
                    formatter: "{b} <br/>金额：{c}元 <br/>比率：{d}%)"
                },
                toolbox: {
                    show: true,
                    orient: 'vertical',
                    left: 'right',
                    top: 'center',
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                series : [
                    {
                        name: '金额',
                        type: 'pie',
                        radius : '90%',
                        center: ['50%', '50%'],
                        data:[
                            {value: seriesData.siteXF, name: '场租'},
                            {value: seriesData.goodsXF, name: '商品'},
                            {value: seriesData.cardBalance, name: '余额'}
                        ],
                        label: {
                            normal: {
                                position: 'inner',
                                formatter: '{b}\n{d}%',
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
                        }
                    }
                ]
            };

            var chart = echarts.init(document.getElementById('member_consume_chart'));
            chart.setOption(options);
        },
        getDataMembersConsumed: function () {
            var content = this;
            var $memberCount = $(".data-members-count");

            $.post('/data/getMembersConsumedData', content.opts.conditions, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var current = data.current;
                    //var previous = data.previous;
                    content.renderMemberConsumedCharts(current.list);
                    //content.renderMemberCountCompareCharts(current.list, previous.list);
                    $memberCount.find("tr:last-child").addClass("bg-success");
                }
            });
        },
        renderMemberCountCharts: function (title, list) {
            var seriesData = [];

            function __formatBar(data) {
                var series = [];
                for (var i = 0; i < data.length - 1; i++) {
                    data[i].data.splice(0, 0, data[i].count);
                    var item = {
                        name: data[i].cardTypeName,
                        type: 'bar',
                        data: data[i].data,
                        stack: '数量',
                        barMaxWidth: '40px',
                        label: {
                            normal: {
                                show: false,
                                position: 'insideTop',
                                formatter: function (p) {
                                    return p.value > 0 ? (p.value) : '';
                                }
                            }
                        }
                    };
                    if (i == (data.length - 1)) {
                        item.label.normal.position = "top";
                    }
                    series.push(item);
                }

                return series;
            }

            function __formatLine(data) {
                var series = [];
                for (var i = data.length - 1; i < data.length; i++) {
                    data[i].data.splice(0, 0, data[i].count);
                    var item = {
                        name: data[i].cardTypeName,
                        type: "line",
                        data: data[i].data,
                        stack: "数量",
                        symbolSize: 10,
                        symbol: 'circle',
                        itemStyle: {
                            normal: {
                                barBorderRadius: 0,
                                label: {
                                    show: true,
                                    position: "top",
                                    formatter: function (p) {
                                        return p.value > 0 ? (p.value) : '';
                                    }
                                }
                            }
                        }
                    };
                    series.push(item);
                }

                return series;
            }

            seriesData = seriesData.concat(__formatBar(list));
            seriesData = seriesData.concat(__formatLine(list));

            var options = {
                backgroundColor: '#FFFFFF',
                color: ['#59ADF3', '#FF999A', '#FFCC67', '#44CC67'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {
                        type : 'shadow'
                    }
                },
                grid: {
                    left: 80,
                    top: 30
                },
                xAxis: {
                    type: 'category',
                    data: title,
                    axisLine: {
                        onZero: false,
                        lineStyle: {
                            width: 3
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        margin: 10,
                        textStyle: {
                            fontWeight: 'bold'
                        }
                    },
                    offset: 1
                },
                yAxis: {
                    type: 'value'
                },
                series: seriesData
            };

            var chart = echarts.init(document.getElementById('member_count_chart'));
            chart.setOption(options);
        },
        renderMemberCountCompareCharts: function (current, previous) {
            function __options() {
                return  {
                    backgroundColor: '#FFFFFF',
                    color: ['#59ADF3', '#FF999A', '#FFCC67'],
                    tooltip: {
                        trigger: 'item',
                        formatter: '{b}:{c}'
                    },
                    grid: {
                        left: 60,
                        top: 20
                    },
                    xAxis: {
                        type: 'category',
                        data: ["最高", "同比", "当前"],
                        axisLine: {
                            onZero: false,
                            lineStyle: {
                                width: 3
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            margin: 10,
                            textStyle: {
                                fontWeight: 'bold'
                            }
                        },
                        offset: 1
                    },
                    yAxis: {
                        type: 'value',
                        axisTick: {
                            show: false
                        },
                        nameRotate: 0,
                        axisLine: {
                            onZero: false,
                            lineStyle: {
                                width: 3
                            }
                        },
                        axisLabel: {
                            margin: 10,
                            textStyle: {
                                fontWeight: 'bold'
                            },
                            formatter: '{value}'
                        }
                    },
                    series: [{
                        type: 'bar',
                        data: [30, previous[previous.length - 1].count, current[current.length - 1].count],
                        itemStyle: {
                            normal: {
                                color: function(params) {
                                    var colorList = ['#59ADF3', '#FF999A', '#FFCC67'];
                                    return colorList[params.dataIndex]
                                }
                            }
                        },
                        barMaxWidth: '40px',
                        label: {
                            normal: {
                                show: true,
                                position: 'top',
                                formatter: '{c}'
                            }
                        }
                    }]
                };
            }

            var chart = echarts.init(document.getElementById('member_count_compare_chart'));
            chart.setOption(__options());
        },
        getDataMembersCount: function () {
            var content = this;
            var $memberCount = $(".data-members-count");

            $.post('/data/getMembersCountData', content.opts.conditions, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var current = data.current;
                    //var previous = data.previous;
                    content.renderMemberCountCharts(current.titleList, current.list);
                    //content.renderMemberCountCompareCharts(current.list, previous.list);
                    $memberCount.find("tr:last-child").addClass("bg-success");
                }
            });
        }
    };

    Members_Register.init();
})(jQuery);
