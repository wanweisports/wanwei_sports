<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<base href="<%=basePath%>"> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>万维体育 wanweitiyu.com - 智能场馆运营的革命</title>

    <meta name="description" content="">
    <meta name="keywords" content="万维体育,wanweitiyu,智能体育场馆,体育场馆,预订,收银,万维">
    <meta name="author" content="北京万维体育">
	
	<jsp:include page="/Views/Common/Resources.jsp" /> <%-- 引用公共资源 --%>

</head>
<body>
    <div class="container-fluid">
        <header class="ww-header">
    <div class="header">
        <div class="ww-logo">
            <img src="content/images/logo.png" class="logo-icon">
        </div>
        <ul class="ww-nav">
            <li class="nav-home ">
                <a href="/">
                    <img src="content/images/navigator/home.png">
                    <span>工作面板</span>
                </a>
            </li>
            <li class="nav-active">
                <a href="javascript:;">
                    <img src="content/images/navigator/users.png"> 
                    <span>会员管理</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/users/membersAdd">新会员注册</a></li>
                    <li><a href="/users/membersQuery">会员查询</a></li>
                    <li><a href="/users/membersTicket">发票登记</a></li>
                    <li><a href="/users/membersCategory">会员类型设置</a></li>
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="content/images/navigator/venue.png">
                    <span>场地预订</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/venue/sequenceReserve">现场预订</a></li>
                    <li><a href="/venue/batchReserve">批量预订</a></li>
                    <!--<li><a href="#">包场预订</a></li>-->
                    <li><a href="/venue/sequencePDA">热点概率分析</a></li>
                    <li><a href="/venue/sportsSettings">场地类型</a></li>
                    <li><a href="/venue/sitesSettings">场地设置</a></li>
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="content/images/navigator/cart.png">
                    <span>商品管理</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/goods/settings">商品设置</a></li>
                    <li><a href="/goods/stockManagement">进销存管理</a></li>
                    <li><a href="/goods/market">商品销售</a></li>
                    <!--<li><a href="#">商品订单</a></li>-->
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="content/images/navigator/chart.png">
                    <span>数据统计</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="/data/membersRegister">会员注册统计</a></li>
                    <!--<li><a href="/data/orderLogs">订单日志统计</a></li>-->
                    <!--<li><a href="/data/performanceEvaluation">用户业绩统计</a></li>-->
                    <li><a href="/data/businessIncome">营业收入统计</a></li>
                    <!--<li><a href="/data/venuePercentage">场地利用率统计</a></li>-->
                    <li><a href="/data/membersAttendance">签到记录</a></li>
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="content/images/navigator/settings.png">
                    <span>系统设置</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="#">用户设置</a></li>
                    <li><a href="#">角色设置</a></li>
                    <li><a href="/settings/common">基础设置</a></li>
                    <li><a href="#">场地设置</a></li>
                    <li><a href="#">会员设置</a></li>
                    <li><a href="#">通知设置</a></li>
                    <li><a href="#">数据库导入导出</a></li>
                </ul>
            </li>
            <li class="">
                <a href="javascript:;">
                    <img src="content/images/navigator/user.png">
                    <span>个人中心</span>
                </a>
                <ul class="nav-sub">
                    <li><a href="#">个人信息</a></li>
                    <li><a href="#">忘记密码</a></li>
                    <li><a href="#">消息记录</a></li>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>

        
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
                                       placeholder="会员卡号" value="A6E570878344477F8BFEF645FC3635B5" readonly>
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
                            <label for="memberMobile" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 手机号码
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="memberMobile" name="member_mobile"
                                       placeholder="请输入手机号码" autocomplete="off"
                                       data-val="true" data-val-required="手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="手机号码格式错误" value="">
                                <div data-valmsg-for="member_mobile" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="memberMobile2" class="col-sm-4 control-label">备用手机</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="memberMobile2" name="memberMobile2"
                                       placeholder="请输入备用手机号码" autocomplete="off"
                                       data-val="true" data-val-required="备用手机号码不能为空"
                                       data-val-regex-pattern="^1\d{10}$"
                                       data-val-regex="备用手机号码格式错误">
                                <div data-valmsg-for="memberMobile2" data-valmsg-replace="true"></div>
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
                                    <span class="glyphicon glyphicon-ok"></span> 注册会员
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

    </div>

    <!--<script src="content/app/common/jquery.capacityFixed.js"></script>-->
    <script>
        $(document).ready(function(){
            //$(".ww-header").capacityFixed();

            $(".ww-nav > li").not(".nav-home").hover(function () {
                $(this).addClass("nav-moon");
            }, function () {
                $(this).removeClass("nav-moon");
            });
            
            //注册会员
            $("#btn_reg").click(function(){
            	$.requestHttp("member/saveMember.do", $("#member_form"), function(data){
            		alert(JSON.stringify(data));
            	});
            });
            
        });
        
    </script>
    
<!--SCRIPT_PLACEHOLDER-->

</body>
</html>
