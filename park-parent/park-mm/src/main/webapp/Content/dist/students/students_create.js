!function(t){var n={init:function(){this.initEvents()},initEvents:function(){t(".register-student").on("click",function(n){n.preventDefault();var i=t(this).button("loading"),s=t("#student_form"),e=s.serialize();return!("submitting"==s.attr("submitting")||!s.valid())&&(s.attr("submitting","submitting"),void t.post("/students/saveStudent",e,function(n){1==n.code?t.tipsSuccessAlert("学生办卡成功！",function(){location.assign("/students/list")}):(t.logConsole("学生办卡失败",n.message),t.tipsWarningAlert("学生办卡失败")),i.button("reset")}))})}};n.init()}(jQuery);