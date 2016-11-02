<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/passport/passport_modify_password.js?v=${static_resource_version}"></script>
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
    当前位置: <span>通行证</span> &gt;&gt; <span>密码重置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="center_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">密码重置</div>
                <div class="panel-body">
                    <div class="col-sm-offset-2 col-sm-8">
                        <div class="form-group">
                            <label for="user_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 原始密码
                            </label>

                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="user_password" name="oldPwd"
                                       placeholder="请输入原始密码" autocomplete="off"
                                       data-val="true" data-val-required="原始密码不能为空">
                                <div data-valmsg-for="oldPwd" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 新密码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="new_password" name="newPwd"
                                       placeholder="请输入新密码" autocomplete="off"
                                       data-val="true" data-val-required="新密码不能为空">
                                <div data-valmsg-for="newPwd" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 确认密码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="confirm_password" name="confirmPwd"
                                       placeholder="请选择确认密码" autocomplete="off"
                                       data-val="true" data-val-required="确认密码不能为空">
                                <div data-valmsg-for="confirmPwd" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary password-confirm">
                                    <span class="glyphicon glyphicon-ok"></span> 确 定
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="passport"/>
    <c:param name="subNav" value="password"/>
</c:import>
