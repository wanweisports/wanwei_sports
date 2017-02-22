package com.park.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.po.SystemDict;
import com.park.common.util.JsonUtils;
import com.park.dao.IBaseDao;
import com.park.service.IDictService;

@Service
public class DictServiceImpl implements IDictService {

    @Autowired
    private IBaseDao baseDao;

    private List<SystemDict> SystemDictList = new ArrayList<SystemDict>();

    private Logger logger = Logger.getLogger(DictServiceImpl.class);

    @PostConstruct
    public void init(){
        if(SystemDictList.isEmpty()) {
            logger.info("加载字典表开始...");
            long start = System.currentTimeMillis();
            SystemDictList = JsonUtils.stringToArray(JsonUtils.toJsonDF(baseDao.queryBySql("SELECT * FROM system_dict")), SystemDict[].class);
            logger.info("加载字典表结束...用时：" + ((System.currentTimeMillis()-start)/1000.0));
        }
    }

    public List<SystemDict> getDictKeyValueListByName(String dictName) {
        List<SystemDict> SystemDicts = new ArrayList();
        Iterator<SystemDict> SystemDictIterator = SystemDictList.iterator();
        while (SystemDictIterator.hasNext()){
            SystemDict SystemDict = SystemDictIterator.next();
            if(SystemDict.getDictName().equals(dictName)){
                SystemDicts.add(SystemDict);
            }
        }
        return SystemDicts;
        //return this.SystemDictDao.getDictKeyValueListByName(SystemDictName);
    }

    public String getDictValueByNameKey(String dictName, String dictKey){
        Iterator<SystemDict> SystemDictIterator = SystemDictList.iterator();
        while (SystemDictIterator.hasNext()){
            SystemDict SystemDict = SystemDictIterator.next();
            if(SystemDict.getDictName().equals(dictName) && SystemDict.getDictKey().equals(dictKey)){
                return SystemDict.getDictValue();
            }
        }
        return "";
        //return SystemDictDao.getDictValueByNameKey(SystemDictName, SystemDictKey, 0);
    }

    public String getDictKey(String dictName, String dictValue){
        Iterator<SystemDict> SystemDictIterator = SystemDictList.iterator();
        while (SystemDictIterator.hasNext()){
            SystemDict SystemDict = SystemDictIterator.next();
            if(SystemDict.getDictName().equals(dictName) && SystemDict.getDictValue().equals(dictValue)){
                return SystemDict.getDictKey();
            }
        }
        return "";
        //return SystemDictDao.getDictValueByNameKey(SystemDictName, SystemDictKey, 0);
    }

    public Map getDictToMap(String dictName){
        Map map = new HashMap();
        Iterator<SystemDict> SystemDictIterator = SystemDictList.iterator();
        while (SystemDictIterator.hasNext()){
            SystemDict SystemDict = SystemDictIterator.next();
            if(SystemDict.getDictName().equals(dictName)){
                map.put(SystemDict.getDictKey(), SystemDict.getDictValue());
            }
        }
        return map;
        //return SystemDictDao.querySystemDictToMap(SystemDictName);
    }

    public SystemDict getRandomDictByName(String dictName){
        List<SystemDict> SystemDictList = getDictKeyValueListByName(dictName);
        return SystemDictList.get((int) (Math.random() * SystemDictList.size()));
    }

}
