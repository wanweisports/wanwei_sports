!function(e){var t={opts:{URL:"/data/getBusinessIncomeLog"},init:function(){this.initEvents(),e.datetimepicker.setLocale("zh"),e("#createTimeStart").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date}),e("#createTimeEnd").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date})},initEvents:function(){var t=this;e(".data-filter").on("click",function(a){a.preventDefault();var i=e("#data_form").serialize();location.assign(t.opts.URL+"?"+i)}),e(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(t){t.preventDefault();var a=location.search;a?a.indexOf("page=")==-1?location.assign(location.href+"&page="+e(this).attr("data-index")):location.assign(location.href.replace(/page=\d+/,"")+"&page="+e(this).attr("data-index")):location.assign("/data/getBusinessIncomeLog?page="+e(this).attr("data-index"))})}};t.init()}(jQuery);