<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">新会员注册</li>
        </ol>
        <form id="member_form" class="form-horizontal" action="#" method="post" novalidate>
            <div class="panel panel-default">
                <div class="panel-heading">会员信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="cardNo" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员卡号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="cardNo" name="cardNo"
                                       placeholder="会员卡号" value="${cardNo}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberType1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 支付类型
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="memberType" id="memberType1" value="1" checked> 预付类型
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="memberType" id="memberType2" value="2"> 记账类型
                                </label>
                                <div data-valmsg-for="payment_type" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_mobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_mobile" name="memberMobile"
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误" value="">
                                <div data-valmsg-for="member_mobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="member_mobile2" class="col-sm-4 control-label">备用手机</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="member_mobile2" name="memberMobile2"
                                       placeholder="请输入备用手机号码" autocomplete="off"
                                       data-val="true" data-val-required="备用手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="备用手机号码格式错误">
                                <div data-valmsg-for="member_mobile2" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="memberName" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员姓名
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="memberName" name="memberName"
                                       placeholder="请输入会员姓名" autocomplete="off"
                                       data-val="true" data-val-required="会员姓名不能为空"
                                       data-val-regex-pattern="^[A-Za-z\u4e00-\u9fa5][A-Za-z0-9\u4e00-\u9fa5_]{1,10}$"
                                       data-val-regex="会员姓名长度只能2~12个字符">
                                <div data-valmsg-for="memberName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberIdcard" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 身份证号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="memberIdcard" name="memberIdcard"
                                       placeholder="请输入18位身份证号" autocomplete="off"
                                       data-val="true" data-val-required="身份证号不能为空"
                                       data-val-regex-pattern="^\d{18}$|^\d{17}(\d|X|x)$"
                                       data-val-regex="身份证号格式错误">
                                <div data-valmsg-for="memberIdcard" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberBirthday" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员生日
                            </label>

                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="memberBirthday" name="memberBirthday"
                                       placeholder="请选择会员生日" autocomplete="off"
                                       data-val="true" data-val-required="会员生日不能为空">
                                <div data-valmsg-for="memberBirthday" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberSex1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 会员性别
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
                        <div class="form-group sc-ui-submit">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="button" class="btn btn-primary" id="btn_reg">
                                    <span class="glyphicon glyphicon-ok"></span>  注册 & 绑卡
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
<script src="Content/app/members/users_members.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />

<script type="text/javascript">
	$(function(){
		$("#btn_reg").click(function (){
			              //接口名                 form表单对象               回调函数
			$.requestHttp("member/saveMember", $("#member_form"), function(d){
				alert(JSON.stringify(d));
				if(d.code == 1){ //操作成功
					window.location.href = 'member/membersInfoCar?cardNo='+'${cardNo}&memberId='+d.data.memberId;
				}
			});
		});
	});
</script>