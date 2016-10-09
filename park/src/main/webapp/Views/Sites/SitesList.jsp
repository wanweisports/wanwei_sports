<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
     
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">场地设置</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline col-sm-8">
                        <div class="form-group">
                            <label>场地类型</label>
                            <select class="form-control">
                                <option>全部类型</option>
                                <c:forEach var="sport" items="${siteSportNames}">
                                	<option value="${sport.sportId}">${sport.sportName}</option>
                                </c:forEach>
                            </select>
                            <a href="site/getSiteSports" class="btn btn-info">
                                <span class="glyphicon glyphicon-plus"></span>
                            </a>
                        </div>
                        <div class="form-group">
                            <label>场地名称</label>
                            <input type="text" class="form-control" placeholder="场地名称" name="siteName">
                        </div>
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span> 检索
                            </a>
                        </div>
                    </form>
                    <div class="col-sm-4 text-right">
                        <a href="#myModal" data-toggle="modal" data-original-title="" class="btn btn-primary pull-right">
                            <span class="glyphicon glyphicon-plus"></span> 增加场地
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>场地名称</th>
                                <th>场地类型</th>
                                <th>备注</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var="site" items="${list}">
                            	<tr>
	                                <td>${site.siteId }</td>
	                                <td>${site.siteName }</td>
	                                <td>${site.sportName }</td>
	                                <td>${site.siteRemark }</td>
	                                
	                                <td class="text-success">${site.siteStatus }</td>
	                                
	                                <td>${site.operatorName }</td>
	                                <td>${site.createTime }</td>
	                                <td>
	                                    <a href="#myModal" data-toggle="modal" data-original-title="" class="btn btn-primary" onclick="getSiteInfo('${site.siteId}')">
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
                <h4 class="modal-title" id="exampleModalLabel">场地编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地类型</label>
                        <input type="hidden" name="siteId"  />
                        <div class="col-sm-10">
                            <select class="form-control" name="siteType">
                                <c:forEach var="sport" items="${siteSportNames}">
                                	<c:if test="${sport.sportStatus == 1}">
                                		<option value="${sport.sportId}">${sport.sportName}</option>
                                	</c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="场地名称" name="siteName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="备注" name="siteRemark">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="siteStatus" value="1" checked> 开放
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="siteStatus" value="2"> 关闭
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
