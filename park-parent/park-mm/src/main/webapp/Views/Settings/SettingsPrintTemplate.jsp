<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>系统设置</span> &gt;&gt; <span>小票打印设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">小票打印设置</div>
            <div class="panel-body">
                <button type="button" class="btn btn-primary">
                    <span class="glyphicon glyphicon-print"></span>添加新模板
                </button>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel-heading">会员卡办理</div>
            <div class="panel-body">
                <style type="text/css">
                    .mb-print-content {
                        width: 220px;
                        display: inline-block;
                        font-size: 14px;
                    }
                    .mb-print-content .print-content-header {
                        font-size: 20px;
                        font-weight: bold;
                    }
                    .mb-print-content .print-content-w2 {
                        width: 40px;
                        display: inline-block;
                    }
                    .mb-print-content .print-content-w4 {
                        width: 70px;
                        display: inline-block;
                    }
                    .mb-print-content .print-content-items p {
                        margin-left: 16px;
                    }
                    .mb-print-content .print-content-items .print-content-item {
                        margin-left: 4px;
                    }
                </style>
                <div class="mb-print-content">
                    <p class="print-content-header">会员卡办理</p>
                    <p><span class="print-content-w4">打印时间:</span>2016-06-13 12:11:00</p>
                    <p><span class="print-content-w4">收银员:</span>王晓红</p>
                    <p><span class="print-content-w4">订单号:</span>214325543242234</p>
                    <hr>
                    <div class="print-content-items">
                        <p class="print-content-item">会员卡(3232323324)</p>
                        <p>会费 80.00元</p>
                        <p>押金 60.00元</p>
                        <p>充值 2160.00元</p>
                        <p>赠送 100.00元</p>
                    </div>
                    <p style="text-align: right">余额: 2260.00元</p>
                    <p style="text-align: right">支付: 2300.00元</p>
                    <hr>
                    <p><span class="print-content-w2">场地:</span>第一七一中学体育俱乐部</p>
                    <p><span class="print-content-w2">地址:</span>北京市朝阳区某条路门号</p>
                    <p><span class="print-content-w2">电话:</span>010-85223322</p>
                    <hr>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel-heading">会员卡充值</div>
            <div class="panel-body">
                <style type="text/css">
                    .cz-print-content {
                        width: 220px;
                        display: inline-block;
                        font-size: 14px;
                    }
                    .cz-print-content .print-content-header {
                        font-size: 20px;
                        font-weight: bold;
                    }
                    .cz-print-content .print-content-w2 {
                        width: 40px;
                        display: inline-block;
                    }
                    .cz-print-content .print-content-w4 {
                        width: 70px;
                        display: inline-block;
                    }
                    .cz-print-content .print-content-items p {
                        margin-left: 16px;
                    }
                    .cz-print-content .print-content-items .print-content-item {
                        margin-left: 4px;
                    }
                </style>
                <div class="cz-print-content">
                    <p class="print-content-header">会员卡充值</p>
                    <p><span class="print-content-w4">打印时间:</span>2016-06-13 12:11:00</p>
                    <p><span class="print-content-w4">收银员:</span>王晓红</p>
                    <p><span class="print-content-w4">订单号:</span>214325543242234</p>
                    <hr>
                    <div class="print-content-items">
                        <p class="print-content-item">会员卡(3232323324)</p>
                        <p>充值 2000.00元</p>
                        <p>赠送 100.00元</p>
                    </div>
                    <p style="text-align: right">余额: 2100.00元</p>
                    <p style="text-align: right">支付: 2000.00元</p>
                    <hr>
                    <p><span class="print-content-w2">场地:</span>第一七一中学体育俱乐部</p>
                    <p><span class="print-content-w2">地址:</span>北京市朝阳区某条路门号</p>
                    <p><span class="print-content-w2">电话:</span>010-85223322</p>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="print"/>
</c:import>
