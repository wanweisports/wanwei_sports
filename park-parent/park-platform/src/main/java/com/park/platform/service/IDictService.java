package com.park.platform.service;

import com.park.common.po.SystemDict;

import java.util.List;
import java.util.Map;

public interface IDictService {

	public List<SystemDict> getDictKeyValueListByName(String dictName);

    public String getDictValueByNameKey(String dictName, String dictKey);

    public String getDictKey(String dictName, String dictValue);

    public Map getDictToMap(String dictName);

    public SystemDict getRandomDictByName(String dictName);
}
