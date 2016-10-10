<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">商品销售</li>
        </ol>
        <div class="row" style="margin-bottom: 10px">
            <div class="col-sm-12 col-md-10">
                <div class="btn-group btn-group-justified">
                    <div class="btn-group">
                        <button type="button" class="btn btn-info">全部商品</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">饮料类</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">食品类</button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">服饰类</button>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-2">
                <a href="good/getGoodsCart" class="btn btn-primary pull-right">
                    <span class="glyphicon glyphicon-shopping-cart"></span> 购物车
                    <span class="badge">42</span>
                </a>
            </div>
        </div>
        <div class="row">
            <c:forEach var="good" items="${goods }">
	            <div class="col-sm-4 col-md-3">
	                <div class="thumbnail">
	                    <img src="${good.goodPic }" alt="${good.goodName }">
	                    <div class="caption">
	                        <p>${good.goodName }</p>
	                        <p>${good.goodPrice }元/件</p>
	                        <p><a href="javascript:;" class="btn btn-primary">加入购物车</a></p>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />