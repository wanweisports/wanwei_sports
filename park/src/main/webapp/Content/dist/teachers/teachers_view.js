!function(e){var t={init:function(){e.datetimepicker.setLocale("zh"),e("#memberBirthday").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date,maxDate:0}),e(".member-birthday-select").on("click",function(t){t.preventDefault(),e("#memberBirthday").datetimepicker("show")}),this.initEvents()},initEvents:function(){e(".save-member").on("click",function(t){t.preventDefault();var i=e("#member_form"),a=i.serialize();return!("submitting"==i.attr("submitting")||!i.valid())&&(i.attr("submitting","submitting"),void e.post("/member/saveMember",a,function(t){i.attr("submitting",""),1==t.code?(e("#tips_success_modal").modal({backdrop:!1,show:!0}),setTimeout(function(){e("#tips_success_modal").modal("hide"),location.assign("/teachers/list")},3e3)):(console.log(t.message||"教师信息保存失败, 请稍后重试"),alert(t.message||"教师信息保存失败, 请稍后重试"))}))})}};t.init()}(jQuery);