<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/goods/goods_settings.js?v=${static_resource_version}"></script>
    <script>
        // 配置表单校验
        $(document).ready(function () {
            $('#good_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>
<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <iframe id="good_form_target" name="goodFormTarget" style="display: none;"></iframe>
        <form id="good_form" class="form-horizontal" action="/good/saveGood" method="post" novalidate
              enctype="multipart/form-data" target="goodFormTarget">
            <input type="hidden" id="goodId" name="goodId" value="${goodId}">
            <div class="panel panel-default">
                <div class="panel-heading">商品信息</div>
                <div class="panel-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="good_no" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品编号
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_no" name="goodNo"
                                       value="${goodNo}" placeholder="商品编号" autocomplete="off"
                                       data-val="true" data-val-required="商品编号不能为空">
                                <div data-valmsg-for="goodNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_price" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品价格
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_price" name="goodPrice"
                                       value="${goodPrice}" placeholder="商品价格" autocomplete="off"
                                       data-val="true" data-val-required="商品价格不能为空"
                                       data-val-regex-pattern="^[1-9]\d*$"
                                       data-val-regex="商品价格格式错误">
                                <div data-valmsg-for="goodPrice" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_pic" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品图片
                            </label>

                            <div class="col-sm-8">
                                <input type="file" id="good_pic" name="file" accept="image/*"
                                       value="" placeholder="商品图片" autocomplete="off"
                                       data-val="true" data-val-required="商品图片不能为空">
                                <div data-valmsg-for="goodPic" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="good_name" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品名称
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_name" name="goodName"
                                       value="${goodName}" placeholder="商品名称" autocomplete="off"
                                       data-val="true" data-val-required="商品名称不能为空">
                                <div data-valmsg-for="goodName" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_mode1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 计费方式
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="goodMoneyType" id="good_mode1" value="1" checked> 计次收费
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="goodMoneyType" id="good_mode2"
                                           value="2" <c:if test="${goodMoneyType == 2}">checked</c:if>> 计时收费
                                </label>
                                <div data-valmsg-for="goodMoneyType" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_discount1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品折扣
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="goodDiscount" id="good_discount1" value="1" checked> 无折扣
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="goodDiscount" id="good_discount2"
                                           value="2" <c:if test="${goodDiscount == 2}">checked</c:if>> 会员折扣
                                </label>
                                <div data-valmsg-for="goodDiscount" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="good_remark" class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-10">
                            <textarea class="form-control" id="good_remark" name="goodRemark" rows="3"
                                      placeholder="备注">${goodRemark}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <p class="sc-submit-tips"></p>
                                <button type="button" class="btn btn-primary col-sm-4 goods-setting">
                                    <span class="glyphicon glyphicon-ok"></span> 设置商品
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</layout:override>

<c:if test="${goodId > 0}">
    <c:import url="../Shared/Layout_New.jsp">
        <c:param name="nav" value="good"/>
        <c:param name="subNav" value="stock"/>
    </c:import>
</c:if>

<c:if test="${!goodId}">
    <c:import url="../Shared/Layout_New.jsp">
        <c:param name="nav" value="good"/>
        <c:param name="subNav" value="setting"/>
    </c:import>
</c:if>