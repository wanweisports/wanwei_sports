!function(e,t){var a={opts:{URL:"/good/getGoodsStockDetails"},init:function(){this.initEvents(),e.datetimepicker.setLocale("zh"),e("#createTimeStart").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date,value:t().format("YYYY-MM-DD")}),e("#createTimeEnd").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date,value:t().format("YYYY-MM-DD")})},initEvents:function(){var a=this;e(".goods-filter").on("click",function(i){i.preventDefault();var n=e("#goods_filter_form").serialize(),o=e("#createTimeStart").val()||t().format("YYYY-MM-DD"),r=e("#createTimeEnd").val()||t().format("YYYY-MM-DD");return r<o?e.tipsWarningAlert("开始日期不能大于结束日期"):void location.assign(a.opts.URL+"?"+n)}),e(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(t){t.preventDefault();var i=location.search,n=e(this).attr("data-index");i?i.indexOf("page=")==-1?location.assign(a.opts.URL+"?"+i+"&page="+n):location.assign(a.opts.URL+"?"+i.replace(/(page=)\d+/,"$1"+n)):location.assign(a.opts.URL+"?page="+n)})}};a.init()}(jQuery,moment);