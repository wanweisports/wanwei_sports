<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/center/center_profile.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-tab">
            <div class="weui-navbar">
                <div class="weui-navbar__item weui-bar__item_on">
                    选项一
                </div>
                <div class="weui-navbar__item">
                    选项二
                </div>
                <div class="weui-navbar__item">
                    选项三
                </div>
            </div>
            <div class="weui-tab__panel">
                <div class="weui-cells weui-cells_checkbox">
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s11" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s12">
                        <div class="weui-cell__hd">
                            <input type="checkbox" name="checkbox1" class="weui-check" id="s12">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>李洪旭</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s13" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s12">
                        <div class="weui-cell__hd">
                            <input type="checkbox" name="checkbox1" class="weui-check" id="s14">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>李洪旭</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s15" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s16" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s17" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s18" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s19" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="s11">
                        <div class="weui-cell__hd">
                            <input type="checkbox" class="weui-check" name="checkbox1" id="s20" checked="checked">
                            <i class="weui-icon-checked"></i>
                        </div>
                        <div class="weui-cell__bd">
                            <p>张文革</p>
                        </div>
                    </label>
                </div>
                <div class="weui-loadmore">
                    <i class="weui-loading"></i>
                    <span class="weui-loadmore__tips">正在加载</span>
                </div>
                <div class="weui-btn-area">
                    <a class="weui-btn weui-btn_primary" href="javascript:">发送消息</a>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="员工查询"/>
</c:import>
