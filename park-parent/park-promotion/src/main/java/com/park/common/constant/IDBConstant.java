package com.park.common.constant;

public interface IDBConstant {

	public static final String LOGIC_STATUS = "LOGIC_STATUS";//逻辑状态

    public static final String LOGIC_STATUS_YES = "1";//是
    public static final String LOGIC_STATUS_NO = "2";//否
    public static final String LOGIC_STATUS_OTHER = "3"; //其他
    
    public static final String STATUS = "STATUS";//状态

    public static final String STATUS_YES = "1";//有效
    public static final String STATUS_NO = "2";//无效
    
    public static final String SEX = "SEX";//性别

    public static final String SEX_NAN = "1";//男
    public static final String SEX_NV = "2";//女

    public static final int DATA_DATE_PRE_DAY = 10; // 昨天
    public static final int DATA_DATE_DAY = 11; // 今天
    public static final int DATA_DATE_PRE_WEEK = 20; // 上周
    public static final int DATA_DATE_WEEK = 21; // 本周
    public static final int DATA_DATE_NEXT_WEEK = 22; // 下周
    public static final int DATA_DATE_PRE_MONTH = 30; // 上月
    public static final int DATA_DATE_MONTH = 31; // 本月
    public static final int DATA_DATE_PRE_YEAR = 40; // 上年
    public static final int DATA_DATE_YEAR = 41; // 本年
}
