<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li><a href="/goods/stockManagement">进销存管理</a></li>
            <li class="active">商品设置</li>
        </ol>
        <form id="good_form" class="form-horizontal" action="/goods/submitGoodsSettings" method="post" novalidate>
            <div class="panel panel-default">
                <div class="panel-heading">商品信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="good_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_name" name="good_name"
                                       placeholder="商品名称" autocomplete="off"
                                       data-val="true" data-val-required="商品名称不能为空"
                                       value="<%= good.good_name %>">
                                <div data-valmsg-for="good_name" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_mode1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 计费方式
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="good_mode" id="good_mode1" value="1" checked> 计次收费
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="good_mode" id="good_mode2" value="2"> 计时收费
                                </label>
                                <div data-valmsg-for="good_mode" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_discount1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品折扣
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="good_discount" id="good_discount1" value="2" checked> 无折扣
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="good_discount" id="good_discount2" value="1"> 会员折扣
                                </label>
                                <div data-valmsg-for="good_discount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="good_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品编号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_no" name="good_no"
                                       placeholder="商品编号" autocomplete="off"
                                       data-val="true" data-val-required="商品编号不能为空"
                                       value="<%= good.good_no %>">
                                <div data-valmsg-for="good_no" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_price" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品价格
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_price" name="good_price"
                                       placeholder="商品编号" autocomplete="off"
                                       data-val="true" data-val-required="商品价格不能为空"
                                       value="<%= good.good_price %>">
                                <div data-valmsg-for="good_price" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="good_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                            <textarea class="form-control" id="good_remark" name="good_remark" rows="3"
                                      placeholder="备注"></textarea>
                            </div>
                        </div>
                        <div class="form-group sc-ui-submit">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="submit" class="btn btn-primary col-sm-4">
                                    <span class="glyphicon glyphicon-ok"></span> 更新商品信息
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
