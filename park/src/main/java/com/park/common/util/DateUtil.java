package com.park.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class DateUtil {
	public static final String YYYYMMDD_S = "yyyyMMdd";
	public static final String YYYYMMDD_HMS = "yyyyMMddHHmmss";
    public static final String YYYY = "yyyy";
    public static final String YYYYMM = "yyyy-MM";
    public static final String YYYYMMDD = "yyyy-MM-dd";
    public static final String YYYY_MM_DD = "yyyy/MM/dd";
    public static final String YYYYMMDDHHMM = "yyyy-MM-dd HH:mm";
    public static final String YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";
    public static final String YYYYMMDD_ZH = "yyyy年MM月dd日";
    public static final String YYYYMMDDHHMMSS_ZH = "yyyy年MM月dd日HH:mm:ss";
    public static final int FIRST_DAY_OF_WEEK = Calendar.MONDAY;// 中国周一是一周的第一天
	
	/**
		 * @param time
		 * @return
		 * @Description: 时间格式转换
		 * @author wangbing
		 *@Since:2015年9月6日
		 */
	public static String formatStringTime(String time){
		long msgCreateTime = Long.parseLong(time) * 1000L;  
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		return format.format(new Date(msgCreateTime));
	}
	
	/**
		 * @param time
		 * @return
		 * @Description: 时间格式转换
		 * @author wangbing
		 *@Since:2015年9月6日
		 */
	public static Date formatDataTime(String time){
		long msgCreateTime = Long.parseLong(time) * 1000L;  
		return new Date(msgCreateTime);
	}
	
	/**
	 * 奖date类型的日期转换为指定格式
	 */
	public static String dateToString(Date date, String format) {
		if(StringUtils.isBlank(format)) format = YYYYMMDD;
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		String ddd = null;
		ddd = formatter.format(date);
		return ddd;
	}
	
	/**
	 * 当前时间增加几个月，返回字符串年-月-日
	 */
	public static String getAddMonth(String month) {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.MONTH, StrUtil.objToInt(month));
		return dateToString(c.getTime(), YYYYMMDD);
	}
	
	/**
	 * 计算会员卡截至日期
	 */
	public static String cardDeadline(String month) {
		return !"0".equals(month) ? getAddMonth(month) : "0";
	}
	
	public static String getNowDate() {
		return dateToString(new Date(), YYYYMMDDHHMMSS);
	}

}
