<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
  </head>
  
  <body>
  <hr/>
  <div>
  	接口功能：
  	<input type="button" value="注册/修改会员" onclick="method('memberInfo', 'member/saveMember.do', this)" id="first" />
  	<input type="button" value="会员卡充值" onclick="method('memberCz', 'member/saveMemberCar.do', this)" />
  	<input type="button" value="获取会员卡类型列表" onclick="method('memberTypes', 'member/getMemberCarTypes.do', this)" />
  	<input type="button" value="获取单个会员卡类型" onclick="method('memberType', 'member/getMemberCarType.do', this)" />
  	<input type="button" value="注册会员--打印发票" onclick="method('invoice', 'member/saveInvoice.do', this)" />
  	<input type="button" value="获取会员列表" onclick="method('members', 'member/getUserMembers.do', this)" />
  	<input type="button" value="获取单个会员" onclick="method('memberAndCard', 'member/getMemberAndCard.do', this)" />
  	<input type="button" value="增加会员卡类型" onclick="method('addMemberCardType', 'member/saveMemberCardType.do', this)" />
  	<input type="button" value="升级会员卡" onclick="method('memberCardUpLevel', 'member/memberCardUpLevel.do', this)" />
  	<input type="button" value="充值会员卡" onclick="method('memberCardCZ', 'member/memberCardCZ.do', this)" />
  	<input type="button" value="补办会员卡" onclick="method('memberCardBuBan', 'member/memberCardBuBan.do', this)" /><br/><br/> 
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<input type="button" value="流水日志(充值/消费)" onclick="method('getBalances', 'member/getBalances.do', this)" />
  	<input type="button" value="获取发票列表" onclick="method('getInvoices', 'member/getInvoices.do', this)" />
  	<input type="button" value="领取发票" onclick="method('updateGetInvoices', 'member/updateGetInvoices.do', this)" />
  </div>
  <hr/>
  <div>
  	接口名：<span id="methodName"></span><br/>
          方法名：<input style="width: 251px; border: 1px solid;" type="text" id="method" value="member/saveMember.do" readonly disabled />
    <input type="button" value="提交" onclick="request()" />
     
     <br/>
     <hr/>  
     <div id="result"></div>
     <hr/>   &nbsp;&nbsp;&nbsp;
         请求参数示例：
          
<!-- 注册会员 -->
<textarea rows="15" cols="50" data-id="memberInfo">
{
   "memberId": null,
   "memberName": "会员名称", 
   "memberMobile": "15110275787", 
   "memberMobile2": "15111111111", 
   "memberIdcard": "510603199007307957", 
   "memberSex": 2, 
   "memberBirthday": "1990-07-30", 
   "memberAddress": "四川德阳", 
   "memberRemark": "备注",
   "salesId": 1
}
</textarea>

<div data-id="memberInfo" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberId</td>
			<td>会员id（传此参数为修改）</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>会员名称</td>
		</tr>
		<tr>
			<td>memberMobile</td>
			<td>会员手机</td>
		</tr>
		<tr>
			<td>memberMobile2</td>
			<td>会员备用手机号</td>
		</tr>
		<tr>
			<td>memberIdcard</td>
			<td>会员身份证号</td>
		</tr>
		<tr>
			<td>memberSex</td>
			<td>会员性别</td>
		</tr>
		<tr>
			<td>memberBirthday</td>
			<td>会员生日</td>
		</tr>
		<tr>
			<td>memberAddress</td>
			<td>会员联系地址</td>
		</tr>
		<tr>
			<td>memberRemark</td>
			<td>备注</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 会员卡充值 -->
<textarea rows="15" cols="50" data-id="memberCz">
{
   "memberId": 1,
   "cardTypeId": "1", 
   "cardBalance": 200,
   "oldAmount": 1000,
   "realAmount": 990,
   "subAmount": 10,
   "balanceStyle": 2,
   "salesId": 1
}
</textarea>

<div data-id="memberCz" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberId</td>
			<td>会员id</td>
		</tr>
		<tr>
			<td>cardTypeId</td>
			<td>会员卡类型</td>
		</tr>
		<tr>
			<td>cardBalance</td>
			<td>价格（元）</td>
		</tr>
		<tr>
			<td>oldAmount</td>
			<td>充值金额</td>
		</tr>
		<tr>
			<td>realAmount</td>
			<td>合计金额</td>
		</tr>
		<tr>
			<td>subAmount</td>
			<td>优惠金额</td>
		</tr>
		<tr>
			<td>balanceStyle</td>
			<td>支付方式（1：支付宝  2：微信）</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 会员卡类型列表 -->
<textarea rows="15" cols="50" data-id="memberTypes">
{
   
}
</textarea>

<!-- 单个会员卡类型信息-->
<textarea rows="15" cols="50" data-id="memberType">
{
   "cardTypeId": "2"
}
</textarea>

<div data-id="memberType" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardTypeId</td>
			<td>会员卡类型</td>
		</tr>
	</table>
</div>

<!-- 注册会员-发票 -->
<textarea rows="15" cols="50" data-id="invoice">
{
   "invoiceServiceType": 1,
   "invoiceServiceId": 13,
   "invoiceHeader": "北京市资产雷达有限公司",
   "invoiceMoney": 500,
   "invoiceContent": "注册会员：500    本公司打印",
   "invoiceRemark": "发票备注",
   "salesId": 1
}
</textarea>

<div data-id="invoice" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>invoiceServiceType</td>
			<td>发票业务类型（这里固定传10【注册会员发票类型】）</td>
		</tr>
		<tr>
			<td>invoiceServiceId</td>
			<td>发票业务标识（这里传会员id【memberId】）</td>
		</tr>
		<tr>
			<td>invoiceHeader</td>
			<td>发票抬头	公司或者个人名称</td>
		</tr>
		<tr>
			<td>invoiceMoney</td>
			<td>发票金额</td>
		</tr>
		<tr>
			<td>invoiceContent</td>
			<td>发票内容</td>
		</tr>
		<tr>
			<td>invoiceRemark</td>
			<td>发票内容备注</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 获取会员列表 -->
<textarea rows="15" cols="50" data-id="members">
{
   "memberIdcard": "",
   "memberMobile": "",
   "cardNo": "",
   "cardTypeId": ""
}
</textarea>

<div data-id="members" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberIdcard</td>
			<td>会员身份证【条件】</td>
		</tr>
		<tr>
			<td>memberMobile</td>
			<td>会员手机【条件】</td>
		</tr>
		<tr>
			<td>cardNo</td>
			<td>会员卡号【条件】</td>
		</tr>
		<tr>
			<td>cardTypeId</td>
			<td>会员卡类型【条件】</td>
		</tr>
	</table>
</div>

<!-- 获取单个会员信息 -->
<textarea rows="15" cols="50" data-id="memberAndCard">
{
   "memberId": "21"
}
</textarea>

<div data-id="memberAndCard" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberId</td>
			<td>会员id</td>
		</tr>
	</table>
</div>

<!-- 增加会员卡类型 -->
<textarea rows="15" cols="55" data-id="addMemberCardType">
{
   "cardTypeId": null,
   "cardTypeName": "至尊卡",
   "cardTypeStatus": "1",
   "cardTypeMonth": "5",
   "cardTypeWeek": "1,2,3,4,5,6,7",
   "cardTypeTime": "8:00-12:00",
   "cardTypeMoney": "2000",
   "cardTypeCredit": "1000",
   "cardTypeDiscount": "80",
   "salesId": "1"
}
</textarea>

<div data-id="addMemberCardType" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardTypeId</td>
			<td>会员卡类型（传此参数为修改）</td>
		</tr>
		<tr>
			<td>cardTypeName</td>
			<td>会员卡名称</td>
		</tr>
		<tr>
			<td>cardTypeMonth</td>
			<td>类别周期月限制（月）	0：不限制</td>
		</tr>
		<tr>
			<td>cardTypeWeek</td>
			<td>1-7：周一~周日</td>
		</tr>
		<tr>
			<td>cardTypeMoney</td>
			<td>类别价格</td>
		</tr>
		<tr>
			<td>cardTypeCredit</td>
			<td>信用额度（可以抵账的额度）</td>
		</tr>
		<tr>
			<td>cardTypeDiscount</td>
			<td>类别折扣	0-100</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 升级会员卡 -->
<textarea rows="15" cols="55" data-id="memberCardUpLevel">
{
   "cardId": null,
   "cardTypeId": 2,
   "balanceStyle": 1,
   "upLevelMoney": 500,
   "subMoney": 100,
   "remark": "升级会员卡",
   "salesId": 1
}
</textarea>

<!-- 充值会员卡 -->
<textarea rows="15" cols="55" data-id="memberCardCZ">
{
   "cardId": null,
   "balanceStyle": 1,
   "czMoney": 5000.5,
   "subMoney": 2000.2,
   "remark": "充值会员卡5000.5，优惠2000.2",
   "salesId": 1
}
</textarea>

<!-- 补办会员卡 -->
<textarea rows="15" cols="55" data-id="memberCardBuBan">
{
   "cardId": null,
   "balanceStyle": 1,
   "buBanMoney": 500,
   "subMoney": 0,
   "remark": "补办会员卡500，未优惠",
   "salesId": 1
}
</textarea>

<!-- 流水日志(充值/消费) -->
<textarea rows="15" cols="55" data-id="getBalances">
{
   "balanceType": "1",
   "createTimeStart": "",
   "createTimeEnd": "",
   "memberMobile": "",
   "cardId": ""
}
</textarea>

<!-- 获取发票列表 -->
<textarea rows="15" cols="55" data-id="getInvoices">
{
   "status": ""
}
</textarea>

<!-- 领取发票 -->
<textarea rows="15" cols="55" data-id="updateGetInvoices">
{
   "invoiceIds": ""
}
</textarea>

         
    </div>
   <script type="text/javascript" src="<%=basePath %>js/jquery-1.8.2.min.js"></script>
   <script type="text/javascript">
    $(function(){
    	$("#first").click();
    }); 
    var paramId_;
    function method(paramId, method, obj){
    	$("#method").val(method);
    	paramId_ = paramId;
    	$("#methodName").html($(obj).val());
    	$("*[data-id]").hide();
    	$("*[data-id='"+paramId+"']").show();
    }
   	function request() {
   		$("#result").html("请求中...");
		$.post("<%=basePath%>"+$("#method").val(), {param: $("textarea[data-id='"+paramId_+"']").val()}, function(data){
			$("#result").html(JSON.stringify(data));
		}, 'json');
	}
   </script>
  </body>
</html>













