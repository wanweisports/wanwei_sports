package com.park.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import com.park.common.constant.IDBConstant;

public class DateUtil {
	public static final String YYYYMMDD_S = "yyyyMMdd";
	public static final String YYYYMMDD_HMS = "yyyyMMddHHmmss";
	public static final String HHMM = "HH:mm";
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
	 * 将date类型的日期转换为指定格式
	 */
	public static String dateToString(Date date, String format) {
		if(StringUtils.isBlank(format)) format = YYYYMMDD;
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.format(date);
	}
	
	/**
	 * 降string类型的日期转换为Date
	 */
	public static Date stringToDate(String dateStr, String format) throws ParseException {
		if(StringUtils.isBlank(format)) format = YYYYMMDD;
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.parse(dateStr);
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
	
	public static String getAddDay(String dateStr, int addDay) throws ParseException {
		Calendar c = Calendar.getInstance();
		c.setTime(stringToDate(dateStr, YYYYMMDD));
		c.add(Calendar.DATE, addDay);
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
	
	public static Date addHHMMTime(Date time, int field, int amount) throws ParseException{
		Calendar c = Calendar.getInstance();
		c.setTime(time);
		c.add(field, amount);
		return c.getTime();
	}
	
	public static Date getHHMM(String time) throws ParseException{
		DateFormat format = new SimpleDateFormat(HHMM);
		return format.parse(time);
	}
	
	public static String getHHMM(Date time) throws ParseException{
		DateFormat format = new SimpleDateFormat(HHMM);
		return format.format(time);
	}
	
	public static void pkDate(String startDateStr, String endDateStr, String week, String ssd, String snd) throws ParseException{
		String[] weeks = week.split(",");
		
		Date startDate = stringToDate(startDateStr, null);
		Date endDate = stringToDate(endDateStr, null);
		Calendar startCal1 = Calendar.getInstance();
		startCal1.setTime(startDate);
		
		Date ssdDate = stringToDate(ssd, null);
		Date sndDate = stringToDate(snd, null);
		Calendar startCal2 = Calendar.getInstance();
		startCal2.setTime(ssdDate);
		
		while (startCal1.getTime().before(endDate)) {
			while (startCal2.getTime().before(sndDate)) {
				//if(startCal2.getTime().getTime()==startCal1.getTime().getTime() && )
				startCal2.add(Calendar.DATE, 1);
			}
			startCal1.add(Calendar.DATE, 1);
		}
	}
	
	//获取时间范围内指定星期的数量
	public static int getDateScopeWeekNums(String startDateStr, String endDateStr, String weeks) throws ParseException{
		return getDateScopeByWeek(startDateStr, endDateStr, weeks, null).size();
	}
	
	public static List<String> getDateScopeByWeek(String startDateStr, String endDateStr, String weeks, String format) throws ParseException{
		List<String> dataList = new ArrayList<String>();
		List<String> weekList = Arrays.asList(weeks.split(","));
		Date startDate = stringToDate(startDateStr, format);
		Date endDate = stringToDate(endDateStr, format);
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		endCal.add(Calendar.DATE, 1); //为了循环到最后一天为止，故这里加一天
		
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
		while (dateToDate(startCal.getTime()).before(dateToDate(endCal.getTime()))) {
			Date date = startCal.getTime();
			if(weekList.contains(StrUtil.objToStr(getWeek(date)))){
				 dataList.add(dateToString(date, YYYYMMDDHHMM));
			}
			startCal.add(Calendar.DATE, 1);
		}
		return dataList;
	}
	
	//获取两个时间之间小时数
	public static int getTimeHourNums(String startTimeStr, String endTimeStr) throws ParseException{
		Date startDate = stringToDate(startTimeStr, HHMM);
		Date endDate = stringToDate(endTimeStr, HHMM);
		return (int) ((endDate.getTime() - startDate.getTime())/DateUtils.MILLIS_PER_HOUR);
	}
	
	public static int getWeek(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int week = c.get(Calendar.DAY_OF_WEEK);
		if(week == 1) return 7; //周日
		return week-1; //其他星期-1
	}
	
	public static Date dateToDate(Date date) throws ParseException{
		DateFormat format = new SimpleDateFormat(YYYYMMDD);
		return format.parse(format.format(date));
	}
	
	/**
	 * 当前时间在时间范围
	 */
	public static String withinTheTime(String startTimeStr, String endTimeStr) throws Exception{
		Date startTime = stringToDate(startTimeStr, YYYYMMDDHHMM);
		Date endTime = stringToDate(endTimeStr, YYYYMMDDHHMM);
		Date nowTime = stringToDate(dateToString(new Date(), YYYYMMDDHHMM), YYYYMMDDHHMM);
		if(nowTime.before(startTime)) return IDBConstant.LOGIC_STATUS_NO; //未完成
		if(nowTime.after(startTime) && nowTime.before(endTime)) return IDBConstant.LOGIC_STATUS_OTHER; //进行中
		if(nowTime.after(endTime)) return IDBConstant.LOGIC_STATUS_YES; //已完成
		return "";
	}
	
	/*
	 * 注意事项：
		Calendar 的 month 从 0 开始，也就是全年 12 个月由 0 ~ 11 进行表示。
		而 Calendar.DAY_OF_WEEK 定义和值如下：（需要判断周日，然后其他减1）
		Calendar.SUNDAY = 1  //周日
		Calendar.MONDAY = 2
		Calendar.TUESDAY = 3
		Calendar.WEDNESDAY = 4
		Calendar.THURSDAY = 5
		Calendar.FRIDAY = 6
		Calendar.SATURDAY = 7 //周六
	 */
	public static void main(String[] args) throws ParseException {
		/*long s = System.currentTimeMillis();
		for(int i=0;i<100000;i++){
			System.out.println(i);
		}
		System.out.println((System.currentTimeMillis()-s)/1000.0);*/
		/*String time = "09:00";
		String end = "12:00";
		DateFormat format = new SimpleDateFormat("HH:mm"); 
		Date endTime = format.parse(end);
		Calendar c = Calendar.getInstance();
		c.setTime(format.parse(time));
		while(c.getTime().getTime() < endTime.getTime()){
			c.add(Calendar.HOUR_OF_DAY, 1);
			System.out.println(c.getTime());
		}*/
		/*String str="20110214";
        String str1="20110225";
        SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
        Calendar start = Calendar.getInstance();
        Calendar end = Calendar.getInstance();
        try {
            start.setTime(format.parse(str));
            end.setTime(format.parse(str1));
            end.add(Calendar.DAY_OF_MONTH,1);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        while(start.before(end))
        {
            System.out.println(format.format(start.getTime()));
            start.add(Calendar.DAY_OF_MONTH,1);
            
            System.out.println("---");
        }*/
		Date startDate = stringToDate("08:00", HHMM);
		Date endDate = stringToDate("12:00", HHMM);
		int a = (int) ((endDate.getTime() - startDate.getTime())/DateUtils.MILLIS_PER_HOUR);
		System.out.println(a);
	}

}
