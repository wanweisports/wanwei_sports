<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">修改密码</li>
        </ol>
        <form id="center_form" class="form-horizontal" action="/center/submitPasswordModification" method="post" novalidate>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-sm-offset-2 col-sm-8">
                        <div class="form-group">
                            <label for="user_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 原始密码
                            </label>

                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="user_password" name="user_password"
                                       placeholder="请输入原始密码" autocomplete="off"
                                       data-val="true" data-val-required="原始密码不能为空">
                                <div data-valmsg-for="user_password" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 新密码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="new_password" name="new_password"
                                       placeholder="请输入新密码" autocomplete="off"
                                       data-val="true" data-val-required="新密码不能为空">
                                <div data-valmsg-for="new_password" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 确认密码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="confirm_password" name="confirm_password"
                                       placeholder="请选择确认密码" autocomplete="off"
                                       data-val="true" data-val-required="确认密码不能为空">
                                <div data-valmsg-for="confirm_password" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group sc-ui-submit">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-ok"></span> 完善信息
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
