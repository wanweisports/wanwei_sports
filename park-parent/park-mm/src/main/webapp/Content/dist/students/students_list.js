!function(t){var n={opts:{URL:"/students/list"},init:function(){this.initEvents()},initEvents:function(){var n=this;t(".student-filter").on("click",function(e){e.preventDefault();var i=t("#student_filter_form").serialize();location.assign(n.opts.URL+"?"+i)}),t(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(e){e.preventDefault();var i=location.search,s=t(this).attr("data-index");i?i.indexOf("page=")==-1?location.assign(n.opts.URL+"?"+i+"&page="+s):location.assign(n.opts.URL+"?"+i.replace(/(page=)\d+/,"$1"+s)):location.assign(n.opts.URL+"?page="+s)}),t(".students-list").on("click",".students-refresh",function(){var n=t(this);t("#refresh_cardId").val(n.attr("data-cardId")),t("#refresh_cardNo").val(n.attr("data-cardNo")),t.post("/students/getNewCardNo",function(n){var e=n.data;1==n.code?t("#refresh_newNo").val(e.newCardNo):(t.logConsole("新会员卡号生成失败",n.message),t.tipsWarningAlert("新会员卡号生成失败"))})}),t(".confirm-refresh").on("click",function(n){n.preventDefault();var e=t(this).button("loading"),i=t("#refresh_form"),s=i.serialize();return""===t("#refresh_cardId").val()?(alert("请先选择会员卡"),!1):!("submitting"==i.attr("submitting")||!i.valid())&&(i.attr("submitting","submitting"),void t.post("/students/studentCardBuBan",s,function(n){i.attr("submitting",""),1==n.code?t.tipsSuccessAlert("学生卡补办成功！",function(){location.reload()}):(t.logConsole("学生卡补办失败",n.message),t.tipsWarningAlert("学生卡补办失败")),e.button("reset")}))}),t(".students-list").on("click",".students-delete",function(){var n=t(this);t("#delete_studentId").val(n.attr("data-id")),t("#delete_modal").modal({backdrop:!1,show:!0})}),t(".confirm-delete").on("click",function(n){n.preventDefault();var e=t("#delete_studentId").val();t.post("/students/lockStudent",{studentId:e},function(n){1==n.code?location.reload():(t.logConsole("学生删除失败",n.message),t.tipsWarningAlert("学生删除失败"))})}),t(".students-list").on("click",".students-sign",function(n){var e=t(this);t("#sign_card_no").val(e.attr("data-cardNo")),t("#sign_student").val(e.attr("data-student"))}),t(".confirm-sign").on("click",function(n){n.preventDefault();var e=t(this).button("loading"),i=t("#sign_form"),s=i.serialize();return!("submitting"==i.attr("submitting")||!i.valid())&&(i.attr("submitting","submitting"),void t.post("/students/studentSign",s,function(n){i.attr("submitting",""),1==n.code?t.tipsSuccessAlert("学生签到成功！",function(){location.reload()}):(t.logConsole("学生签到失败",n.message),t.tipsWarningAlert("学生签到失败")),e.button("reset")}))})}};n.init()}(jQuery);