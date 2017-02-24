package com.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("home")
public class HomeController extends BaseController {

    // 首页
    @RequestMapping("index")
    public String getRota(){
        return "Home/HomeIndex";
    }
    
}
