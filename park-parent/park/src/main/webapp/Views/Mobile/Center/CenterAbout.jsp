<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/mobile/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>联系电话</p>
                </div>
                <div class="weui-cell__ft">010-64212471</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>联系地址</p>
                </div>
                <div class="weui-cell__ft">和平里北街8号</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>邮编</p>
                </div>
                <div class="weui-cell__ft">100013</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>场馆名称</p>
                </div>
                <div class="weui-cell__ft">北京市第一七一中学</div>
            </div>
        </div>

        <article class="weui-article">
            <section>
                <section>
                    <img src="Content/images/mobile/about.jpg?v=${static_resource_version}" alt="北京市第一七一中学">
                    <p>北京市第一七一中学位于首都核心功能区东城区，始建于1958年。1978年被定为东城区重点中学，北京市对外教育窗口校，2005年被评为北京市示范高中。学校现有南北两个教学点，初、高中78个教学班，在校学生3006人，在岗教职工336人。</p>
                </section>
                <section>
                    <p>学校建筑面积58432平方米，其中教学楼35000平方米，集文化教育中心，科技实验中心，体育健身中心，影视教育中心，信息网络中心为一体；有学生社团活动楼，艺术科技创意楼，为师生发展提供了一流的硬件设备。</p>
                </section>
                <section>
                    <p>学校在全面落实国家教育方针中，坚持人文素养和科学精神教育相结合、做人教育和学习教育相结合、学校活动和社会实践相结合，提出了做“有层次无淘汰”的教育理念，坚持“精心、精细、精品”的办学精神和“经营好每一个学生”的办学策略，积极营建“大气成就大器”的学校文化，开发近30门艺术课程、10多门体育课程、20门科技课程以及50多门校本综合选修课程，走班教学，形成满足学生发展需求的校本课程体系，探索提高教学质量的“五步自主高效课堂”教学模式和多元综合评价方式，推行“海量阅读”工程，精心培养具有“健全的人格、优雅的行为、坚实的基础、出色的智慧”和终身发展能力的学生，不断实现“惠师、惠生、惠民”的办学目标和“办人民满意学校”的宗旨。</p>
                </section>
                <section>
                    <p>学校成为近几届高考区级状元诞生地，考入北大、清华等名牌大学人数始终在区域内名列前茅，也有一批批学子走进耶鲁大学、伯克利大学、哈佛大学、麻省理工、哥伦比亚大学，英国剑桥、帝国理工以及东京大学等国外名校。学校先后被一大批国内重点高校授予“优质生源基地校”称号，2011年成为清华大学“新百年计划”优质生源基地校。学校近年来获得各类荣誉称号四十余项。</p>
                </section>
                <section>
                    <p>学校拥有包括屡获国家级专业比赛一等奖的“金帆合唱团”、JA社团等40多个学生社团，30多个教工社团，形成了“自主学习、合作分享、阳光大气”的社团文化。</p>
                </section>
                <section>
                    <p>学校秉持“继承传统精髓、博采国际多元”原则，深化传统文化教育、丰富艺术修养教育、拓展国际交流教育，先后与英国、法国、加拿大、澳大利亚、新加坡等国的中学建立合作关系，通过“孔子”课堂，实现中国文化走出去的同时学习和借鉴国际多元文化。</p>
                </section>
            </section>
        </article>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="关于我们"/>
</c:import>
