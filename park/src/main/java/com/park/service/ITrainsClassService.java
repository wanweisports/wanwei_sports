package com.park.service;

import com.park.common.bean.PageBean;
import com.park.common.bean.TrainsClassInputView;
import com.park.common.po.TrainsClassInfo;

import java.util.List;
import java.util.Map;

public interface ITrainsClassService {

    public PageBean getTrainsClassList(TrainsClassInputView trainsClassInputView);

    public TrainsClassInfo getTrainsClassInfo(int classId);

    public Integer saveTrainsClassInfo(TrainsClassInfo trainsClassInfo);

    public void deleteTrainsClassInfo(int classId);

    public List<Map<String, Object>> getTrainsSignClassList();
}
