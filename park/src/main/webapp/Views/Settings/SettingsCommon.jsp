<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/settings/settings_common.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/dist/settings/settings_common.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#common_form').validate({
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
            <li class="active">基础设置</li>
        </ol>
        <form id="common_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">基础设置</div>
                <div class="panel-body">
                    <div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="start_time" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 营业开始时间
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="start_time" name="startTime"
                                           placeholder="请输入营业开始时间" autocomplete="off"
                                           data-val="true" data-val-required="营业开始时间不能为空"
                                           data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                           data-val-regex="营业开始时间格式错误">
                                    <div data-valmsg-for="startTime" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="end_time" class="col-sm-4 control-label">
                                    <span class="text-danger">*</span> 营业结束时间
                                </label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="end_time" name="endTime"
                                           placeholder="请输入营业结束时间" autocomplete="off"
                                           data-val="true" data-val-required="营业结束时间不能为空"
                                           data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                           data-val-regex="营业结束时间格式错误">
                                    <div data-valmsg-for="endTime" data-valmsg-replace="true"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group sc-ui-submit">
                            <div class="col-sm-offset-4 col-sm-4">
                                <p class="sc-submit-tips"></p>
                                <button type="button" class="btn btn-primary common-save" style="width: 100%">
                                    <span class="glyphicon glyphicon-ok"></span>  保 存
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="tips_modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="tipsModalLabel">提示框</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-success tips-content" role="alert">常用设置保存成功!</div>
            </div>
        </div>
    </div>
</div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="base"/>
</c:import>
