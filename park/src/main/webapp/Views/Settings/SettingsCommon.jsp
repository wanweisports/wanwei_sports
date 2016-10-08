<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">基础设置</li>
        </ol>
        <form id="member_form" class="form-horizontal" action="/users/submitMembersAdd" method="post" novalidate>
            <div class="panel panel-default">
                <div class="panel-heading">基础设置</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="start_time" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 营业开始时间
                            </label>

                            <div class="col-sm-8">
                                <input type="time" class="form-control" id="start_time" name="start_time"
                                       placeholder="营业开始时间" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="end_time" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 营业结束时间
                            </label>

                            <div class="col-sm-8">
                                <input type="time" class="form-control" id="end_time" name="end_time"
                                       placeholder="营业结束时间" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group sc-ui-submit">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-ok"></span> 保 存
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
