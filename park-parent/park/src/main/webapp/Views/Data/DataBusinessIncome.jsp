<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/data/data_business_income.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".member-date.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".member-date[data-count='${countNum}']").addClass("btn-primary").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>数据统计</span> &gt;&gt; <span>营业收支统计</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">营业收支统计</div>
            <div class="panel-body">
                <form id="data_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <div class="btn-group">
                            <a href="/data/getBusinessIncome?countNum=11" data-count="11" class="btn btn-default member-date">今日</a>
                            <a href="/data/getBusinessIncome?countNum=10" data-count="10" class="btn btn-default member-date">昨日</a>
                            <a href="/data/getBusinessIncome?countNum=21" data-count="21" class="btn btn-default member-date">本周</a>
                            <a href="/data/getBusinessIncome?countNum=31" data-count="31" class="btn btn-default member-date">本月</a>
                            <a href="/data/getBusinessIncome?countNum=41" data-count="41" class="btn btn-default member-date">本年</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeStart" name="createTimeStart"
                               placeholder="开始日期" value="${createTimeStart}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="createTimeEnd" name="createTimeEnd"
                               placeholder="结束日期" value="${createTimeEnd}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary data-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                    	<input type="hidden" value="${countNum}" name="countNum" />
                        <a href="javascript:;" class="btn btn-danger goods-filter" onclick="window.open('/data/exportBusinessIncome?'+$('#data_form').serialize());">
                            <span class="glyphicon glyphicon-export"></span> 导出数据
                        </a>
                        <a href="#check_money_modal" class="btn btn-warning" data-toggle="modal" data-backdrop="false">
                            <span class="glyphicon glyphicon-eye-open"></span> 核对财务
                        </a>
                        <a href="/data/getBusinessIncomeGroupDate" class="btn btn-primary" style="display: none;">
                            <span class="glyphicon glyphicon-stats"></span> 图表显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>收支项</th>
                            <th>现金</th>
                            <th>支付宝</th>
                            <th>微信</th>
                            <th>银联</th>
                            <th>支票</th>
                            <th>合计</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="card" items="${cardCounts.countList}">
                            <tr>
                                <td>${card.name}</td>
                                <td>${card.xianjin > 0 ? card.xianjin : "--"}</td>
                                <td>${card.zhifubao > 0 ? card.zhifubao : "--"}</td>
                                <td>${card.weixin > 0 ? card.weixin : "--"}</td>
                                <td>${card.yinlian > 0 ? card.yinlian : "--"}</td>
                                <td>${card.zhipiao > 0 ? card.zhipiao : "--"}</td>
                                <td>${card.sumPrice > 0 ? card.sumPrice : "--"}</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th>会员小计</th>
                            <th>${cardCounts.xianjinSumPrice}</th>
                            <th>${cardCounts.zhifubaoSumPrice}</th>
                            <th>${cardCounts.weixinSumPrice}</th>
                            <th>${cardCounts.yinlianSumPrice}</th>
                            <th>${cardCounts.zhipiaoSumPrice}</th>
                            <th>${cardCounts.sumPrice}</th>
                        </tr>
                        <c:forEach var="site" items="${siteCounts.countList}">
                            <tr>
                                <td>${site.name}</td>
                                <td>${site.xianjin > 0 ? site.xianjin : "--"}</td>
                                <td>${site.zhifubao > 0 ? site.zhifubao : "--"}</td>
                                <td>${site.weixin > 0 ? site.weixin : "--"}</td>
                                <td>${site.yinlian > 0 ? site.yinlian : "--"}</td>
                                <td>${site.zhipiao > 0 ? site.zhipiao : "--"}</td>
                                <td>${site.sumPrice > 0 ? site.sumPrice : "--"}</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th>场地小计</th>
                            <th>${siteCounts.xianjinSumPrice}</th>
                            <th>${siteCounts.zhifubaoSumPrice}</th>
                            <th>${siteCounts.weixinSumPrice}</th>
                            <th>${siteCounts.yinlianSumPrice}</th>
                            <th>${siteCounts.zhipiaoSumPrice}</th>
                            <th>${siteCounts.sumPrice}</th>
                        </tr>
                        <c:forEach var="good" items="${goodsCounts.countList}">
                            <tr>
                                <td>${good.name}</td>
                                <td>${good.xianjin > 0 ? good.xianjin : "--"}</td>
                                <td>${good.zhifubao > 0 ? good.zhifubao : "--"}</td>
                                <td>${good.weixin > 0 ? good.weixin : "--"}</td>
                                <td>${good.yinlian > 0 ? good.yinlian : "--"}</td>
                                <td>${good.zhipiao > 0 ? good.zhipiao : "--"}</td>
                                <td>${good.sumPrice > 0 ? good.sumPrice : "--"}</td>
                            </tr>
                        </c:forEach>
                        <tr class="info">
                            <th>商品小计</th>
                            <th>${goodsCounts.xianjinSumPrice}</th>
                            <th>${goodsCounts.zhifubaoSumPrice}</th>
                            <th>${goodsCounts.weixinSumPrice}</th>
                            <th>${goodsCounts.yinlianSumPrice}</th>
                            <th>${goodsCounts.zhipiaoSumPrice}</th>
                            <th>${goodsCounts.sumPrice}</th>
                        </tr>
                        <tr class="warning">
                            <th>金额总计</th>
                            <th>${xianjinSumPrice}</th>
                            <th>${zhifubaoSumPrice}</th>
                            <th>${weixinSumPrice}</th>
                            <th>${yinlianSumPrice}</th>
                            <th>${zhipiaoSumPrice}</th>
                            <th>${sumPrice}</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="check_money_modal" tabindex="-1" role="dialog" aria-labelledby="check_money_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="check_money_modal_label">核对财务</h5>
                </div>
                <c:set var="s" value="0" />
                <c:set var="sum" value="0" />
                <div class="modal-body">
                    <p class="text-muted">请仔细核对相应的财务金额。</p>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr><th>支付类型</th><th>计算金额</th><th>核对金额</th><th>备注</th><th></th></tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>现金</td><td>${xianjinSumPrice}元</td>
                                <td><input type="text" class="form-control" placeholder="请输入" value="${s = (xjCollateAmount>0 ? xjCollateAmount : xianjinSumPrice)}"></td>
                                <td><input value="${xjCollateRemark}" /></td>
                                <td data-old-amount="${xianjinSumPrice}">
                                    <c:set var="sum" value="${s+sum}" />
                                    <c:if test="${xjCollateStatus == null}">
                                        <button type="button" class="btn btn-danger confirm-check-money" data-type="1" data-status="2">
                                            <span class="glyphicon glyphicon-remove"></span> 有误
                                        </button>
                                        <button type="button" class="btn btn-primary confirm-check-money" data-type="1" data-status="1">
                                            <span class="glyphicon glyphicon-ok"></span> 无误
                                        </button>
                                    </c:if>
                                    <c:if test="${xjCollateStatus != null}">
                                        已核对（${xjCollateStatus==1 ? '无误' : '有误'}）
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>支付宝</td><td>${zhifubaoSumPrice}元</td>
                                <td><input type="text" class="form-control" placeholder="请输入" value="${s = (zfbCollateAmount>0 ? zfbCollateAmount : zhifubaoSumPrice)}"></td>
                                <td><input value="${zfbCollateRemark}" /></td>
                                <td data-old-amount="${zhifubaoSumPrice}">
                                    <c:set var="sum" value="${s+sum}" />
                                    <c:if test="${zfbCollateStatus == null}">
                                        <button type="button" class="btn btn-danger confirm-check-money" data-type="2" data-status="2">
                                            <span class="glyphicon glyphicon-remove"></span> 有误
                                        </button>
                                        <button type="button" class="btn btn-primary confirm-check-money" data-type="2" data-status="1">
                                            <span class="glyphicon glyphicon-ok"></span> 无误
                                        </button>
                                    </c:if>
                                    <c:if test="${zfbCollateStatus != null}">
                                        已核对（${zfbCollateStatus==1 ? '无误' : '有误'}）
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>微信</td><td>${weixinSumPrice}元</td>
                                <td><input type="text" class="form-control" placeholder="请输入" value="${s = (wxCollateAmount>0 ? wxCollateAmount : weixinSumPrice)}"></td>
                                <td><input value="${wxCollateRemark}" /></td>
                                <td data-old-amount="${weixinSumPrice}">
                                    <c:set var="sum" value="${s+sum}" />
                                    <c:if test="${wxCollateStatus == null}">
                                        <button type="button" class="btn btn-danger confirm-check-money" data-type="3" data-status="2">
                                            <span class="glyphicon glyphicon-remove"></span> 有误
                                        </button>
                                        <button type="button" class="btn btn-primary confirm-check-money" data-type="3" data-status="1">
                                            <span class="glyphicon glyphicon-ok"></span> 无误
                                        </button>
                                    </c:if>
                                    <c:if test="${wxCollateStatus != null}">
                                        已核对（${wxCollateStatus==1 ? '无误' : '有误'}）
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>银联</td><td>${yinlianSumPrice}元</td>
                                <td><input type="text" class="form-control" placeholder="请输入" value="${s = (yinlianCollateAmount>0 ? yinlianCollateAmount : yinlianSumPrice)}"></td>
                                <td><input value="${yinlianCollateRemark}" /></td>
                                <td data-old-amount="${yinlianSumPrice}">
                                    <c:set var="sum" value="${s+sum}" />
                                    <c:if test="${yinlianCollateStatus == null}">
                                        <button type="button" class="btn btn-danger confirm-check-money" data-type="4" data-status="2">
                                            <span class="glyphicon glyphicon-remove"></span> 有误
                                        </button>
                                        <button type="button" class="btn btn-primary confirm-check-money" data-type="4" data-status="1">
                                            <span class="glyphicon glyphicon-ok"></span> 无误
                                        </button>
                                    </c:if>
                                    <c:if test="${yinlianCollateStatus != null}">
                                        已核对（${yinlianCollateStatus==1 ? '无误' : '有误'}）
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>支票</td><td>${zhipiaoSumPrice}元</td>
                                <td><input type="text" class="form-control" placeholder="请输入" value="${s = (zhipiaoCollateAmount>0 ? zhipiaoCollateAmount : zhipiaoSumPrice)}"></td>
                                <td><input value="${zhipiaoCollateRemark}" /></td>
                                <td data-old-amount="${zhipiaoSumPrice}">
                                    <c:set var="sum" value="${s+sum}" />
                                    <c:if test="${zhipiaoCollateStatus == null}">
                                        <button type="button" class="btn btn-danger confirm-check-money" data-type="5" data-status="2">
                                            <span class="glyphicon glyphicon-remove"></span> 有误
                                        </button>
                                        <button type="button" class="btn btn-primary confirm-check-money" data-type="5" data-status="1">
                                            <span class="glyphicon glyphicon-ok"></span> 无误
                                        </button>
                                    </c:if>
                                    <c:if test="${zhipiaoCollateStatus != null}">
                                        已核对（${zhipiaoCollateStatus==1 ? '无误' : '有误'}）
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>合计</td><td>${sumPrice}元</td>
                                <td><input type="text" class="form-control" placeholder="请输入" value="${sum}" readonly></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="data"/>
    <c:param name="subNav" value="business"/>
</c:import>
