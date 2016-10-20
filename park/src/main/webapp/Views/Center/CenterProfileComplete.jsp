<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/passport/passport_profile.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#center_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>通行证</span> &gt;&gt; <span>完善信息</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="center_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">完善信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_name" name="user_name"
                                       placeholder="请输入姓名" autocomplete="off"
                                       data-val="true" data-val-required="姓名不能为空">
                                <div data-valmsg-for="user_name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_mobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_mobile" name="user_mobile"
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="user_mobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_birthday" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 生日
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="user_birthday" name="userBirthday"
                                           data-val="true" data-val-required="生日不能为空" placeholder="生日">
                                    <span class="input-group-addon user-birthday-select">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                    </span>
                                </div>
                                <div data-valmsg-for="userBirthday" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_idcard" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 身份证号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_idcard" name="user_idcard"
                                       placeholder="请输入18位身份证号" autocomplete="off"
                                       data-val="true" data-val-required="身份证号不能为空"
                                       data-val-regex-pattern="^\d{18}$|^\d{17}(\d|X|x)$"
                                       data-val-regex="身份证号格式错误">
                                <div data-valmsg-for="user_idcard" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_sex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员性别
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="user_sex" id="user_sex1" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="user_sex" id="user_sex2" value="2"> 女
                                </label>
                                <div data-valmsg-for="user_sex" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="user_address" class="col-sm-2 control-label">联系地址</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="user_address" name="user_address"
                                       placeholder="请输入联系地址">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary profile-submit">
                                    <span class="glyphicon glyphicon-ok"></span> 完善信息
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="passport"/>
    <c:param name="subNav" value="profile"/>
</c:import>
