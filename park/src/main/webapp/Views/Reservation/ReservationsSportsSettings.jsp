<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
<link href="Content/style/reservations/reservations_sports_settings.css" rel="stylesheet" type="text/css">

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">场地类型</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="#myModal" data-toggle="modal" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> 增加场地类型
                    </a>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>场地类型</th>
                                <th>单价(元)</th>
                                <th>预订押金(元)</th>
                                <th>开放时间</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sport" items="${sports}">
                                <tr>
                                    <td>${sport.sport_name}</td>
                                    <td>${sport.sport_money}</td>
                                    <td>${sport.sport_deposit}</td>
                                    <td>${sport.start_time}-${sport.end_time}</td>
                                    <c:if test="${sport.sport_status == 1}">
                                        <td class="text-success">开放</td>
                                    </c:if>
                                    <c:if test="${sport.sport_status == 2}">
                                        <td class="text-danger">关闭</td>
                                    </c:if>
                                    <td>李晓丹</td>
                                    <td>2016-09-03</td>
                                    <td>
                                        <a href="#myModal" data-toggle="modal" data-original-title="" class="btn btn-primary">
                                            <i class="glyphicon glyphicon-edit"></i> 修改
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">设置场地类型</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="场地类型">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">单价/小时</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="单价/小时">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">预订押金</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="预订押金">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开放时间</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" placeholder="开始时间">
                        </div>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" placeholder="结束时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类型状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sport_status" value="1" checked> 开放
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sport_status" value="2"> 关闭
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">
                    <span class="glyphicon glyphicon-ok"></span> 确 定
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />