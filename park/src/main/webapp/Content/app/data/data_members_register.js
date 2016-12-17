(function ($) {
    var Members_Register = {
        opts: {
            URL: '/data/getMembersRegister'
        },
        init: function () {
            this.initEvents();
            this.initChartsData();

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
        formatChart: function (data) {
            return {
                tooltip : {
                    trigger: 'item'
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        magicType: {show: true, type: ['line', 'bar']}
                    }
                },
                legend: {
                    data:['会员数量', '会员金额'],
                    itemGap: 5
                },
                xAxis: [
                    {
                        type : 'category',
                        data : ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                    }
                ],
                yAxis: [
                    {
                        name: '会员数量(个)',
                        type: 'value'
                    },
                    {
                        name: '会员金额(元)',
                        type: 'value'
                    }
                ],
                series : [
                    {
                        name: '会员数量',
                        type: 'bar',
                        data: [100, 200, 300, 400, 350, 120, 400, 350, 120, 200, 300, 400]
                    },
                    {
                        name: '会员金额',
                        type: 'bar',
                        yAxisIndex: 1,
                        data: [1000, 1000, 2000, 2400, 3500, 1020, 1400, 3050, 1120, 1200, 2300, 4200]
                    }
                ]
            };
        },
        initChartsData: function () {
            var content = this;
            var myChart = echarts.init(document.getElementById('chart_show'));
            var data = $("#data_charts").val();

            console.log(data);

            myChart.setOption(content.formatChart(data));
        }
    };

    Members_Register.init();
})(jQuery);
