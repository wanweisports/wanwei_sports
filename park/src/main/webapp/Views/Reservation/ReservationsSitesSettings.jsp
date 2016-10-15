<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/dist/reservations/reservations_sites.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#site_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">场地设置</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="site_filter_form" class="form-inline col-sm-8" onsubmit="return false;">
                        <div class="form-group">
                            <label>场地类型</label>
                            <select class="form-control" name="sportId" style="width: 160px;">
                                <option value="">全部类型</option>
                                <c:forEach var="sport" items="${siteSportNames}">
                                    <option value="${sport.sportId}"
                                            <c:if test="${sport.sportId = sportId}">selected</c:if> >${sport.sportName}</option>
                                </c:forEach>
                            </select>
                            <a href="/site/getSiteSports" class="btn btn-primary">
                                <span class="glyphicon glyphicon-plus"></span>
                            </a>
                        </div>
                        <div class="form-group">
                            <label>场地名称</label>
                            <input type="text" class="form-control" placeholder="场地名称" name="siteName">
                        </div>
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary site-filter">
                                <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                            </a>
                        </div>
                    </form>
                    <div class="col-sm-4 text-right">
                        <a href="javascript:;" data-toggle="modal" class="btn btn-primary pull-right site-add">
                            <span class="glyphicon glyphicon-plus"></span> 增加场地
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default site-list">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>场地名称</th>
                                <th>场地类型</th>
                                <th>备注</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="site" items="${list}" varStatus="p">
                                <tr>
                                    <td>${p.index}</td>
                                    <td>${site.siteName}</td>
                                    <td>${site.sportName}</td>
                                    <td>${site.siteRemark}</td>

                                    <c:if test="${site.siteStatus == 1}">
                                        <td class="text-success">开放</td>
                                    </c:if>
                                    <c:if test="${site.siteStatus == 2}">
                                        <td class="text-danger">关闭</td>
                                    </c:if>

                                    <td>${site.operatorName}</td>
                                    <td>${site.createTime}</td>
                                    <td>
                                        <a href="javascript:;" data-toggle="modal" class="btn btn-primary site-update"
                                           onclick="getSiteInfo('${site.siteId}')">
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

<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="siteModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="siteModalLabel">场地设置</h4>
            </div>
            <div class="modal-body">
                <form id="site_form" class="form-horizontal" onsubmit="return false;">
                    <input type="hidden" id="site_id" name="siteId">
                    <div class="form-group">
                        <label for="site_type" class="col-sm-2 control-label">
                            <span class="text-danger">*</span> 场地类型
                        </label>
                        <div class="col-sm-10">
                            <select class="form-control" id="site_type" name="siteType">
                                <c:forEach var="sport" items="${siteSportNames}">
                                    <c:if test="${sport.sportStatus == 1}">
                                        <option value="${sport.sportId}">${sport.sportName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site_name" class="col-sm-2 control-label">
                            <span class="text-danger">*</span> 场地名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site_name" name="siteName"
                                   placeholder="场地名称" autocomplete="off"
                                   data-val="true" data-val-required="场地名称不能为空">
                            <div data-valmsg-for="siteName" data-valmsg-replace="true"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site_remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="备注"
                                   id="site_remark" name="siteRemark">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site_status1" class="col-sm-2 control-label">
                            <span class="text-danger">*</span> 场地状态
                        </label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" id="site_status1" name="siteStatus" value="1" checked> 开放
                            </label>
                            <label class="radio-inline">
                                <input type="radio" id="site_status2" name="siteStatus" value="2"> 关闭
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary site-confirm">
                    <span class="glyphicon glyphicon-ok"></span> 确 定
                </button>
            </div>
        </div>
    </div>
</div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="site"/>
</c:import>
