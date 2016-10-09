<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li><a href="/goods/market">商品销售</a></li>
            <li class="active">商品购物车</li>
        </ol>
        <div class="settings-filter">
            <div class="alert alert-info" style="overflow: hidden">
                <p class="pull-left">商品总价: 2000.00元(会员价: 1800.00元)</p>
                <a href="javascript:;" class="btn btn-primary pull-right">
                    <span class="glyphicon glyphicon-usb"></span> 结算
                </a>
            </div>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品图片</th>
                        <th>商品名称</th>
                        <th>价格(元)</th>
                        <th>会员价格(元)</th>
                        <th>购买数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/public/images/demo/mp60650501_1456481736483_2.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">+</button>
                                </span>
                            </div>
                         </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/public/images/demo/mp60650501_1456481736483_3.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">+</button>
                                </span>
                            </div>
                        </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/public/images/demo/mp60650501_1456481736483_4.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">+</button>
                                </span>
                            </div>
                        </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/public/images/demo/mp60650501_1456481736483_5.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">+</button>
                                </span>
                            </div>
                        </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>FD1321211</td>
                        <td>
                            <img src="/public/images/demo/mp60650501_1456481736483_6.jpeg" alt="某某商品"
                                 class="img-rounded" style="width: 100px">
                        </td>
                        <td>某某商品</td>
                        <td>100.00元</td>
                        <td>90.00元</td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">-</button>
                                </span>
                                <input type="text" class="form-control" value="1" style="width: 50px;">
                                <span class="input-group-btn" style="width: auto">
                                    <button class="btn btn-default" type="button">+</button>
                                </span>
                            </div>
                        </td>
                        <td>
                            <a href="javascript:;" class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="alert alert-info" style="overflow: hidden">
                <p class="pull-left">商品总价: 2000.00元(会员价: 1800.00元)</p>
                <a href="javascript:;" class="btn btn-primary pull-right">
                    <span class="glyphicon glyphicon-usb"></span> 结算
                </a>
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
                <h4 class="modal-title" id="xiajiaModalLabel">支付订单</h4>
            </div>
            <div class="modal-body">
                <p>商品成功下架!</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
