# 项目接口文档

## 规范格式

> 返回格式（接口中仅显示返回数据）：
>
    code       返回状态（1.正确响应）
    message    返回信息
    data       返回数据

## 会员管理
主要是会员的增删改查，以及会员卡，发票等相关功能的接口。

### 1.  会员信息设置
目的是增加和修改会员信息；其中请求参数memberId不为空，则为更新会员信息，否则是增加会员信息。
> 请求地址：
>
    member/saveMember.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    memberId        会员id
    memberName      会员名称（汉字字母数字下划线构成，2-10长度）
    memberType      支付类型（1.预付类型，2.记账类型）
    memberMobile    会员手机（常用联系手机）
    memberMobile2   会员备用手机号（备用联系手机）
    memberIdcard    会员身份证号（18位）
    memberSex       会员性别（1.男，2.女）
    memberBirthday  会员生日（Y-M-D格式）
    memberAddress   会员联系地址（常用通讯地址）
    memberRemark    备注
    salesId	        销售员id（谁办理的会员）
>

### 2.  会员信息更新
目的是更新会员信息，与会员信息设置中的更新不同的是仅更新请求参数中的部分信息。
> 请求地址：
>
    member/updateMemberName.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    memberId        会员id
    memberName      会员名称（汉字字母数字下划线构成，2-10长度）
    memberMobile    会员手机（常用联系手机）
>

### 3.  会员卡绑卡
目的是会员的绑卡功能。
> 请求地址：
>
    member/saveMemberCar.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    memberId       会员id
    cardTypeId     会员卡类型id
    cardBalance    会员卡价格（元）
    oldAmount      充值金额
    realAmount     合计金额
    subAmount      优惠金额
    balanceStyle   支付方式（1.现金，2.支付宝，3.微信）
    salesId        销售员id
>
> 返回数据：
>
    balanceNo                 订单流水号
    createTime                订单创建时间
    invoiceId                 发票编号
    balanceServiceTypeName    订单类型
    balanceStatusName         订单付款状态
    
### 4.  会员卡类型查询
目的是根据会员的支付类型查询会员卡的类型，主要用户显示会员卡类型列表。
> 请求地址：
>
    member/getMemberCarTypeNames.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    cardType    会员卡支付类型（1.预付类型，2.记账类型）
>
> 返回数据：
>
    memberCarTypeNames  会员卡列表（[{cardTypeId,cardTypeName}...]）

### 5.  会员卡类型详情
目的是根据某种会员卡类型查询此类型的设置详情。
> 请求地址：
>
    member/getMemberCarType.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    cardTypeId    会员卡类型
>
> 返回数据：
>
    cardTypeId          会员卡类型的ID
    cardType            会员卡类型的支付类型
    cardTypeName        会员卡类型的名称
    cardTypeMoney       会员卡类型的价格
    cardDeadline        会员卡类型的有效期(Y-M-D)
    cardTypeAhead       会员卡类型的提前可预订时间
    cardTypeCredit      信用额度(支付类型才有效)
    cardTypeDiscount    会员卡类型的折扣(0-100)
    cardTypeMonth       会员卡类型的有效期(0-12月)
    cardTypeWeek        周一~周日（1-7多个逗号分隔【也就是name值相同】）
    cardTypeTimeStart   开始时间许可（多个逗号分隔【也就是name值相同】）
    cardTypeTimeEnd     结束时间许可（多个逗号分隔【也就是name值相同】）
    cardTypeStatus      会员卡类型的状态
    
### 6.  会员卡类型设置
目的是增加和修改会员卡类型信息；其中请求参数cardTypeId不为空，则为更新会员卡类型，否则是增加会员卡类型。
> 请求地址：
>
    member/saveMemberCardType.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
>
    cardTypeId          会员卡类型的ID
    cardType            会员卡类型的支付类型
    cardTypeName        会员卡类型的名称
    cardTypeMoney       会员卡类型的价格
    cardDeadline        会员卡类型的有效期(Y-M-D)
    cardTypeAhead       会员卡类型的提前可预订时间
    cardTypeCredit      信用额度(支付类型才有效)
    cardTypeDiscount    会员卡类型的折扣(0-100)
    cardTypeMonth       会员卡类型的有效期(0-12月)
    cardTypeWeek        周一~周日（1-7多个逗号分隔【也就是name值相同】）
    cardTypeTimeStart   开始时间许可（多个逗号分隔【也就是name值相同】）
    cardTypeTimeEnd     结束时间许可（多个逗号分隔【也就是name值相同】）
    cardTypeStatus      会员卡类型的状态（1.正常，2.锁定）   
    
### 7.  升级会员卡
目的是为会员升级，如从普通卡升级到金卡等。
> 请求地址：
>
    member/memberCardUpLevel.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    cardId          会员id
    cardTypeId      要升级的会员卡类型id
    balanceStyle    支付类型（1.现金，2.支付宝，3.微信）
    upLevelMoney    升级费用（元）
    subMoney        优惠价格（元）
    givingAmount    赠送金额（元）
    remark          备注
    salesId         销售员id

### 8.  充值会员卡
目的是为会员充值。
> 请求地址：
>
    member/memberCardCZ.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    cardId          会员id
    balanceStyle    支付类型（1.现金，2.支付宝，3.微信）
    czMoney         充值金额（元）
    subMoney        优惠价格（元）
    givingAmount    赠送金额（元）
    remark          备注
    salesId         销售员id

### 9.  补办会员卡
目的是为会员补办。
> 请求地址：
>
    member/memberCardBuBan.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    cardId          会员id
    balanceStyle    支付类型（1.现金，2.支付宝，3.微信）
    buBanMoney      补办需要的金额（元）
    subMoney        优惠价格（元）
    givingAmount    赠送金额（元）
    remark          备注
    salesId         销售员id
      
### 10.  登记发票
目的是标记订单是否需要打印发票。
> 请求地址：
>
    member/saveInvoice.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    invoiceServiceType    发票业务类型（这里固定传10【注册会员发票类型】）
    invoiceServiceId      发票业务标识（这里传会员id【memberId】）
    invoiceHeader         发票抬头（公司或者个人名称）
    invoiceMoney          发票金额
    invoiceContent        发票内容
    invoiceRemark         发票内容备注
    invoiceState          打印发票（1.打印，2.不打印）
    salesId               销售员id    

### 11.  标记已领取发票
目的是标记发票已领取。
> 请求地址：
>
    member/updateGetInvoices.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    invoiceIds    领取的发票id（多个逗号分隔）  
