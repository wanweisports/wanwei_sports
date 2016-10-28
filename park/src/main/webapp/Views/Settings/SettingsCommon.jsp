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
    <script src="/Content/app/settings/settings_common.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#common_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>系统设置</span> &gt;&gt; <span>场馆基础设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">场馆基础设置</div>
            <div class="panel-body">
                <form id="common_form" class="form-horizontal" novalidate onsubmit="return false;">
                    <input type="hidden" name="businessId" value="${businessId}">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="site_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 场馆名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="site_name" name="businessName"
                                       placeholder="请输入场馆名称" autocomplete="off" value="${businessName}"
                                       data-val="true" data-val-required="场馆名称不能为空">
                                <div data-valmsg-for="businessName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="site_province" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 所在省市
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="site_province" name="businessAreaName"
                                       placeholder="请输入所在省市" autocomplete="off" value="${businessAreaName}"
                                       data-val="true" data-val-required="所在省市不能为空">
                                <div data-valmsg-for="businessAreaName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="start_time" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 营业开始时间
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="start_time" name="businessStartTime"
                                       placeholder="请输入营业开始时间" autocomplete="off" value="${businessStartTime}"
                                       data-val="true" data-val-required="营业开始时间不能为空"
                                       data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                       data-val-regex="营业开始时间格式错误">
                                <div data-valmsg-for="businessStartTime" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="end_time" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 营业结束时间
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="end_time" name="businessEndTime"
                                       placeholder="请输入营业结束时间" autocomplete="off" value="${businessEndTime}"
                                       data-val="true" data-val-required="营业结束时间不能为空"
                                       data-val-regex-pattern="^(([0-1]\d)|(2[0-3])):[0-5]\d$"
                                       data-val-regex="营业结束时间格式错误">
                                <div data-valmsg-for="businessEndTime" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="site_contact" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系人
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="site_contact" name="businessContact"
                                       placeholder="请输入联系人" autocomplete="off" value="${businessContact}"
                                       data-val="true" data-val-required="联系人不能为空">
                                <div data-valmsg-for="businessContact" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="site_phone" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系电话
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="site_phone" name="businessPhone"
                                       placeholder="请输入联系电话" autocomplete="off" value="${businessPhone}"
                                       data-val="true" data-val-required="联系电话不能为空"
                                       data-val-regex-pattern="^110\d{8}$"
                                       data-val-regex="联系人格式错误">
                                <div data-valmsg-for="businessPhone" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="site_address" class="col-sm-2 control-label">
                                <span class="text-danger">*</span> 详细地址
                            </label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="site_address" name="businessAddress"
                                       placeholder="请输入详细地址" autocomplete="off" value="${businessAddress}"
                                       data-val="true" data-val-required="详细地址不能为空">
                                <div data-valmsg-for="businessAddress" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button type="button" class="btn btn-primary col-sm-4 common-save">
                                    <span class="glyphicon glyphicon-ok"></span>  保 存
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success tips-content" role="alert">常用设置保存成功!</div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="base"/>
</c:import>
