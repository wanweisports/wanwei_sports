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

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>商品管理</span> &gt;&gt; <span>商品设置</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <iframe id="good_form_target" name="goodFormTarget" style="display: none;"></iframe>
        <form id="good_form" class="form-horizontal" action="/good/saveGood" method="post" novalidate
              enctype="multipart/form-data" target="goodFormTarget">
            <div class="panel panel-default">
                <div class="panel-heading">商品设置</div>
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
                                <!--<div class="input-group">
                                    <input type="text" class="form-control" id="good_no" name="goodNo"
                                           value="${goodNo}" placeholder="商品编号" autocomplete="off"
                                           data-val="true" data-val-required="商品编号不能为空">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary">读 取</button>
                                    </span>
                                </div>-->
                                <div data-valmsg-for="goodNo" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_price" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品价格
                            </label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_price" name="goodPrice"
                                       value="${goodPrice}" placeholder="商品价格,例如10.00" autocomplete="off"
                                       data-val="true" data-val-required="商品价格不能为空"
                                       data-val-regex-pattern="^(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                       data-val-regex="商品价格格式错误">
                                <div data-valmsg-for="goodPrice" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">商品图片</label>

                            <div class="col-sm-8">
                                <input type="file" id="good_pic" name="file" accept="image/*" value=""
                                       placeholder="商品图片" autocomplete="off" style="font-size: 12px;">
                                <div data-valmsg-for="goodPic" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_count" class="col-sm-4 control-label">初始库存量</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="good_count" name="goodCount"
                                       value="${goodCount}" placeholder="初始库存量" autocomplete="off"
                                       data-val-regex-pattern="^[1-9]\d*$"
                                       data-val-regex="初始库存量格式错误">
                                <div data-valmsg-for="goodCount" data-valmsg-replace="true"></div>
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
                            <label for="good_type" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 商品类别
                            </label>

                            <div class="col-sm-8">
                                <select class="form-control" id="good_type" name="goodTypeId"
                                        data-val="true" data-val-required="请选择商品类别">
                                    <option value="">请选择</option>
                                    <c:forEach var="type" items="${goodTypeNames}">
                                        <option value="${type.goodTypeId}" <c:if test='${type.goodTypeId == goodTypeId}'>selected</c:if>>${type.goodTypeName}</option>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="goodTypeId" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="good_mode1" class="col-sm-4 control-label">
                                <span class="text-danger">*</span> 计费方式
                            </label>

                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" name="goodMoneyType" id="good_mode1" value="1" checked> 计量收费
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
                            <label for="good_remark" class="col-sm-2 control-label">商品描述</label>

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

    <div class="modal fade" id="tips_success_modal" tabindex="-1" role="dialog" aria-labelledby="tips_success_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_success_modal_label">提示框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-success text-content">商品设置提交成功!</p>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="good"/>
    <c:param name="subNav" value="setting"/>
</c:import>
