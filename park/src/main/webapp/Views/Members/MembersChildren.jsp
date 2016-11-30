<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/members/members_children.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#member_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员查询</span> &gt;&gt; <span>子会员管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">主会员信息</div>
            <div class="panel-body form-horizontal">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="card_no" class="col-sm-4 control-label">会员卡号</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="card_no" name="cardNo"
                                   placeholder="会员卡号" value="${member.cardNo}" disabled>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="member_name" class="col-sm-4 control-label">会员姓名</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="member_name" name="memberName"
                                   placeholder="会员姓名" value="${member.memberName}" disabled>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">子会员列表</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table member-children-list">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>会员姓名</th>
                                <th>手机号码</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${childrenMembers}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${user.memberName}</td>
                                    <td>${user.memberMobile}</td>
                                    <td>
                                        <a class="btn btn-danger children-delete" href="javascript:;"
                                            data-id="${user.memberId}">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
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
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">子会员添加</div>
                <div class="panel-body">
                    <form id="member_form" class="form-horizontal" onsubmit="return false;">
                        <input type="hidden" name="parentMemberId" value="${member.memberId}">
                        <div class="form-group">
                            <label for="child_member_name" class="col-sm-2 control-label">会员姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="child_member_name" name="memberName"
                                       placeholder="请输入会员姓名" autocomplete="off"
                                       data-val="true" data-val-required="会员姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                       data-val-regex="会员姓名长度只能2~12个字符">
                                <div data-valmsg-for="memberName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="child_member_mobile" class="col-sm-2 control-label">手机号码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="child_member_mobile" name="memberMobile"
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误">
                                <div data-valmsg-for="memberMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button type="button" class="btn btn-primary col-sm-4 confirm-member">
                                    <span class="glyphicon glyphicon-ok"></span> 确 认
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="list"/>
</c:import>
