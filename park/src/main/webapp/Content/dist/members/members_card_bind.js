!function(e){var t={opts:{ToURL:"/member/memberList"},init:function(){e.post("/member/getMemberCarType",{cardTypeId:e('[name="cardTypeId"]').val()},function(t){var i=t.data;1==t.code?(e('[name="cardTypeMoney"]').val(i.cardTypeMoney||"0.00"),e('[name="cardDeadline"]').val(i.cardTypeMonth>0?i.cardDeadline:"无限制"),e('[name="cardDeposit"]').val(i.cardDeposit||"0.00")):(e.logConsole("会员类别详情查询失败",t.message),e.tipsWarningAlert("会员类别详情查询失败"))}),this.initEvents()},calculateMoney:function(){var t=e("#recharge_money"),i=e("#recharge_send"),n=e("#recharge_type_money"),a=e("#recharge_type_deposit"),r=parseFloat(t.val()||"0.00"),o=parseFloat(i.val()||"0.00"),c=parseFloat(n.val()),s=parseFloat(a.val());return(r+o-c-s).toFixed(2)},initEvents:function(){var t=this;e(".genxin-submit").on("click",function(t){t.preventDefault();var i=e(this).button("loading"),n=e("#member_form"),a=n.serialize();return!("submitting"==n.attr("submitting")||!n.valid())&&(n.attr("submitting","submitting"),void e.post("/member/updateMemberName",a,function(t){n.attr("submitting",""),1==t.code?e.tipsSuccessAlert("会员信息更新成功!"):(e.logConsole("会员信息更新失败",t.message),e.tipsWarningAlert("会员信息更新失败")),i.button("reset")}))}),e("#recharge_type").on("change",function(t){t.preventDefault();var i=e(this),n=e(".recharge-check-no");i.val()==n.attr("data-value")?n.show():n.hide()}),e("#recharge_money, #recharge_send").on("change",function(i){i.preventDefault(),e(".total-money").text(t.calculateMoney())}),e(".register-recahrge").on("click",function(t){t.preventDefault();var i=e(this).button("loading"),n=e("#member_card_form"),a=n.serialize();return!("submitting"==n.attr("submitting")||!n.valid())&&(n.attr("submitting","submitting"),void e.post("/member/saveMemberCar",a,function(t){n.attr("submitting",""),1==t.code?(e("#confirm_modal").modal({backdrop:!1,show:!0}),e.each(t.data,function(t,i){e("#member_card_ticket_form").find("input[name='"+t+"']").val(i)}),e("#member_card_ticket_form").find("#ticket_header").val(""),e("#member_card_ticket_form").find("#ticket_money").val(""),e("#member_card_ticket_form").find("#ticket_content").val(""),e("#member_card_ticket_form").find("#invoice_no").val(t.data.balanceNo)):(e.logConsole("会员绑卡失败",t.message),e.tipsWarningAlert("会员绑卡失败")),i.button("reset")}))}),e("#is_print_ticket").on("change",function(t){t.preventDefault();var i=e(this).prop("checked");i?e(".is-show-ticket").show():e(".is-show-ticket").hide()}),e(".print-ticket").on("click",function(i){if(i.preventDefault(),!e("#is_print_ticket").prop("checked"))return location.assign(t.opts.ToURL),e("#confirm_modal").modal("hide"),!1;var n=e(this).button("loading"),a=e("#member_card_ticket_form"),r=a.serialize();return!("submitting"==a.attr("submitting")||!a.valid())&&(a.attr("submitting","submitting"),void e.post("/member/saveInvoice",r,function(i){a.attr("submitting",""),1==i.code?(location.assign(t.opts.ToURL),e("#confirm_modal").modal("hide")):(e.logConsole("发票登记失败",i.message),e.tipsWarningAlert("发票登记失败")),n.button("reset")}))})}};t.init()}(jQuery);