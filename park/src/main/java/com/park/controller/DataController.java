package com.park.controller;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/10/20.
 */
public class DataController extends BaseController {
    // 会员注册统计
    @RequestMapping("data/getMembersRegister")
    public String getMembersRegister() {
        return "Data/DataMembersRegister";
    }

    // 用户签到记录
    @RequestMapping("data/getMembersAttendance")
    public String getMembersAttendance() {
        return "Data/DataMembersAttendance";
    }
}
