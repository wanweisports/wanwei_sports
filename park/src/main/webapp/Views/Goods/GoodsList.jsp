<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />
 
     
<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">进销存管理</li>
        </ol>
        <div class="settings-filter">
            <form class="form-inline">
                <div class="form-group">
                    <label for="good_name">商品名称</label>
                    <input type="text" class="form-control" id="good_name" name="goodName"
                           placeholder="请输入商品名称">
                </div>
                <div class="form-group">
                    <label for="good_state">&nbsp;商品状态</label>
                    <select class="form-control" id="good_state" name="goodStatus">
                        <option value="">全部状态</option>
                        <option value="1">在售</option>
                        <option value="2">预售</option>
                        <option value="3">下架</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>&nbsp;</label>
                    <a href="javascript:;" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span> 检索商品
                    </a>
                </div>
            </form>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>库存数量</th>
                        <th>价格(元)</th>
                        <th>会员价格(元)</th>
                        <th>商品状态</th>
                        <th>操作人</th>
                        <th>操作时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach var="good" items="${list }">
	                    <tr>
	                        <td>${good.goodNo }</td>
	                        <td>${good.goodName }</td>
	                        <td>${good.goodCount }</td>
	                        <td>${good.goodPrice }</td>
	                        <td></td>
	                        
	                        <td>${good.goodStatus }</td>
	                        
	                        
	                        
	                        <td>${good.operatorName }</td>
	                        <td>${good.createTime }</td>
	                        <td>
	                            
	                            <c:if test="${good.goodStatus == 3}">
	                            	<a href="#xiajiaModal" class="btn btn-primary" data-toggle="modal" onclick="goodInOrOut('${good.goodId}', true)">
		                                <span class="glyphicon glyphicon-arrow-up"></span> 上架
		                            </a>
	                            </c:if>
	                            <c:if test="${good.goodStatus != 3}">
	                            	<a href="#xiajiaModal" class="btn btn-warning" data-toggle="modal" onclick="goodInOrOut('${good.goodId}', false)">
		                                <span class="glyphicon glyphicon-arrow-down"></span> 下架
		                            </a>
	                            </c:if>
	                            
	                            <a href="#kucunModal" class="btn btn-primary" data-toggle="modal" onclick="showGoodCount('${good.goodId}', '${good.goodCount }')">
	                                <span class="glyphicon glyphicon-hdd"></span> 增加库存
	                            </a>
	                            <a href="good/updateGood?goodId=${good.goodId }" class="btn btn-primary">
	                                <span class="glyphicon glyphicon-search"></span> 查看
	                            </a>
	                        </td>
	                    </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
                <nav class="pull-right">
                    <p class="pull-left" style="margin: 24px 14px;">
                        <span>10条/页</span>
                        <span>总143条</span>
                    </p>
                    <ul class="pagination pull-right">
                        <li><a href="javascript:;"><span>首页</span></a></li>
                        <li><a href="javascript:;"><span>上一页</span></a></li>
                        <li><a href="javascript:;">1</a></li>
                        <li class="active"><a href="javascript:;">2</a></li>
                        <li><a href="javascript:;">3</a></li>
                        <li><a href="javascript:;">...</a></li>
                        <li><a href="javascript:;">11</a></li>
                        <li><a href="javascript:;">12</a></li>
                        <li><a href="javascript:;">13</a></li>
                        <li><a href="javascript:;">14</a></li>
                        <li><a href="javascript:;">15</a></li>
                        <li><a href="javascript:;"><span>下一页</span></a></li>
                        <li><a href="javascript:;"><span>末页</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="kucunModal" tabindex="-1" role="dialog" aria-labelledby="kucunModalLabel">
    <div class="modal-dialog">
        <form class="modal-content" id="addGoodCount">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="kucunModalLabel">增加库存</h4>
            </div>
            <div class="modal-body" style="clear: both;">
                <div class="panel panel-default form-horizontal">
                	<input type="hidden" name="goodId" />
                    <div class="panel-body">
                        <div class="alert alert-info" role="alert">当前库存: <span id="nowGoodCount"></span>件</div>
                        <input type="text" class="form-control" name="goodCount" placeholder="请输入增加的库存量">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addGoodCount()">
                    <span class="glyphicon glyphicon-ok"></span> 确 认
                </button>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="shangjiaModal" tabindex="-1" role="dialog" aria-labelledby="shangjiaModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="shangjiaModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>商品成功上架!</p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="xiajiaModal" tabindex="-1" role="dialog" aria-labelledby="xiajiaModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="xiajiaModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>商品成功下架!</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />

<script>
	//上/下架
	function goodInOrOut(goodId, up){
		$.post("good/goodInOrOut", {goodId: goodId, up: up}, function(data){
			alert(JSON.stringify(data));
			window.location.reload(true);
		}, 'json');
	}
		
	//增加库存
	function showGoodCount(goodId, goodCount){
		$("input[name='goodId']").val(goodId);
		$("#nowGoodCount").html(goodCount);
	}
	
	function addGoodCount(){
		$.post("good/addGoodCount", $("#addGoodCount").serialize(), function(data){
			alert(JSON.stringify(data));
			window.location.reload(true);
		}, 'json');
	}
</script>
