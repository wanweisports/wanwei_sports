<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li><a href="/settings/systemUsers">用户设置</a></li>
            <li class="active">用户编辑</li>
        </ol>
        <form id="users_form" class="form-horizontal" action="/settings/submitSystemUsers" method="post" novalidate>
            <div class="panel panel-default">
                <div class="panel-heading">用户信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_account" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 用户账户
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_account" name="user_account"
                                       placeholder="用户账户" autocomplete="off"
                                       data-val="true" data-val-required="用户账户不能为空">
                                <div data-valmsg-for="user_account" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 用户姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_name" name="user_name"
                                       placeholder="用户姓名" autocomplete="off"
                                       data-val="true" data-val-required="用户姓名不能为空">
                                <div data-valmsg-for="user_name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_role" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 所属角色
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="user_role" name="user_role">
                                    <option value="1">系统管理员</option>
                                    <option value="2">经理</option>
                                    <option value="3">前台收银</option>
                                </select>
                                <div data-valmsg-for="user_role" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="start_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 生效日期
                            </label>

                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="start_date" name="start_date"
                                       placeholder="生效时间" autocomplete="off"
                                       data-val="true" data-val-required="生效时间不能为空">
                                <div data-valmsg-for="start_date" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="user_password" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 用户密码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_password" name="user_password"
                                       placeholder="用户密码" autocomplete="off"
                                       data-val="true" data-val-required="用户密码不能为空">
                                <div data-valmsg-for="user_password" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">&nbsp;</label>
                        </div>
                        <div class="form-group">
                            <label for="user_department" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 所属部门
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="user_department" name="user_department">
                                    <option value="1">运营中心</option>
                                    <option value="2">技术部</option>
                                </select>
                                <div data-valmsg-for="user_department" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="end_date" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 截止日期
                            </label>

                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="end_date" name="end_date"
                                       placeholder="截止日期" autocomplete="off"
                                       data-val="true" data-val-required="截止日期不能为空">
                                <div data-valmsg-for="end_date" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary col-sm-4">
                                    <span class="glyphicon glyphicon-ok"></span> 设置用户
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
