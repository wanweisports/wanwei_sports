<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
     
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">场地类型</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="#myModal" data-toggle="modal" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> 增加场地类型
                    </a>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>场地类型</th>
                                <th>单价(元)</th>
                                <th>预订押金(元)</th>
                                <th>开放时间</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var="sport" items="${list }">
	                            <tr>
	                                <td>${sport.sportId }</td>
	                                <td>${sport.sportName }</td>
	                                <td>${sport.sportMoney }</td>
	                                <td>${sport.sportDeposit }</td>
	                                <td>${sport.startTime }-${sport.endTime }</td>
	                                
	                                <td class="text-success">${sport.sportStatus }</td>
	                                
	                                <td>${sport.operatorName }</td>
	                                <td>${sport.createTime }</td>
	                                <td>
	                                    <a href="#myModal" data-toggle="modal" data-original-title="" class="btn btn-primary" onclick="getSiteSport('${sport.sportId}')">
	                                        <i class="glyphicon glyphicon-edit"></i> 修改
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
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">设置场地类型</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地类型</label>
                        <input type="hidden" name="sportId" />
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="场地类型" name="sportName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">单价/小时</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="单价/小时" name="sportMoney">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">预订押金</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="预订押金" name="sportDeposit">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开放时间</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" placeholder="开始时间" name="startTime">
                        </div>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" placeholder="结束时间" name="endTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类型状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sportStatus" value="1" checked> 开放
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sportStatus" value="2"> 关闭
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn_add">
                    <span class="glyphicon glyphicon-ok"></span> 确 定
                </button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />

<script type="text/javascript">
	$(function(){
		//新建/修改场地类型
		$("#btn_add").click(function (){
			        //接口名                 form表单对象               回调函数
			$.post("site/saveSiteSport", $(".form-horizontal").serialize(), function(d){
				alert(JSON.stringify(d));
				if(d.code == 1){ //操作成功
					window.location.reload(true);
				}
			}, 'json');
		});
	});
	
	//获取单个场地类型
	function getSiteSport(sportId){
		$.post("site/getSiteSport", {sportId: sportId}, function(d){
			var data = d.data;
			$.each(data, function(key, item){
				$(".form-horizontal").find("*[name='"+key+"']").not(":radio").val(item);
			});
			$(".form-horizontal").find("input[name='sportStatus'][value='"+data.sportStatus+"']").prop("checked", true);
		});
	}
</script>