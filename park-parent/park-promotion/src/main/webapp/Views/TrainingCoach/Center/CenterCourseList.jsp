<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module302" class="form Handle formStyle6">
                <div class="formMiddle formMiddle302">
                    <div class="middleLeft middleLeft302"></div>
                    <div class="middleCenter middleCenter302">
                        <div class="formMiddleContent formMiddleContent302 moduleContent">
                            <div class="newsList " id="newsList302">
                                <div id="newsLine8" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody8" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link" href="/training/coach/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg1.jpg?v=${static_resource_version}" class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>篮球兴趣班</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="newsLine7" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody7" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link" href="/training/coach/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg2.jpg?v=${static_resource_version}" class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>田亮跳水体验课</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="newsLine6" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody6" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link" href="/training/coach/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg3.jpg?v=${static_resource_version}" class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>足球培训班</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="newsLine5" class="wWLine largeImageNewsStyle newsLine J_picNum">
                                    <div id="lineBody5" class="lineBody">
                                        <div class="mixNewsStyleImgBox6">
                                            <a class="f_mixNewsStyleImgBox6_link" href="/training/coach/v1/center/course/detail?courseId=121">
                                                <div class="newsTitlePic icon-noFigureB"></div>
                                                <div class="mixNewsStyleTitleContainer6">
                                                    <img src="/Content/images/training/courses/timg4.jpg?v=${static_resource_version}" class="newsBanner">
                                                    <div class="mixNewsStyleTitlePanel">
                                                        <div class="mixNewsStyleTitle1">
                                                            <div>篮球提高班</div>
                                                        </div>
                                                    </div>
                                                    <div class="newsElementsPanel g_newsElementsPanel J_newsElementsPanel">
                                                        <div class="ne_newsTime" style="vertical-align: middle;">报名时间：2017-03-19</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight302"></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="负责的课程"/>
</c:import>
