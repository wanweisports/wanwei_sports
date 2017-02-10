package com.park.controller;

import com.park.common.annotation.NotProtected;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * Created by wangjun on 17/2/7.
 */
@Controller
@RequestMapping("common")
public class CodeController {

    @Description("获取图片验证码")
    @NotProtected
    @ResponseBody
    @RequestMapping(value = "/captcha",method = RequestMethod.GET)
    public String getCaptcha(String captchaId, HttpServletRequest request, HttpServletResponse response) throws IOException{

        int w = 160;
        int h = 60;

        String random = RandomStringUtils.random(4, true, true);
        BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        g.setColor(Color.white); // 设定背景色
        g.fillRect(0, 0, w, h);
        g.setFont(new Font("Times New Roman", Font.PLAIN, 24));// 设定字体
        g.setColor(Color.white); // 画边框
        g.drawRect(0, 0, w, h);

        for (int i = 0; i < 30; i++) {
            int x1 = (int) (Math.random() * w);
            int y1 = (int) (Math.random() * h);
            int x2 = (int) (Math.random() * w);
            int y2 = (int) (Math.random() * h);

            Color color = new Color((int) (255 * Math.random()), (int) (255 * Math.random()), (int) (255 * Math.random()));
            g.setColor(color);
            g.drawLine(x1, y1, x2, y2);
        }

        FontMetrics fm = g.getFontMetrics();
        int stringWidth = fm.stringWidth(random);
        int stringAscent = fm.getAscent();
        int xCoordinate = w / 2 - stringWidth / 2;
        int yCoordinate = h / 2 + stringAscent / 2;
        g.setColor(Color.black);
        g.drawString(random, xCoordinate, yCoordinate);

        HttpSession session = request.getSession();
        session.setAttribute("captcha_validate", captchaId);

        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        ImageIO.write(image, "jpeg", response.getOutputStream());

        return "";
    }
}
