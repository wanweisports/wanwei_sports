package com.park.service;

import com.park.common.bean.PageBean;
import com.park.common.bean.TrainsClassStudentsInputView;
import com.park.common.po.TrainsClassStudents;

public interface ITrainsClassStudentsService {

    public PageBean getTrainsClassStudentsList(TrainsClassStudentsInputView trainsClassStudentsInputView);

    public Integer saveTrainsClassStudentsSign(TrainsClassStudents trainsClassStudents);

    public void deleteTrainsClassStudentsSign(int signId);

    public Integer confirmTrainsClassStudentsPay(TrainsClassStudents trainsClassStudents);

    public TrainsClassStudents getTrainsClassStudentsSign(int signId);
}
