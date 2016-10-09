<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">应收款管理</li>
        </ol>
        <div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>流水号</th>
                                <th>订单金额(元)</th>
                                <th>所欠余额</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>FD0000121</td>
                                <td>10000.00元</td>
                                <td>2000.00元</td>
                                <td>--</td>
                                <td>--</td>
                                <td>
                                    <button type="button" class="btn btn-primary">
                                        <span class="glyphicon glyphicon-ok"></span> 收款
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>FD0000121</td>
                                <td>10000.00元</td>
                                <td>2000.00元</td>
                                <td>--</td>
                                <td>--</td>
                                <td>
                                    <button type="button" class="btn btn-primary">
                                        <span class="glyphicon glyphicon-ok"></span> 收款
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>FD0000121</td>
                                <td>10000.00元</td>
                                <td>2000.00元</td>
                                <td>--</td>
                                <td>--</td>
                                <td>
                                    <button type="button" class="btn btn-primary">
                                        <span class="glyphicon glyphicon-ok"></span> 收款
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<script src="Content/app/members/members_loans.js"></script>
<jsp:include page="/Views/Shared/Footer.jsp" />
