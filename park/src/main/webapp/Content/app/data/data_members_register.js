(function ($) {
    var Members_Register = {
        opts: {
            URL: '/data/getMembersRegister'
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

            this.renderMemberCountCharts();
            this.renderMemberStoredCharts();
            this.renderMemberConsumeCharts();
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
        renderMemberCountCharts: function () {
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
                    title: {
                        text: '总数量',
                        //subtext: '2016年',
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
                        formatter: "{b}<br>数量：{c}<br>比率：{d}%"
                    },
                    series: [{
                        type: 'pie',
                        selectedMode: 'single',
                        radius: ['40%', '90%'],
                        color: ['#59ADF3', '#FF999A', '#FFCC67'],

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
                        },
                        data: data
                    }]
                };
            }
            $.post('/data/getMembersRegister', {}, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var memberCount = __format(data.memberCount);

                    var chart = echarts.init(document.getElementById('member_count_chart'));
                    chart.setOption(__options(memberCount));
                }
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
        }
    };

    Members_Register.init();
})(jQuery);
