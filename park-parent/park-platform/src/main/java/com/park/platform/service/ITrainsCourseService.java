package com.park.platform.service;

import com.park.common.bean.PageBean;
import com.park.common.bean.TrainsCourseInputView;
import com.park.common.po.TrainsCourseInfo;

import java.util.Map;

public interface ITrainsCourseService {

    public PageBean getTrainsCourseList(TrainsCourseInputView trainsCourseInputView);

    public TrainsCourseInfo getTrainsCourseInfo(int courseId);

    public Integer saveTrainsCourseInfo(TrainsCourseInfo trainsCourseInfo);

    public void deleteTrainsCourseInfo(int courseId);

    public Map<String, Object> getTrainsCourseNames();
}
