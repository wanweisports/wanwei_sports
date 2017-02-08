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

            //this.renderMemberCountCharts();
            this.renderMemberStoredCharts();
            this.renderMemberConsumeCharts();
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
        renderMemberStoredCharts: function () {
            function __format(memberCount) {
                var data = [];

                for (var i = 0; i < memberCount.length; i++) {
                    data.push({
                        name: memberCount[i].cardTypeName,
                        value: memberCount[i].cardTypeTotal
                    });
                }

                return data;
            }

            function __options(data) {
                return  {
                    backgroundColor: '#FFFFFF',
                    color: ['#59ADF3', '#FF999A', '#FFCC67'],
                    tooltip: {
                        trigger: 'item',
                        formatter: '{b}:{c}元'
                    },
                    grid: {
                        left: 60,
                        top: 10
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
                            formatter: '{value}元'
                        }
                    },
                    series: [{
                        type: 'bar',
                        data: [36, 20, 24],
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
                                formatter: '{c}元'
                            }
                        }
                    }]
                };
            }
            $.post('/data/getMembersRegister', {}, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var memberCount = __format(data.memberCount);

                    var chart = echarts.init(document.getElementById('member_stored_chart'));
                    chart.setOption(__options(memberCount));
                }
            });
        },
        renderMemberConsumeCharts: function () {
            function __format(memberCount) {
                var data = [];

                for (var i = 0; i < memberCount.length; i++) {
                    data.push({
                        name: memberCount[i].cardTypeName,
                        value: memberCount[i].cardTypeTotal
                    });
                }

                return data;
            }

            function __options(data) {
                return  {
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
                                {value: 300, name: '场租'},
                                {value: 600, name: '商品'},
                                {value: 200, name: '余额'}
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
            }

            $.post('/data/getMembersRegister', {}, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var memberCount = __format(data.memberCount);

                    var chart = echarts.init(document.getElementById('member_consume_chart'));
                    chart.setOption(__options(memberCount));
                }
            });
        },
        renderMemberCountCharts: function (weeks, total, WEEKS) {
            var seriesData = [];

            function __formatBar(data) {
                var series = [];
                for (var i = 0; i < data.length; i++) {
                    var item = {
                        name: data[i].cardTypeName,
                        type: 'bar',
                        data: [data[i].Monday, data[i].Tuesday, data[i].Wednesday,
                            data[i].Thursday, data[i].Friday, data[i].Saturday, data[i].Sunday],
                        stack: '数量',
                        barMaxWidth: '40px',
                        label: {
                            normal: {
                                show: true,
                                position: 'insideTop',
                                formatter: '{c}'
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
                for (var i = 0; i < data.length; i++) {
                    var item = {
                        name: "合计",
                        type: "line",
                        data: [data[i].Monday, data[i].Tuesday, data[i].Wednesday,
                            data[i].Thursday, data[i].Friday, data[i].Saturday, data[i].Sunday],
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

            seriesData = seriesData.concat(__formatBar(weeks));
            seriesData = seriesData.concat(__formatLine(total));
            console.log(seriesData);

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
                    data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
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
        getDataMembersCount: function () {
            var content = this;
            var $memberCount = $(".data-members-count");

            $.post('/data/getMembersCountData', {}, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var weeks = data.weeks;
                    for (var i = 0; i < weeks.length; i++) {
                        $memberCount.append(content.opts.TPL(weeks[i]));
                    }

                    var total = data.total;
                    for (var j = 0; j < total.length; j++) {
                        $memberCount.append(content.opts.TPL(total[j]));
                    }

                    content.renderMemberCountCharts(weeks, total, data.WEEKS);
                    $memberCount.find("tr:last-child").addClass("bg-success");
                }
            });
        }
    };

    Members_Register.init();
})(jQuery);
