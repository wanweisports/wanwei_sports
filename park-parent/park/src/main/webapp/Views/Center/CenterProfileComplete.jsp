<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/common/style.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/passport/passport_profile.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#center_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="center_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">完善信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工编号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_no" name="operatorNo"
                                       placeholder="员工编号" autocomplete="off" value="${operatorNo}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_name" name="operatorName"
                                       placeholder="请输入姓名" autocomplete="off"
                                       data-val="true" data-val-required="姓名不能为空" value="${operatorName}">
                                <div data-valmsg-for="operatorName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_birthday" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工生日
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="user_birthday" name="operatorBirthday"
                                           data-val="true" data-val-required="生日不能为空" placeholder="生日"
                                           value="${operatorBirthday}"
                                           data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                           data-val-regex="联系电话格式错误" maxlength="10">
                                    <span class="input-group-addon user-birthday-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="operatorBirthday" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_account" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 登录账号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_account" name="operatorId"
                                       placeholder="登录账号" autocomplete="off" value="${operatorId}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_sex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 员工性别
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="operatorSex" id="user_sex1" value="1"
                                        <c:if test="${operatorSex == 1}">checked</c:if>> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="operatorSex" id="user_sex2" value="2"
                                       <c:if test="${operatorSex == 2}">checked</c:if>> 女
                                </label>
                                <div data-valmsg-for="operatorSex" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_mobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 联系电话
                            </label>

                            <div class="col-sm-8 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="user_mobile" name="operatorMobile"
                                       placeholder="请输入联系电话" autocomplete="off"
                                       data-val="true" data-val-required="联系电话不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="联系电话格式错误" value="${operatorMobile}" maxlength="11">
                                <div data-valmsg-for="operatorMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="user_address" class="col-sm-2 control-label">联系地址</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="user_address" name="operatorAddress"
                                       placeholder="请输入联系地址" value="${operatorAddress}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="text-center">
                                <button type="button" class="btn btn-success profile-submit">
                                    <span class="glyphicon glyphicon-ok"></span> 保 存
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="个人资料"/>
</c:import>
