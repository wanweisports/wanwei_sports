<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML content "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>请求接口测试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="Content/lib/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="Content/style/home/index.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <hr/>
  <div>
  	接口功能：
  	Ajax:
  	<input type="button" value="增加/修改场地类型" onclick="method('saveSiteSport', 'site/saveSiteSport.do', this)" id="first" />
  	<input type="button" value="增加/修改场地" onclick="method('saveSiteInfo', 'site/saveSiteInfo.do', this)" />
  	<input type="button" value="获取场地名称列表" onclick="method('getSiteNames', 'site/getSiteNames.do', this)" />
  	<input type="button" value="获取单个场地" onclick="method('getSiteInfo', 'site/getSiteInfo.do', this)" />
  	<input type="button" value="获取单个场地类型" onclick="method('getSiteSport', 'site/getSiteSport.do', this)" />

  </div>
  <hr/>
  <div>
  	接口名：<span id="methodName"></span><br/>
          方法名：<input style="width: 251px; border: 1px solid;" type="text" id="method" value="site/saveSiteSport.do" readonly disabled />
    <input type="button" value="提交" onclick="request()" />
     
     <br/>
     <hr/>  
     <div id="result"></div>
     <hr/>   &nbsp;&nbsp;&nbsp;
         请求参数示例：
          
<!-- 增加/修改场地类型 -->
<textarea rows="15" cols="50" data-id="saveSiteSport">
{
   "sportId": null,	
   "sportName": "场地类型名称", 
   "sportMoney": 90,
   "sportDeposit": 10000, 
   "startTime": "8:00", 
   "endTime": "16:30"
}
</textarea>

<div data-id="saveSiteSport" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>sportId</td>
			<td>场地类型id（传此参数为修改）</td>
		</tr>
		<tr>
			<td>sportName</td>
			<td>场地类型名称</td>
		</tr>
		<tr>
			<td>sportMoney</td>
			<td>单价/小时</td>
		</tr>
		<tr>
			<td>sportDeposit</td>
			<td>类型预订押金	元</td>
		</tr>
		<tr>
			<td>startTime</td>
			<td>开始时间</td>
		</tr>
		<tr>
			<td>endTime</td>
			<td>结束时间</td>
		</tr>
	</table>
</div>

<!-- 增加/修改场地 -->
<textarea rows="15" cols="50" data-id="saveSiteInfo">
{
   "siteId": null,
   "siteName": "场地名称", 
   "siteRemark": "场地备注",
   "siteType": 1
}
</textarea>

<div data-id="saveSiteInfo" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>siteId</td>
			<td>场地id（传此参数为修改）</td>
		</tr>
		<tr>
			<td>siteName</td>
			<td>场地类型名称</td>
		</tr>
		<tr>
			<td>siteRemark</td>
			<td>场地备注</td>
		</tr>
		<tr>
			<td>siteType</td>
			<td>场地类型id</td>
		</tr>
	</table>
</div>


<!-- 获取场地名称列表 -->
<textarea rows="15" cols="50" data-id="getSiteNames">
{

}
</textarea>

<div data-id="getSiteNames" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
	</table>
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>siteId</td>
			<td>场地id</td>
		</tr>
		<tr>
			<td>siteName</td>
			<td>场地类型名称</td>
		</tr>
	</table>
</div>

<!-- 获取单个场地 -->
<textarea rows="15" cols="50" data-id="getSiteInfo">
{
	"siteId": 1
}
</textarea>

<div data-id="getSiteInfo" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>siteId</td>
			<td>场地id</td>
		</tr>
	</table>
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>siteId</td>
			<td>场地id</td>
		</tr>
		<tr>
			<td>siteName</td>
			<td>场地类型名称</td>
		</tr>
		<tr>
			<td>siteName</td>
			<td>场地类型名称</td>
		</tr>
		<tr>
			<td>siteRemark</td>
			<td>场地备注</td>
		</tr>
	</table>
</div>


<!-- 获取单个场地类型 -->
<textarea rows="15" cols="50" data-id="getSiteSport">
{
	"sportId": 1
}
</textarea>

<div data-id="getSiteSport" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>sportId</td>
			<td>场地类型id</td>
		</tr>
	</table>
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>sportId</td>
			<td>场地类型id</td>
		</tr>
		<tr>
			<td>siteName</td>
			<td>场地类型名称</td>
		</tr>
		<tr>
			<td>sportMoney</td>
			<td>类型价格，单价	元</td>
		</tr>
		<tr>
			<td>sportDeposit</td>
			<td>类型预订押金	元</td>
		</tr>
		<tr>
			<td>startTime</td>
			<td>开始时间（如8:00）</td>
		</tr>
		<tr>
			<td>endTime</td>
			<td>结束时间（如16:30）</td>
		</tr>
	</table>
</div>

    </div>
    
    <script src="Content/lib/jquery/jquery-1.12.3.min.js"></script>
<script src="Content/lib/bootstrap/bootstrap.min.js"></script>
   <script type="text/javascript">
    $(function(){
    	$("#first").click();
    }); 
    var paramId_;
    var flag = false;
    function method(paramId, method, obj, f){
    	$("#method").val(method);
    	paramId_ = paramId;
    	$("#methodName").html($(obj).val());
    	$("*[data-id]").hide();
    	$("*[data-id='"+paramId+"']").show();
    	flag = f;
    }
   	function request() {
   		$("#result").html("请求中...");
   		if(!flag){
			$.post($("#method").val(), {param: $("textarea[data-id='"+paramId_+"']").val()}, function(data){
				$("#result").html(JSON.stringify(data));
			}, 'json');
		}else{
			requestHtml();
		}
	}
	
	function requestHtml() {
   		$("#result").html("请求中...");
		$.post($("#method").val(), $.parseJSON($("textarea[data-id='"+paramId_+"']").val()), function(data){
			$("#result").html(data);
		}, 'html');
	}
   </script>
  </body>
</html>













