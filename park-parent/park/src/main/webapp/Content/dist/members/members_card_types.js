!function(e){var t={init:function(){this.initEvents()},initEvents:function(){function t(t){var a=e("#card_type_form");e.each(t,function(e,t){a.find("input[name='"+e+"']").not(":radio").not(":checkbox").val(t),a.find("select[name='"+e+"']").not(".timeWeek").val(t)}),t.cardTypeStatus&&e("input[name='cardTypeStatus'][value='"+t.cardTypeStatus+"']").prop("checked",!0);var r=t.cardTypeTimeStart.split(","),n=t.cardTypeTimeEnd.split(","),i=0;e.each(e("input[name='cardTypeWeek']"),function(){t.cardTypeWeek.indexOf(e(this).val())>=0?(e(this).prop("checked",!0),e(this).parent().parent().find("select[name='cardTypeTimeStart']").val(r[i]),e(this).parent().parent().find("select[name='cardTypeTimeEnd']").val(n[i]),i++):e(this).prop("checked",!1)})}e(".card-type-filter").on("click",function(t){t.preventDefault();var a=e("#card_filter_form").serialize();location.assign("/member/getMemberCarTypes?"+a)}),e(".card-type-add").on("click",function(t){t.preventDefault(),e("#card_type_id").val(""),e("#card_type_name").val(""),e("#card_type_month").val(0),e("#card_type_discount").val(0),e("#card_type_money").val(0),e("#card_type_overdraw").val(0),e("#card_payment_type").val(1),e("#card_type_ahead").val(0),e("#card_deposit").val(0),e("#cardTypeStatus1").prop("checked",!0)}),e("#card_payment_type").on("change",function(t){t.preventDefault();var a=e(this).val();1==a?e(".card-type-overdraw").hide():e(".card-type-overdraw").show()}),e("#save_card_type").on("click",function(t){t.preventDefault();var a=e("#card_type_form"),r=a.serialize();return!("submitting"==a.attr("submitting")||!a.valid())&&(a.attr("submitting","submitting"),void e.post("/member/saveMemberCardType",r,function(e){a.attr("submitting",""),1==e.code?location.reload():(console.log(e.message||"会员设置保存失败, 请稍后重试"),alert(e.message||"会员设置保存失败, 请稍后重试"))}))}),e(".card-type-list").on("click",".type-item",function(a){a.preventDefault();var r=e(this).attr("data-id");e.post("member/getMemberCarType",{cardTypeId:r},function(e){1==e.code?t(e.data):(console.log(e.message||"会员卡类型信息查询失败, 请稍后重试"),alert(e.message||"会员卡类型信息查询失败, 请稍后重试"))})})}};t.init()}(jQuery);