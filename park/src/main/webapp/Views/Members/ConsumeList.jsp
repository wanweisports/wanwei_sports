<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li><a href="/member/memberList">会员查询</a></li>
            <li><a href="member/memberInfo?memberId=${memberId}">会员详情</a></li>
            <li class="active">消费明细</li>
        </ol>
        <a href="/member/getBalances?cardId=${cardId}" class="btn btn-primary pull-right" style="margin-top: -58px;">
            <span class="glyphicon glyphicon-th-list"></span> 订单明细
        </a>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="consume_filter_form" class="form-inline" onsubmit="return false;">
                        <div class="form-group">
                            <select class="form-control" name="" id="">
                                <option>消费类型</option>
                                <option>场地消费</option>
                                <option>商品消费</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="date" class="form-control" placeholder="开始时间">
                        </div>
                        <div class="form-group">
                            <input type="date" class="form-control" placeholder="结束时间">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="手机号">
                        </div>
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary consume-filter">
                                <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive card-type-list">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>会员姓名</th>
                                <th>消费类型</th>
                                <th>消费项</th>
                                <th>消费金额</th>
                                <th>消费状态</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>羽毛球场地一</td>
                                <td>60</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-09-03</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>李洪旭</td>
                                <td>商品消费</td>
                                <td>农夫山泉</td>
                                <td>3</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-09-01</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>游泳场</td>
                                <td>80</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-08-29</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>羽毛球场地一</td>
                                <td>60</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-09-03</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>李洪旭</td>
                                <td>商品消费</td>
                                <td>农夫山泉</td>
                                <td>3</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-09-01</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>游泳场</td>
                                <td>80</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-08-29</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>羽毛球场地一</td>
                                <td>60</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-09-03</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>李洪旭</td>
                                <td>商品消费</td>
                                <td>农夫山泉</td>
                                <td>3</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-09-01</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>游泳场</td>
                                <td>80</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-08-29</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>李洪旭</td>
                                <td>场地消费</td>
                                <td>游泳场</td>
                                <td>80</td>
                                <td>已支付</td>
                                <td>李晓丹</td>
                                <td>2016-08-29</td>
                            </tr>
                            </tbody>
                        </table>
                        <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                            <p class="pull-left" style="margin: 24px 14px;">
                                <span>${pageSize }条/页</span>
                                <span>总${count}条</span>
                            </p>
                            <ul class="pagination pull-right">
                                <c:if test="${isFirstPage}">
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>首页</span>
                                        </a>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${!isFirstPage}">
                                    <li>
                                        <a class="page-first" href="javascript:;" data-index="1">
                                            <span>首页</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="page-prev" href="javascript:;" data-index="${currentPage - 1}">
                                            <span>上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${lastPage}">
                                    <c:if test="${i == currentPage}">
                                        <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                                    </c:if>
                                    <c:if test="${i != currentPage}">
                                        <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${isLastPage}">
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>下一页</span>
                                        </a>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:;" data-index="1">
                                            <span>末页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${!isLastPage}">
                                    <li>
                                        <a class="page-next" href="javascript:;" data-index="${currentPage + 1}">
                                            <span>下一页</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="page-last" href="javascript:;" data-index="${lastPage}">
                                            <span>末页</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/members_consume_list.js"></script>
<<script type="text/javascript">$("#status").val('${status}');</script>
<jsp:include page="/Views/Shared/Footer.jsp" />
