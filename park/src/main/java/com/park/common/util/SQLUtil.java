package com.park.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

public class SQLUtil {

    public static Map getInToSQL(String inKey, Object ...paramObj){
        Map param = new HashMap();
        if(paramObj != null && paramObj.length > 0) {
            List<String> list = new ArrayList();
            for(int i = 0; i < paramObj.length; i++){
                if(paramObj[i] != null) {
                    list.add(StrUtil.trim(String.valueOf(paramObj[i])));
                }
            }
            param.put(inKey, list.toArray());
        }
        return param;
    }

    public static Map getInToSQL(String inKey, String paramStrs){
        return getInToSQL(inKey, StrUtil.isNotBlank(paramStrs) ? paramStrs.split(",") : null);
    }

    public static String conversionSqlPlaceholder(String strs, List<Object> params){
        String[] strss = strs.split(",");
        String placeholder = "";
        for(String str : strss){
            if(StringUtils.isNotBlank(placeholder)){
                placeholder += ",";
            }
            placeholder += "?";
            params.add(str);
        }
        return placeholder;
    }

}
