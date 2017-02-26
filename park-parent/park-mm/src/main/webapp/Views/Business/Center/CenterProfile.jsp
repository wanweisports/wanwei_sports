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
        <div class="weui-panel">
            <div class="weui-panel__hd" style="font-size: 16px;">个人信息</div>
            <div class="weui-panel__bd">
                <div class="weui-cells weui-cells_form" style="margin-top: 0;">
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">员工编号</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="operatorNo" type="text" placeholder="您的员工编号"
                                   value="${operatorNo}" autocomplete="off">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">员工姓名</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="operatorName" type="text" placeholder="您的员工姓名"
                                   value="${operatorName}" autocomplete="off">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">联系电话</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="operatorMobile" type="number" placeholder="备用手机"
                                   value="${operatorMobile}">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">出生日期</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" name="operatorBirthday" type="date" placeholder="您的出生日期"
                                   value="${operatorBirthday}" autocomplete="off">
                        </div>
                    </div>
                    <div class="weui-cell">
                        <div class="weui-cell__hd">
                            <label class="weui-label">联系地址</label>
                        </div>
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" name="operatorAddress" placeholder="联系地址" rows="3">${operatorAddress}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:;">保存修改</a>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="个人信息"/>
</c:import>
