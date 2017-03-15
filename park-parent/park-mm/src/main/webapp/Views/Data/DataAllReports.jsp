<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/home/index.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <style type="text/css">
        .panel .btn {
            margin: 0 auto 10px;
            width: 82%;
            display: block;
        }
        .panel .panel-body {
            min-height: 240px;
        }
    </style>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>数据统计</span> &gt;&gt; <span>所有报表</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="col-sm-3">
            <div class="panel panel-default">
                <div class="panel-heading">会员管理报表</div>
                <div class="panel-body">
                    <a href="javascript:;" class="btn btn-default">
                        会员办理统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        会员储值统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        会员补办统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="panel panel-default">
                <div class="panel-heading">场地预订报表</div>
                <div class="panel-body">
                    <a href="javascript:;" class="btn btn-default">
                        场地使用率统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        场地预订记录 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        场地签到记录 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="panel panel-default">
                <div class="panel-heading">商品管理报表</div>
                <div class="panel-body">
                    <a href="javascript:;" class="btn btn-default">
                        商品销售统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        商品进销存统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="panel panel-default">
                <div class="panel-heading">经营收支报表</div>
                <div class="panel-body">
                    <a href="javascript:;" class="btn btn-default">
                        营业收入统计 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        营业收入日志 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        营业收入图表分析 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="panel panel-default">
                <div class="panel-heading">场馆管理报表</div>
                <div class="panel-body">
                    <a href="javascript:;" class="btn btn-default">
                        数据备份记录 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                    <a href="javascript:;" class="btn btn-default">
                        操作日志 <span class="glyphicon glyphicon-share-alt"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="business"/>
</c:import>
