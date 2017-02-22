# 项目接口文档

## 规范格式

> 返回格式（接口中仅显示返回数据）：
>
    code       返回状态（1.正确响应）
    message    返回信息
    data       返回数据
>

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
>       
    
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
>   

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
>    
    
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
>     
    
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
>    

### 8.  充值会员卡
目的是为会员充值。
> 请求地址：
>
    member/memberCardCZ.do
> 
> 请求类型：POST（application/json）
> 
> 返回数据：
> 
    cardId          会员id
    balanceStyle    支付类型（1.现金，2.支付宝，3.微信）
    czMoney         充值金额（元）
    subMoney        优惠价格（元）
    givingAmount    赠送金额（元）
    remark          备注
    salesId         销售员id
>    

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
>   
      
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
>   

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
>

### 12.  全文向后模糊查询会员列表
目的是根据会员名, 会员ID, 会员卡号, 手机号, 身份证号向后模糊查询会员列表。
> 请求地址：
>
    member/searchMember.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    search    检索关键字（手机号，姓名，会员卡号）
>
> 返回数据：
> 
    members    会员列表数组（[{手机号，姓名，ID}]）
>

## 预订管理
主要是管理场地的预订，批量预订，场地的操作等。

### 1.  计算预订场地金额
目的计算选择场地的合计金额，根据单价计算的。
> 请求地址：
>
    site/calculateSiteMoney.do
> 
> 请求类型：POST（application/json）
>
> 请求格式：
> 
    siteOperationJson    场次信息
>
> 返回数据：
> 
    originalPrice       原始金额
    presentPrice        会员金额
    sumNums             选择场次数量
>

### 2.  场地预订
目的预订场地，并生成未支付订单。
> 请求地址：
>
    site/saveReservationSite.do
> 
> 请求类型：POST（application/json）
>
> 请求格式：
> 
    siteOperationJson    场次信息
>
> 返回数据：
> 
    orderId       订单ID
>

### 3.  场地锁定与解锁
目的是锁定或者解锁某些场地的预订。
> 请求地址：
>
    site/lockSite.do
> 
> 请求类型：POST（application/json）
>
> 请求格式：
> 
    lock                 锁场吗? true : false
    siteOperationJson    场次信息
>

### 4.  支付预订场地
目的支付未支付的订单。
> 请求地址：
>
    site/confirmOrder.do
> 
> 请求类型：POST（application/json）
>
> 请求格式：
> 
    orderId           订单ID
    orderSumPrice     订单总金额
    payCount          支付场次数
    paySumPrice       支付金额
    subAmount         优惠金额
    additionalPrice   附加金额
    payType           支付方式 1：现金  2：支付宝  3：微信
    checkNo           支票号
    orderRemark       订单备注
>

## 商品管理
主要是管理商品的设置，销售，进销存等。

### 1.  显示商品类型列表
目的是查看商品类型的详情信息。
> 请求地址：
>
    good/goodTypes.do || good/typeGood.do(页面)
> 
> 请求类型：GET（application/json || JSP页面）
>
> 返回数据：
> 
    list                类型列表[{包含下面的key-value},...]
    goodTypeDescribe    商品类型描述
    goodTypeId          商品类型ID
    goodTypeName        商品类型名称
    createTime          创建时间
    operatorName        操作员名称
>

### 2.  商品类型详情
目的是查看商品类型的详情信息。
> 请求地址：
>
    good/goodTypeInfo.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    goodTypeId    商品类型ID
>
> 返回数据：
> 
    goodTypeDescribe    商品类型描述
    goodTypeId          商品类型ID
    goodTypeName        商品类型名称
>

### 3.  商品类型设置
目的是增加或者更新商品类型详情。
> 请求地址：
>
    good/saveGoodType.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    goodTypeDescribe    商品类型描述
    goodTypeId          商品类型ID
    goodTypeName        商品类型名称
>

### 4.  显示商品设置页面
目的是增加某种商品。
> 请求地址：
>
    good/settingGood.do
> 
> 请求类型：GET（JSP页面）
> 

### 5.  获取商品类型列表
目的是获取当前系统中的所有的商品类型。
> 请求地址：
>
    good/goodTypes.do
> 
> 请求类型：POST（application/json）
> 

### 6.  计算购物车金额
目的是计算购物车中的商品合计金额。
> 请求地址：
>
    good/calculateShoppingMoney.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    shoppingIds    购物车每条商品标记：1,2
    memberId       会员ID
    name           用户姓名
    moblie         用户手机号
    opType         用户类型 1：会员 2：散客
>
> 返回数据：
> 
    originalPrice    原始价格
    presentPrice     折后价格
>

### 7.  预订购物车商品
目的是填写购物车的购买人信息，生成未支付订单。
> 请求地址：
>
    good/saveOrder.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    shoppingIds    购物车每条商品标记：1,2
    memberId       会员ID
    name           用户姓名
    moblie         用户手机号
    opType         用户类型 1：会员 2：散客
>
> 返回数据：
> 
    orderId    订单ID
>

### 8.  确认支付订单
目的是支付订单。
> 请求地址：
>
    good/confirmOrder.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    orderId           订单ID
    paySumPrice       支付金额
    subAmount         优惠金额
    additionalPrice   附加金额
    payType           支付方式 1：现金 2：支付宝 3：微信
    checkNo           支票号
    orderRemark       订单备注
>
> 返回数据：
> 
    originalPrice    原始价格
    presentPrice     折后价格
>

## 订单管理
主要是管理场地，商品等的购买产生的订单管理。

### 1.  取消订单
目的是订单的取消操作。
> 页面路由：
>
    order/getOrderList.do
>
> 请求地址：
>
    order/cancelOrder.do
> 
> 请求类型：GET（application/json || JSP页面）
>
> 请求地址：
> 
    orderId    订单ID
>

### 1.  删除订单
目的是订单的删除操作。
> 页面路由：
>
    order/getOrderList.do
>
> 请求地址：
>
    order/deleteOrder.do
> 
> 请求类型：GET（application/json || JSP页面）
>
> 请求地址：
> 
    orderId    订单ID
>

## 系统设置
主要是一些系统的参数的设置，以及操作用户的设置等。

### 1.  场馆信息设置
目的是设置当前场馆的基础信息。
> 页面路由：
>
    settings/common.do
>
> 请求地址：
>
    settings/saveCommon.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    businessId           场馆ID
    businessStartTime    营业开始时间
    businessEndTime      营业结束时间
    businessName         场馆名称
    businessAreaName     场馆所在省市
    businessContact      场馆联系人
    businessPhone        场馆联系电话
    businessAddress      场馆详细地址
>

### 2.  员工的激活和锁定
目的是场馆员工的激活或者锁定。
> 页面路由：
>
    settings/getUsers.do
>
> 请求地址：
>
    settings/lockEmployee.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    operatorId    员工账号
    lock          锁定true或者激活false
>

### 3.  设置员工信息
目的是更新或者增加员工信息。
> 页面路由：
>
    settings/getUsersView.do
>
> 请求地址：
>
    settings/lockEmployee.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    id                    员工ID
    operatorId            员工账号
    operatorName          员工真实姓名
    operatorMobile        员工手机号码
    operatorNo            员工编号
    operatorEffectDate    生效时间
    operatorEndDate       截止时间
    operatorBirthday      员工生日
    operatorContact       联系人
    operatorAddress       通讯地址
    operatorSex           性别
    roleId                员工权限
>

### 4.  系统可配置权限的功能列表
目的是查询系统中可以配置权限控制的所有功能。
> 页面路由：
>
    settings/getRolesView.do
>
> 请求地址：
>
    system/getAllRoles.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    roleMenuList    菜单列表
>

### 5.  设置员工权限
目的是更新或者增加员工的权限信息。
> 页面路由：
>
    settings/getRolesView.do
>
> 请求地址：
>
    settings/saveRole.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    roleName        权限名称
    roleStatus      权限可用状态
    roleDescribe    说明描述
    roleLevel       权限优先级(当前没用)
    menuIds         功能权限(2,3,4,5,6,7)
    roleId          权限ID
>


### 6.  系统初始化
目的是系统初始化配置。
> 页面路由：
>
    init/settings.do
>
> 请求地址：
>
    init/saveInit.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
    operatorNo           管理员编号
    operatorPwd          管理员密码
    businessName         场馆名称
    points               安装点数量
    businessStartTime    营业开始时间
    businessEndTime      营业结束时间
>

## 通行证
主要是个人账户信息的管理，如密码的修改，信息的完善等。

### 1.  保存完善信息
目的是更新登录账号的账户信息。
> 页面路由：
>
    passport/profile
>
> 请求地址：
>
    passport/updateProfile.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
     operatorId            员工账号
     operatorName          员工真实姓名
     operatorMobile        员工手机号码
     operatorNo            员工编号
     operatorBirthday      员工生日
     operatorAddress       通讯地址
     operatorSex           性别
>

### 2.  重置密码
目的是修改密码。
> 页面路由：
>
    passport/modifyPassword
>
> 请求地址：
>
    passport/updatePwd.do
> 
> 请求类型：POST（application/json）
> 
> 请求参数：
> 
     oldPwd        旧密码
     newPwd        新密码
     confirmPwd    确认密码
>

## 附件

### 1.  功能菜单列表(roleMenuList)格式
```javascript
[{
    "id": "1",
    "text": "会员管理",
    "children": [{
        "id": "2",
        "text": "新会员办理"
    }, {
        "id": "3",
        "text": "会员查询"
    }]
}, {
    "id": "10",
    "text": "预定管理",
    "children": [{
        "id": "11",
        "text": "场地预定"
    }]
}]
```

### 2.  场地预订(siteOperationJson)格式
用于场地预订，计算价格，锁场，解锁等功能的请求
```javascript
{
    "mobile"              : "用户手机号",
    "name"                : "用户姓名，非会员散客",
    "memberId"            : "会员ID，非会员0",
    "opType"              : "用户类型，会员1，非会员2",
    "reserveType"         : "预订渠道，电脑1，手机2，电话3",
    "reserveModel"        : "预订模式，普通1，批量2",
    "siteReserveDateList" : [{
        "reserveStartDate"    : "2016-10-01", //预定开始时间
        "reserveEndDate"      : "2016-10-02",   //预定结束时间
        "reserveWeek"         : "2,3,4",        //预定星期，逗号分隔
        "siteReserveTimeList" : [{
            "siteId" : "1",            
            "siteStartTime": "13:00",  //预定开始时间
            "siteEndTime": "14:00"     //预定结束时间
        }]
    }]
}
```
