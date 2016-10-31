<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>预订订单</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                            <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="col-sm-1 text-center">场地1</div>
                        <div class="col-sm-1 text-center">40.00元</div>
                        <div class="col-sm-3 text-center">2016-10-31 ~ 2016-12-31</div>
                        <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                        <div class="col-sm-2 text-center">已完成</div>
                        <div class="col-sm-3 text-center">
                            <button class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                            <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <div class="col-sm-1 text-center">场地1</div>
                        <div class="col-sm-1 text-center">40.00元</div>
                        <div class="col-sm-3 text-center">2016-10-31 ~ 2016-12-31</div>
                        <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                        <div class="col-sm-2 text-center">已完成</div>
                        <div class="col-sm-3 text-center">
                            <button class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                            <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <div class="col-sm-1 text-center">场地1</div>
                        <div class="col-sm-1 text-center">40.00元</div>
                        <div class="col-sm-3 text-center">2016-10-31 ~ 2016-12-31</div>
                        <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                        <div class="col-sm-2 text-center">已完成</div>
                        <div class="col-sm-3 text-center">
                            <button class="btn btn-warning">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">场地预订订单</div>
            <div class="panel-body">
                <div class="col-sm-1 text-center">
                    <strong>场地信息</strong>
                </div>
                <div class="col-sm-1 text-center">
                    <strong>场地单价</strong>
                </div>
                <div class="col-sm-3 text-center">
                    <strong>预订日期</strong>
                </div>
                <div class="col-sm-2 text-center">
                    <strong>预订时间</strong>
                </div>
                <div class="col-sm-2 text-center">
                    <strong>订单状态</strong>
                </div>
                <div class="col-sm-3 text-center">
                    <strong>操作</strong>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
            </div>
            <div class="panel-body">
                <div class="col-sm-1 text-center">场地1</div>
                <div class="col-sm-1 text-center">40.00元</div>
                <div class="col-sm-3 text-center">2016-10-31 ~ 2016-12-31</div>
                <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                <div class="col-sm-2 text-center">已完成</div>
                <div class="col-sm-3 text-center">
                    <button class="btn btn-warning">
                        <span class="glyphicon glyphicon-trash"></span> 删除
                    </button>
                </div>
            </div>
            <!--<div class="panel-footer">Panel footer</div>-->
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
            </div>
            <div class="panel-body">
                <div class="col-sm-1 text-center">场地1</div>
                <div class="col-sm-1 text-center">40.00元</div>
                <div class="col-sm-3 text-center">2016-10-31 ~ 2016-12-31</div>
                <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                <div class="col-sm-2 text-center text-success">已支付</div>
                <div class="col-sm-3 text-center">
                    <button class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span> 取消
                    </button>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
            </div>
            <div class="panel-body">
                <div class="col-sm-1 text-center">场地1</div>
                <div class="col-sm-1 text-center">40.00元</div>
                <div class="col-sm-3 text-center">2016-10-31</div>
                <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                <div class="col-sm-2 text-center text-danger">未支付</div>
                <div class="col-sm-3 text-center">
                    <button class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span> 取消
                    </button>
                    <button class="btn btn-primary">
                        <span class="glyphicon glyphicon-usd"></span> 支付
                    </button>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
            </div>
            <div class="panel-body">
                <div class="col-sm-1 text-center">场地1</div>
                <div class="col-sm-1 text-center">40.00元</div>
                <div class="col-sm-3 text-center">2016-10-31 ~ 2016-12-31</div>
                <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                <div class="col-sm-2 text-center">已取消</div>
                <div class="col-sm-3 text-center">
                    <button class="btn btn-warning">
                        <span class="glyphicon glyphicon-trash"></span> 删除
                    </button>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span style="margin-right: 20px;">订单日期: <strong>2016-10-31 10:00:00</strong></span>
                <span style="margin-right: 20px;">订单号: <strong>20141212313</strong></span>
            </div>
            <div class="panel-body">
                <div class="col-sm-1 text-center">场地1</div>
                <div class="col-sm-1 text-center">40.00元</div>
                <div class="col-sm-3 text-center">2016-10-31</div>
                <div class="col-sm-2 text-center">08:00 ~ 10:00</div>
                <div class="col-sm-2 text-center text-danger">未全款</div>
                <div class="col-sm-3 text-center">
                    <button class="btn btn-primary">
                        <span class="glyphicon glyphicon-usd"></span> 支付
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="order"/>
</c:import>