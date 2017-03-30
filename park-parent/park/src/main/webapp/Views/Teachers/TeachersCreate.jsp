<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/style/common/style.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/teachers/teachers_create.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#member_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <form id="member_form" class="form-horizontal" novalidate onsubmit="return false;">
            <div class="panel panel-default">
                <div class="panel-heading">教师办卡</div>
                <div class="panel-body">
                    <input type="hidden" name="memberType" value="1">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="member_card_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 教师卡号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_card_no" name="tempCardNo"
                                       placeholder="教师卡号" value="${cardNo}"
                                       data-val="true" data-val-required="教师卡号不能为空" readonly>
                                <div data-valmsg-for="tempCardNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_mobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>

                            <div class="col-sm-8 input-parent-magnifier">
                                <input type="text" class="form-control input-element-magnifier" id="member_mobile"
                                       name="memberMobile" placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误" maxlength="11">
                                <div data-valmsg-for="memberMobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_birthday" class="col-sm-4 control-label">教师生日</label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="member_birthday" name="memberBirthday"
                                           placeholder="会员生日" autocomplete="off"
                                           data-val-regex-pattern="^\d{4}-\d{2}-\d{2}$"
                                           data-val-regex="会员生日格式错误" maxlength="10">
                                    <span class="input-group-btn">
                                        <button class="btn btn-success member-birthday-select">
                                            <i class="glyphicon glyphicon-calendar"></i> 日历
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="memberName" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 教师姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="memberName" name="memberName"
                                       placeholder="请输入教师姓名" autocomplete="off"
                                       data-val="true" data-val-required="教师姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,9}$"
                                       data-val-regex="教师姓名长度只能2~12个字符">
                                <div data-valmsg-for="memberName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_idcard" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 身份证号
                            </label>

                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="member_idcard" name="memberIdcard"
                                           placeholder="请输入18位身份证号" autocomplete="off"
                                           data-val="true" data-val-required="身份证号不能为空"
                                           data-val-regex-pattern="^\d{17}(\d|X|x)$"
                                           data-val-regex="身份证号格式错误" maxlength="18">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary">
                                            <i class="glyphicon glyphicon-transfer"></i> 读取
                                        </button>
                                    </span>
                                </div>
                                <div data-valmsg-for="memberIdcard" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberSex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 教师性别
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="memberSex" id="memberSex1" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="memberSex" id="memberSex2" value="2"> 女
                                </label>
                                <div data-valmsg-for="memberSex" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="memberAddress" class="col-sm-2 control-label">联系地址</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="memberAddress" name="memberAddress"
                                       placeholder="请输入联系地址">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberRemark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                            <textarea class="form-control" id="memberRemark" name="memberRemark" rows="3"
                                      placeholder="备注"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button type="button" class="btn btn-success col-sm-4 register-member"
                                        data-loading-text="提交中...">
                                    <span class="glyphicon glyphicon-ok"></span>  注册 & 办卡
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- 绑卡信息 -->
                    <input type="hidden" name="cardNo" value="${cardNo}">
                    <input type="hidden" name="memberId" value="">
                    <input type="hidden" name="cardTypeId" value="1">
                    <input type="hidden" name="cardBalance" value="0">
                    <input type="hidden" name="balanceStyle" value="1">
                    <input type="hidden" name="givingAmount" value="0">
                    <input type="hidden" name="cardRemark" value="教师卡免费">
                </div>
            </div>
        </form>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="教师办卡"/>
</c:import>
