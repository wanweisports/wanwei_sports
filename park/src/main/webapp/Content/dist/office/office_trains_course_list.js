!function(e,o){var t={opts:{URL:"/office/getTrainsCourseList"},init:function(){this.initEvents()},initEvents:function(){function t(t){e("#add_course_modal").find("#course_id").val(t.id||""),e("#add_course_modal").find("#course_no").val(t.courseNo||o().format("YYYYMMDDHHmmss")),e("#add_course_modal").find("#course_name").val(t.courseName||""),e("#add_course_modal").find("#course_remark").val(t.courseRemark||""),2==t.courseStatus?e("#add_course_modal").find("#course_status2").prop("checked",!0):e("#add_course_modal").find("#course_status1").prop("checked",!0)}var a=this;e(".course-filter").on("click",function(o){o.preventDefault();var t=e("#course_filter_form").serialize();location.assign(a.opts.URL+"?"+t)}),e(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(o){o.preventDefault();var t=location.search,s=e(this).attr("data-index");t?t.indexOf("page=")==-1?location.assign(a.opts.URL+"?"+t+"&page="+s):location.assign(a.opts.URL+"?"+t.replace(/(page=)\d+/,"$1"+s)):location.assign(a.opts.URL+"?page="+s)}),e(".course-list").on("click",".course-view",function(o){o.preventDefault();var a=e(this).attr("data-id");e.post("office/viewTrainsCourseInfo",{courseId:a},function(e){var o=e.data;1==e.code?t(o):(console.log(e.message||"查询课程详情失败, 请稍后重试"),alert(e.message||"查询课程详情失败, 请稍后重试"))})}),e(".course-list").on("click",".course-delete",function(o){o.preventDefault();var t=e(this).attr("data-id");e.post("office/deleteTrainsCourseInfo",{courseId:t},function(e){e.data;1==e.code?location.reload():(console.log(e.message||"删除课程详情失败, 请稍后重试"),alert(e.message||"删除课程详情失败, 请稍后重试"))})}),e(".course-add").on("click",function(e){e.preventDefault(),t({})}),e(".course-confirm").on("click",function(o){o.preventDefault();var t=e("#course_form"),a=t.serialize();return!("submitting"===t.attr("submitting")||!t.valid())&&(t.attr("submitting","submitting"),void e.post("office/saveTrainsCourseInfo",a,function(e){t.attr("submitting",""),1==e.code?location.reload():alert(e.message||"课程信息保存失败, 请稍后重试")}))})}};t.init()}(jQuery,moment);