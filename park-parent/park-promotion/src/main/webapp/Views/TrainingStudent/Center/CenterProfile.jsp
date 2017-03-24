<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module9" class="form Handle  formStyle12 ">
                <div class="formBannerTitle formBannerTitle311" style="height: 2rem;">
                    <div class="titleLeft titleLeft311"></div>
                    <div class="titleCenter titleCenter311">
                        <div class="titleText titleText311">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">二维码</div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
                <div class="formMiddle formMiddle8">
                    <div class="middleLeft middleLeft8"></div>
                    <div class="middleCenter middleCenter8">
                        <div class="formMiddleContent formMiddleContent8 moduleContent">
                            <div style="margin: .6rem 0; text-align: center;">
                                <img src="/Content/images/training/student/qrcode.png"
                                     style="width: 66%; border: 1px solid #666;">
                            </div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
            </div>
            <div id="module8" class="form Handle formStyle12 ">
                <div class="formBannerTitle formBannerTitle311" style="height: 2rem;">
                    <div class="titleLeft titleLeft311"></div>
                    <div class="titleCenter titleCenter311">
                        <div class="titleText titleText311">
                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                            <div class="textContent">会员信息</div>
                        </div>
                    </div>
                    <div class="titleRight titleRight311"></div>
                </div>
                <div class="formMiddle formMiddle8">
                    <div class="middleLeft middleLeft8"></div>
                    <div class="middleCenter middleCenter8">
                        <div class="formMiddleContent formMiddleContent8 moduleContent">
                            <div id="mLogin">
                                <div class="loginContent">
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="user" class="itemEdit g_input mustItem"
                                               placeholder="张某某">
                                        <span class="icon-nameIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="mobile" class="itemEdit g_input mustItem"
                                               placeholder="110****1234">
                                        <span class="icon-mobileIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <select class="itemEdit g_select mustItem">
                                            <option>北京市</option>
                                            <option>上海市</option>
                                            <option>山东省</option>
                                        </select>
                                        <span class="icon-emailIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <select class="itemEdit g_select mustItem">
                                            <option>北京市</option>
                                            <option>上海市</option>
                                            <option>济南市</option>
                                        </select>
                                        <span class="icon-emailIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <input type="text" maxlength="50" id="address" class="itemEdit g_input mustItem"
                                               placeholder="海淀区上地软件园100号">
                                        <span class="icon-emailIcon g_mainColor"></span>
                                    </div>
                                    <div class="g_globalLine">
                                        <a class="g_button sendIcon" href="/training/mobile/v1/center/index"
                                           style="color: #fff;">保 存</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight8"></div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="个人信息"/>
</c:import>
