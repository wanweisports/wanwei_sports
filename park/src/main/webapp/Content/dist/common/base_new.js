!function(t,e){function n(){var n=["","星期一","星期二","星期三","星期四","星期五","星期六","星期日"],i=e();t(".top-header-date").text(i.format("今天是YYYY年MM月DD日 ")+n[i.format("e")]);t.cookie("wc-user");t.post("/passport/getUserProfile",function(e){var n=e.data;1==e.code&&(t.cookie("wc-user",JSON.stringify(n.user),{path:"/"}),t(".top-menu-username").text(n.user.operatorName))});var r=t.cookie("wc-business-time");r||t.post("/settings/getBusinessTime",function(e){var n=e.data;if(1==e.code){for(var i,r=[],o=parseInt(n.businessStartTime.replace(":00","")),a=parseInt(n.businessEndTime.replace(":00","")),s=o;s<=a;s++)i=s>=10?""+s:"0"+s,r.push(i+":00");t.cookie("wc-business-time",JSON.stringify(r),{path:"/"})}}),t.post("/office/getNotReadMessageCount",function(e){var n=e.data;1==e.code&&n.count>0?t(".unread-message-count").text(n.count).show():t(".unread-message-count").hide()})}function i(t,e){var n,i,r;try{n=t.toString().split(".")[1].length}catch(o){n=0}try{i=e.toString().split(".")[1].length}catch(o){i=0}return r=Math.pow(10,Math.max(n,i)),(t*r+e*r)/r}function r(t,e){var n,i,r,o;try{n=t.toString().split(".")[1].length}catch(a){n=0}try{i=e.toString().split(".")[1].length}catch(a){i=0}return r=Math.pow(10,Math.max(n,i)),o=n>=i?n:i,((e*r-t*r)/r).toFixed(o)}function o(t,e){var n=0,i=t.toString(),r=e.toString();try{n+=i.split(".")[1].length}catch(o){}try{n+=r.split(".")[1].length}catch(o){}return Number(i.replace(".",""))*Number(r.replace(".",""))/Math.pow(10,n)}function a(t,e){var n,i,r=0,o=0;try{r=t.toString().split(".")[1].length}catch(a){}try{o=e.toString().split(".")[1].length}catch(a){}return n=Number(t.toString().replace(".","")),i=Number(e.toString().replace(".","")),n/i*Math.pow(10,o-r)}n(),new t.TextMagnifier,t.isDebug=!0,t.logConsole=function(n,i){t.isDebug&&console.log(e().format("YYYYMMDDHHmmss -- ")+n+"："+i)},t.tipsWarningAlert=function(e){t("#tips_failure_modal").modal({show:!0,backdrop:!1}).find(".tips-content").text(e);var n=setTimeout(function(){t("#tips_failure_modal").modal("hide"),clearTimeout(n)},3e3)},t.tipsSuccessAlert=function(e,n){n||(n=new Function),t("#tips_success_modal").modal({show:!0,backdrop:!1}).find(".tips-content").text(e);var i=setTimeout(function(){t("#tips_success_modal").modal("hide"),clearTimeout(i),n()},3e3)},t.tipsSuccessConfirm=function(e){t("#tips_confirm_modal").modal({show:!0,backdrop:!1}).find(".tips-content").text(e)},t(".navigator-container").on("click",".list-nav-header",function(e){e.preventDefault();var n=t(this),i=n.attr("data-item");return!n.hasClass("active")&&(t(".navigator-container").find(".list-nav-header").removeClass("active"),n.addClass("active"),t(".navigator-container").find(".list-nav-list").hide(),void t(".navigator-container").find(".list-nav-list."+i).show())}),t.fn.serializeObject=function(){var t={};return this.serializeArray().map(function(e){t[e.name]=e.value}),t},Number.prototype.add=function(t){return i(t,this)},Number.prototype.subtract=function(t){return r(t,this)},Number.prototype.multiply=function(t){return o(t,this)},Number.prototype.divide=function(t){return a(this,t)}}(jQuery,moment);