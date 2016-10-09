<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
<link href="Content/style/venue/venue_sequence_reserve.css" rel="stylesheet" type="text/css"> 
     
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">现场预订</li>
        </ol>
        <div class="panel panel-default sequence-filter">
            <div class="panel-body">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="javascript:;">今天(08-02)</a></li>
                                <li><a href="javascript:;">明天(08-03)</a></li>
                                <li><a href="javascript:;">周四(08-04)</a></li>
                                <li><a href="javascript:;">周五(08-05)</a></li>
                                <li><a href="javascript:;">周六(08-06)</a></li>
                                <li><a href="javascript:;">周日(08-07)</a></li>
                                <li><a href="javascript:;">周一(08-08)</a></li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="glyphicon glyphicon-calendar"></span> 其他日期
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <form class="form-inline">
                    <div class="form-group">
                        <label>场地状态</label>

                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="1" checked>
                            未付款
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="2" checked>
                            已付款
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="3" checked>
                            已锁定
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="venue_state" value="4" checked>
                            不可预订
                        </label>
                    </div>
                    <div class="form-group">
                        <label>用户类型</label>

                        <label class="checkbox-inline">
                            <input type="checkbox" name="user_state" value="1" checked>
                            会员
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="user_state" value="2" checked>
                            散客
                        </label>
                    </div>
                    <div class="form-group pull-right">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-lock"></span> 锁场
                        </button>
                        <button type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-ok"></span> 预订
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="sequence-show">
            <table class="table table-bordered venue-large" id="timing_table">
                <tr class="timing-header">
                    <td></td>
                    <td>场地1</td>
                    <td>场地2</td>
                    <td>场地3</td>
                    <td>场地4</td>
                    <td>场地5</td>
                    <td>场地6</td>
                    <td>场地7</td>
                    <td>场地8</td>
                    <td>场地9</td>
                    <td>场地10</td>
                </tr>
                <tr class="timing-body">
                    <td class="time">08:00 ~ 09:00</td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                    <td class="selected"></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">09:00 ~ 10:00</td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                    <td class="ordered mobile"><span>王*</span><span>*3462</span></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">10:00 ~ 11:00</td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                    <td class="ordered phone"><span>散客</span><span>*9872</span></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">11:00 ~ 12:00</td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                    <td class="locked"></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">12:00 ~ 13:00</td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">13:00 ~ 14:00</td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                    <td class="ordered computer"><span>散客</span><span>*2158</span></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">14:00 ~ 15:00</td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">15:00 ~ 16:00</td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                    <td class="unpaid computer"><span>李*</span><span>*2158</span></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">16:00 ~ 17:00</td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                    <td class="disabled"></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">17:00 ~ 18:00</td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                    <td class="ordered mobile"><span>散客</span><span>*2158</span></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">19:00 ~ 20:00</td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">20:00 ~ 21:00</td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                </tr>
                <tr class="timing-body">
                    <td class="time">21:00 ~ 22:00</td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                    <td class="null"></td>
                </tr>
            </table>
        </div>
        <div class="panel panel-default sequence-tips">
            <div class="panel-body">
                <span class="unpaid">未付款</span>
                <span class="ordered">已付款</span>
                <span class="locked">已锁定</span>
                <span class="disabled">不可预订</span>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />

<script>
	$(function(){
		//新建/修改场地
		$("#btn_add").click(function(){
			$.post("site/saveSiteInfo", $(".form-horizontal").serialize(), function(d){
				alert(JSON.stringify(d));
				if(d.code == 1){ //操作成功
					window.location.reload(true);
				}
			}, 'json');
		});
	});
	
	//获取单个场地
	function getSiteInfo(siteId){
		$.post("site/getSiteInfo", {siteId: siteId}, function(d){
			var data = d.data;
			$.each(data, function(key, item){console.log(key+":"+item)
				$(".form-horizontal").find("*[name='"+key+"']").not(":radio").val(item);
			});
			$(".form-horizontal").find("input[name='siteStatus'][value='"+data.siteStatus+"']").prop("checked", true);
		});
	}
</script>
