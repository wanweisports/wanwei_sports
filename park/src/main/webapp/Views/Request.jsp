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
  	Submit:
  	<input type="button" value="获取会员卡类型列表" onclick="method('memberTypes', 'member/getMemberCarTypes.do', this, true)" />
  	<input type="button" value="获取会员列表(MemberList.jsp)" onclick="method('members', 'member/memberList.do', this, true)" />
  	<input type="button" value="流水日志列表(充值/消费)" onclick="method('getBalances', 'member/getBalances.do', this, true)" />
  	<input type="button" value="获取发票列表" onclick="method('getInvoices', 'member/getInvoices.do', this, true)" />
  	<input type="button" value="获取单个会员(MembersInfo.jsp)" onclick="method('memberAndCard', 'member/memberInfo.do', this, true)" />
  	<br/><br/> 
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	Ajax:
  	<input type="button" value="注册/修改会员(RegMember.jsp)" onclick="method('memberInfo', 'member/saveMember.do', this)" id="first" />
  	<input type="button" value="更新会员信息" onclick="method('updateMemberName', 'member/updateMemberName.do', this)" />
  	<input type="button" value="会员卡充值(办卡)(MembersInfoCar.jsp)" onclick="method('memberCz', 'member/saveMemberCar.do', this)" />
  	<input type="button" value="获取会员卡类型名称列表" onclick="method('memberTypeNames', 'member/getMemberCarTypeNames.do', this)" />
  	<input type="button" value="获取单个会员卡类型" onclick="method('memberType', 'member/getMemberCarType.do', this)" />
  	<input type="button" value="注册会员--打印发票" onclick="method('invoice', 'member/saveInvoice.do', this)" />
  	
  	<input type="button" value="增加会员卡类型" onclick="method('addMemberCardType', 'member/saveMemberCardType.do', this)" />
	<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<input type="button" value="升级会员卡" onclick="method('memberCardUpLevel', 'member/memberCardUpLevel.do', this)" />
  	<input type="button" value="充值会员卡" onclick="method('memberCardCZ', 'member/memberCardCZ.do', this)" />
  	<input type="button" value="补办会员卡" onclick="method('memberCardBuBan', 'member/memberCardBuBan.do', this)" /> 
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
   "memberType": "1",
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
			<td>memberType</td>
			<td>支付类型（1.预付类型   2.记账类型）</td>
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

<!-- 注册会员 -->
<textarea rows="15" cols="50" data-id="updateMemberName">
{
   "memberId": null,
   "memberName": "新会员名称", 
   "memberMobile": "15110275787"
}
</textarea>

<div data-id="updateMemberName" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberId</td>
			<td>会员id</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>会员名称</td>
		</tr>
		<tr>
			<td>memberMobile</td>
			<td>会员手机</td>
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
			<td>会员卡类型id</td>
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
			<td>支付方式（1：现金  2：支付宝  3：微信）</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 会员卡类型名称列表 -->
<textarea rows="15" cols="50" data-id="memberTypeNames">
{
   "cardType": "1"
}
</textarea>

<div data-id="memberTypeNames" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardType</td>
			<td>会员卡支付类型（1.预付类型   2.记账类型）</td>
		</tr>
	</table>
</div>

<!-- 会员卡类型列表-->
<textarea rows="15" cols="50" data-id="memberTypes">
{
   "cardTypeStatus": ""
}
</textarea>

<div data-id="memberTypes" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardTypeStatus</td>
			<td>类型状态	1：可用，2：锁定</td>
		</tr>
	</table>
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardTypeName</td>
			<td>会员类别</td>
		</tr>
		<tr>
			<td>cardTypeMonth</td>
			<td>会员周期</td>
		</tr>
		<tr>
			<td>cardTypeWeek</td>
			<td>每周限制（如：1,6,7）【代表周一、六、日，个数与开始时间、结束时间相同↓】</td>
		</tr>
		<tr>
			<td>cardTypeTimeStart</td>
			<td>开始时间（如：08:00,09:00,08:00）</td>
		</tr>
		<tr>
			<td>cardTypeTimeEnd</td>
			<td>结束时间（如：10:00,12:00,09:00）</td>
		</tr>
		<tr>
			<td>cardTypeDiscount</td>
			<td>会员折扣</td>
		</tr>
		<tr>
			<td>cardTypeMoney</td>
			<td>价格(元)</td>
		</tr>
		<tr>
			<td>cardTypeStatus</td>
			<td>状态（类型状态	1：可用，2：锁定）</td>
		</tr>
		<tr>
			<td>operatorName</td>
			<td>操作人</td>
		</tr>
	</table>
</div>

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
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberId</td>
			<td>序号</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>姓名</td>
		</tr>
		<tr>
			<td>memberMobile</td>
			<td>手机号码</td>
		</tr>
		<tr>
			<td>memberIdcard</td>
			<td>身份证号</td>
		</tr>
		<tr>
			<td>cardNo</td>
			<td>会员卡号</td>
		</tr>
		<tr>
			<td>cardTypeName</td>
			<td>会员类型</td>
		</tr>
		<tr>
			<td>cardDeadline</td>
			<td>有效期至</td>
		</tr>
		<tr>
			<td>cardBalance</td>
			<td>余额(元)</td>
		</tr>
		<tr>
			<td>cardStatus</td>
			<td>状态（1：有效  2：无效）</td>
		</tr>
		<tr>
			<td>cardTypeCredit</td>
			<td>信用额度		可以抵账的额度</td>
		</tr>
		<tr>
			<td>cardTypeMonth</td>
			<td>类别周期月限制（月）	0：不限制</td>
		</tr>
		<tr>
			<td>cardTypeWeek</td>
			<td>1-7：周一~周日（多个逗号分隔【也就是name值相同】）</td>
		</tr>
		<tr>
			<td>cardTypeTimeStart</td>
			<td>开始时间许可（多个逗号分隔【也就是name值相同】）</td>
		</tr>
		<tr>
			<td>cardTypeTimeEnd</td>
			<td>结束时间许可（多个逗号分隔【也就是name值相同】）</td>
		</tr>
		<tr>
			<td>cardTypeAhead</td>
			<td>可提前预订的时间</td>
		</tr>
		<tr>
			<td>cardType</td>
			<td>会员卡支付类型（1.预付类型   2.记账类型）</td>
		</tr>
		<tr>
			<td>operatorName</td>
			<td>操作人</td>
		</tr>
		<tr>
			<td>createTime</td>
			<td>注册时间</td>
		</tr>
	</table>
</div>

<!-- 注册会员-发票 -->
<textarea rows="15" cols="50" data-id="invoice">
{
   "invoiceServiceType": 10,
   "invoiceServiceId": 13,
   "invoiceHeader": "北京市资产雷达有限公司",
   "invoiceMoney": 500,
   "invoiceContent": "注册会员：500    本公司打印",
   "invoiceRemark": "发票备注",
   "invoiceState": 1
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
			<td>invoiceState</td>
			<td>打印发票（1：打印  2：不打印）</td>
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
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>memberId</td>
			<td>序号</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>姓名</td>
		</tr>
		<tr>
			<td>memberMobile</td>
			<td>手机号码</td>
		</tr>
		<tr>
			<td>memberIdcard</td>
			<td>身份证号</td>
		</tr>
		<tr>
			<td>cardNo</td>
			<td>会员卡号</td>
		</tr>
		<tr>
			<td>cardTypeName</td>
			<td>会员类型</td>
		</tr>
		<tr>
			<td>cardDeadline</td>
			<td>有效期至</td>
		</tr>
		<tr>
			<td>cardBalance</td>
			<td>余额(元)</td>
		</tr>
		<tr>
			<td>cardStatus</td>
			<td>状态（1：有效  2：无效）</td>
		</tr>
		<tr>
			<td>operatorName</td>
			<td>操作人</td>
		</tr>
		<tr>
			<td>createTime</td>
			<td>注册时间</td>
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
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td></td>
			<td>
				um.memberId, mc.cardId, um.memberName, um.memberType, um.memberSex, 
				um.memberBirthday, um.memberAddress, um.memberRemark, um.memberMobile, 
				um.memberMobile2, um.memberIdcard, mc.cardNo, mc.cardTypeId, mc.cardDeadline, 
				mc.cardBalance, mc.cardStatus, mc.salesId, DATE_FORMAT(mc.createTime,'%Y-%m-%d') createTime, 
				mct.cardTypeDiscount, mct.cardTypeWeek, mct.cardTypeTimeStart, mct.cardTypeTimeEnd, 
				mct.cardTypeName
			</td>
		</tr>
	</table>
</div>

<!-- 增加会员卡类型 -->
<textarea rows="15" cols="55" data-id="addMemberCardType">
{
   "cardTypeId": null,
   "cardTypeName": "至尊卡",
   "cardType": "2",
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
			<td>会员卡类型id（传此参数为修改）</td>
		</tr>
		<tr>
			<td>cardTypeName</td>
			<td>会员卡名称</td>
		</tr>
		<tr>
			<td>cardType</td>
			<td>会员卡支付类型（1.预付类型   2.记账类型）</td>
		</tr>
		<tr>
			<td>cardTypeStatus</td>
			<td>会员卡状态	1：可用，2：锁定</td>
		</tr>
		<tr>
			<td>cardTypeMonth</td>
			<td>类别周期月限制（月）	0：不限制</td>
		</tr>
		<tr>
			<td>cardTypeWeek</td>
			<td>1-7：周一~周日（多个逗号分隔【也就是name值相同】）</td>
		</tr>
		<tr>
			<td>cardTypeTimeStart</td>
			<td>开始时间许可（多个逗号分隔【也就是name值相同】）</td>
		</tr>
		<tr>
			<td>cardTypeTimeEnd</td>
			<td>结束时间许可（多个逗号分隔【也就是name值相同】）</td>
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
   "givingAmount": 10,
   "remark": "升级会员卡",
   "salesId": 1
}
</textarea>

<div data-id="memberCardUpLevel" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardId</td>
			<td>会员id</td>
		</tr>
		<tr>
			<td>cardTypeId</td>
			<td>要升级的会员卡类型id</td>
		</tr>
		<tr>
			<td>balanceStyle</td>
			<td>支付类型（1：现金  2：支付宝  3：微信）</td>
		</tr>
		<tr>
			<td>upLevelMoney</td>
			<td>升级费用（元）</td>
		</tr>
		<tr>
			<td>subMoney</td>
			<td>优惠价格（元）</td>
		</tr>
		<tr>
			<td>givingAmount</td>
			<td>赠送金额（元）</td>
		</tr>
		<tr>
			<td>remark</td>
			<td>备注</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 充值会员卡 -->
<textarea rows="15" cols="55" data-id="memberCardCZ">
{
   "cardId": null,
   "balanceStyle": 1,
   "czMoney": 5000.5,
   "subMoney": 2000.2,
   "givingAmount": 100,
   "remark": "充值会员卡5000.5，优惠2000.2",
   "salesId": 1
}
</textarea>

<div data-id="memberCardCZ" style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardId</td>
			<td>会员id</td>
		</tr>
		<tr>
			<td>balanceStyle</td>
			<td>支付类型（1：现金  2：支付宝  3：微信）</td>
		</tr>
		<tr>
			<td>czMoney</td>
			<td>充值金额（元）</td>
		</tr>
		<tr>
			<td>subMoney</td>
			<td>优惠价格</td>
		</tr>
		<tr>
			<td>givingAmount</td>
			<td>赠送金额（元）</td>
		</tr>
		<tr>
			<td>remark</td>
			<td>备注</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

<!-- 补办会员卡 -->
<textarea rows="15" cols="55" data-id="memberCardBuBan">
{
   "cardId": null,
   "balanceStyle": 1,
   "buBanMoney": 500,
   "subMoney": 0,
   "givingAmount": 10,
   "remark": "补办会员卡500，未优惠",
   "salesId": 1
}
</textarea>

<div data-id=memberCardBuBan style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>cardId</td>
			<td>会员id</td>
		</tr>
		<tr>
			<td>balanceStyle</td>
			<td>支付类型（1：现金  2：支付宝  3：微信）</td>
		</tr>
		<tr>
			<td>buBanMoney</td>
			<td>补办需要的金额（元）</td>
		</tr>
		<tr>
			<td>subMoney</td>
			<td>优惠价格</td>
		</tr>
		<tr>
			<td>givingAmount</td>
			<td>赠送金额（元）</td>
		</tr>
		<tr>
			<td>remark</td>
			<td>备注</td>
		</tr>
		<tr>
			<td>salesId</td>
			<td>销售员id</td>
		</tr>
	</table>
</div>

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

<div data-id=getBalances style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>balanceType</td>
			<td>类型 1：充值  2：消费【条件】</td>
		</tr>
		<tr>
			<td>createTimeStart</td>
			<td>流水操作开始时间【条件】</td>
		</tr>
		<tr>
			<td>createTimeEnd</td>
			<td>流水操作结束时间【条件】</td>
		</tr>
		<tr>
			<td>memberMobile</td>
			<td>会员手机号【条件】</td>
		</tr>
		<tr>
			<td>cardId</td>
			<td>会员卡id【条件】</td>
		</tr>
	</table>
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>balanceType</td>
			<td>序号</td>
		</tr>
		<tr>
			<td>balanceNo</td>
			<td>交易流水号</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>会员姓名</td>
		</tr>
		<tr>
			<td>balanceServiceTypeName</td>
			<td>订单类型</td>
		</tr>
		<tr>
			<td>balanceStyleName</td>
			<td>支付方式</td>
		</tr>
		<tr>
			<td>realAmount</td>
			<td>支付金额</td>
		</tr>
		<tr>
			<td>balanceStatus</td>
			<td>订单状态（1：已收全款  2：未付款）</td>
		</tr>
		<tr>
			<td>operatorName</td>
			<td>操作人</td>
		</tr>
	</table>
</div>

<!-- 获取发票列表 -->
<textarea rows="15" cols="55" data-id="getInvoices">
{
   "status": ""
}
</textarea>

<div data-id=getInvoices style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>status</td>
			<td>打印状态	1：领取，2：未领取</td>
		</tr>
	</table>
	
	<span style="font-weight: bold;">返回参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>invoiceId</td>
			<td>序号</td>
		</tr>
		<tr>
			<td>invoiceHeader</td>
			<td>发票抬头</td>
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
			<td>备注</td>
		</tr>
		<tr>
			<td>invoiceState</td>
			<td>状态(1: 已领取  2：未领取)</td>
		</tr>
		<tr>
			<td>operatorName</td>
			<td>操作人</td>
		</tr>
	</table>
</div>

<!-- 领取发票 -->
<textarea rows="15" cols="55" data-id="updateGetInvoices">
{
   "invoiceIds": ""
}
</textarea>

<div data-id=updateGetInvoices style="float: left;">
	<span style="font-weight: bold;">请求参数：</span>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>invoiceIds</td>
			<td>领取的发票id（多个逗号分隔）</td>
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
			$.post($("#method").val(), $.parseJSON($("textarea[data-id='"+paramId_+"']").val()), function(data){
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













