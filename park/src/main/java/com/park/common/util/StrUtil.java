package com.park.common.util;

import org.apache.commons.lang3.StringUtils;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2015/12/30.
 */
public class StrUtil extends StringUtils {

    public static final String EMPTY = "";

    private static DecimalFormat decimalFormat = new DecimalFormat("#.##");

    private static DecimalFormat decimalFormatThree = new DecimalFormat("#.###");

    public static String trimToEmpty(Object objStr){
        return objStr == null || "null".equals(objStr) ? "" : objStr.toString().trim();
    }

    public static String trimToEmptyToDefult(Object objStr, String defultName){
        return StringUtils.isNotBlank(trimToEmpty(objStr)) ? trimToEmpty(objStr) : defultName;
    }

    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static Integer objToInt(Object objStr){
        if(objStr == null) return null;
        return Double.valueOf(String.valueOf(objStr)).intValue();
    }

    public static Double objToDouble(Object objStr){
        if(objStr == null) return null;
        return Double.valueOf(String.valueOf(objStr));
    }
    
    public static Double objToDoubleDef0(Object objStr){
        if(objStr == null || isBlank(objStr.toString())) return 0.0;
        return Double.valueOf(String.valueOf(objStr));
    }

    public static String objToNumStr(Object objStr){
        if(objStr == null) return null;
        return String.valueOf(Double.valueOf(String.valueOf(objStr)).intValue());
    }

    public static String objToStr(Object objStr){
        if(objStr == null) return null;
        return String.valueOf(objStr);
    }

    public static String leftFillToLenth(String param, int requestLength, char fillUnit){
        while(param.length() < requestLength){
            param = String.valueOf(fillUnit) + param;
        }
        return param;
    }

    public static double roundKeepTwo(String numStr){
        return roundKeepTwo(objToDouble(numStr));
    }

    public static double roundKeepTwo(double num){
        return Double.parseDouble(decimalFormat.format(num));
    }

    public static double roundKeepThree(String numStr){
        return roundKeepThree(objToDouble(numStr));
    }

    public static double roundKeepThree(double num){
        return Double.parseDouble(decimalFormatThree.format(num));
    }
    
    public static List<Map<String, Object>> zeroToLine(List<Map<String, Object>> list){
    	if(list != null && list.size() > 0){
    		for(Map<String, Object> map : list){
    			for(String key : map.keySet()){
    				Object obj = map.get(key);
    				if(obj instanceof Number && ((Number)obj).intValue() == 0){
    					map.put(key, "--");
    				}
    			}
    		}
    	}
    	return list;
    }

    public static List parseObjToList(Object obj){
        List list = new ArrayList();
        if(obj == null) return list;
        if(!(obj instanceof List)){
            list.add(obj);
            return list;
        }else{
            return (List)obj;
        }
    }

}