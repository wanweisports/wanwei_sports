package com.park.common.constant;

public interface IDBConstant {

	public static final int NULL_PARENT_KEY = -1;// 空父字典键
	
	public static final String LOGIC_STATUS = "LOGIC_STATUS";//逻辑状态

    public static final String LOGIC_STATUS_YES = "1";//是
    public static final String LOGIC_STATUS_NO = "2";//否
    
    public static final String STATUS = "STATUS";//状态

    public static final String STATUS_YES = "1";//有效
    public static final String STATUS_NO = "2";//无效
    
    public static final String SEX = "SEX";//性别

    public static final String SEX_NAN = "1";//男
    public static final String SEX_NV = "2";//女
    
    public static final String BALANCE_STYLE = "BALANCE_STYLE";//状态

    public static final String BALANCE_STYLE_XJ = "1";//现金
    public static final String BALANCE_STYLE_ZFB = "2";//支付宝
    public static final String BALANCE_STYLE_WX = "3";//微信
    
    public static final int ZERO = 0;
    
    public static final String BALANCE_TYPE = "BALANCE_TYPE";//流水类型
    public static final String BALANCE_TYPE_CZ = "1";//充值
    public static final String BALANCE_TYPE_XF = "2";//消费
    public static final String BALANCE_TYPE_OTHER = "3";//其他
    
    public static final String BALANCE_SERVICE_TYPE = "BALANCE_SERVICE_TYPE";//业务类型
    public static final String BALANCE_SERVICE_TYPE_REG = "10";//注册会员
    public static final String BALANCE_SERVICE_TYPE_CARD_CZ = "11";//会员充值
    public static final String BALANCE_SERVICE_TYPE_CARD_UP = "12";//升级会员卡
    public static final String BALANCE_SERVICE_TYPE_CARD_BUBAN = "13";//补办会员卡
    
    public static final String BALANCE_STATUS = "BALANCE_STATUS";//流水状态
    public static final String BALANCE_STATUS_ALL = "1";//已收全款
    public static final String BALANCE_STATUS_NOT = "2";//未付款
    public static final String BALANCE_STATUS_ONE = "3";//部分收款
	
}
