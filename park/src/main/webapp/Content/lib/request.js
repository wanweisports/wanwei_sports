$.requestHttp = function(method, form, callback){
	//var jsonStr = JSON.stringify($(form).serializeObject());
	//$.post(method, {param: jsonStr}, callback, 'json');
	$.post(method, $(form).serialize(), callback, 'json');
}

//将form表单数据序列化为json
$.fn.serializeObject = function(){
    var data = {};
    this.serializeArray().map(function(x){data[x.name] = x.value;});
    return data;
}