package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjun on 16/10/26.
 */
@Controller
@RequestMapping("init")
public class InitController extends BaseController {
    // 初始化系统
    @RequestMapping("settings")
    public String typeGood(){
        return "Init/InitSettings";
    }
}
