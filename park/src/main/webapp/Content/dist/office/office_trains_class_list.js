!function(a,e){var t={opts:{URL:"/office/getTrainsClassList"},init:function(){this.initEvents(),a.datetimepicker.setLocale("zh"),a("#start_date").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date,minDate:0}),a(".class-start-select").on("click",function(e){e.preventDefault(),a("#start_date").datetimepicker("show")}),a("#end_date").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date,minDate:0}),a(".class-end-select").on("click",function(e){e.preventDefault(),a("#end_date").datetimepicker("show")})},initEvents:function(){function e(e){a("#add_class_modal").find("#class_id").val(e.id||""),a("#add_class_modal").find("#class_name").val(e.className||""),a("#add_class_modal").find("#course_name").val(e.courseId||""),a("#add_class_modal").find("#class_desc").val(e.classRemark||""),a("#add_class_modal").find("#start_date").val(e.startTime||""),a("#add_class_modal").find("#end_date").val(e.endTime||""),a("#add_class_modal").find("#leader_teacher").val(e.leaderName||""),a("#add_class_modal").find("#contact_phone").val(e.leaderMobile||""),a("#add_class_modal").find("#class_price").val(e.classPrice||"0")}var t=this;a(".trains-filter").on("click",function(e){e.preventDefault();var s=a("#trains_filter_form").serialize();location.assign(t.opts.URL+"?"+s)}),a(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(e){e.preventDefault();var s=location.search,i=a(this).attr("data-index");s?s.indexOf("page=")==-1?location.assign(t.opts.URL+"?"+s+"&page="+i):location.assign(t.opts.URL+"?"+s.replace(/(page=)\d+/,"$1"+i)):location.assign(t.opts.URL+"?page="+i)}),a(".class-list").on("click",".class-view",function(t){t.preventDefault();var s=a(this).attr("data-id");a.post("office/viewTrainsClassInfo",{classId:s},function(a){var t=a.data;1==a.code?e(t):(console.log(a.message||"查询班级详情失败, 请稍后重试"),alert(a.message||"查询班级详情失败, 请稍后重试"))})}),a(".class-list").on("click",".class-delete",function(e){e.preventDefault();var t=a(this).attr("data-id");a.post("office/deleteTrainsClassInfo",{classId:t},function(a){1==a.code?location.reload():(console.log(a.message||"删除班级详情失败, 请稍后重试"),alert(a.message||"删除班级详情失败, 请稍后重试"))})}),a(".class-add").on("click",function(a){a.preventDefault(),e({})}),a(".class-confirm").on("click",function(e){e.preventDefault();var t=a("#class_form"),s=t.serialize();return!("submitting"===t.attr("submitting")||!t.valid())&&(t.attr("submitting","submitting"),void a.post("office/saveTrainsClassInfo",s,function(a){t.attr("submitting",""),1==a.code?location.reload():alert(a.message||"班级信息保存失败, 请稍后重试")}))})}};t.init()}(jQuery,moment);