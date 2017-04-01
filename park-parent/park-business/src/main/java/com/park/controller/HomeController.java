package com.park.controller;

import com.park.common.annotation.NotProtected;
import com.park.common.bean.*;
import com.park.common.constant.IDBConstant;
import com.park.common.constant.IPlatformConstant;
import com.park.common.exception.MessageException;
import com.park.common.po.TrainsClassInfo;
import com.park.common.po.TrainsClassStudents;
import com.park.common.po.UserOperator;
import com.park.common.util.JsonUtils;
import com.park.common.util.StrUtil;
import com.park.platform.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangjun on 16/11/11.
 */
@Controller
@RequestMapping("home")
public class HomeController extends BaseController {

    // 工作面板
    @RequestMapping("dashboard")
    public String dashboard() {
        return "Home/HomeIndex2";
    }
}
