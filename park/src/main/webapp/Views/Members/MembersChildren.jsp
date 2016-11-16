<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>会员管理</span> &gt;&gt; <span>会员查询</span> &gt;&gt; <span>子会员管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">主会员信息</div>
            <div class="panel-body">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="cardNo" class="col-sm-4 control-label">
                            <span class="text-danger">*</span> 会员卡号
                        </label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="cardNo" name="tempCardNo"
                                   placeholder="会员卡号" value="wewqe2323121" disabled>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="name" class="col-sm-4 control-label">
                            <span class="text-danger">*</span> 会员姓名
                        </label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="会员卡号" value="北体高科技术公司" disabled>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">子会员列表</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>手机号码</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>李洪旭</td>
                                    <td>110****4453</td>
                                    <td>
                                        <a class="btn btn-danger" href="">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>李洪旭</td>
                                    <td>110****4453</td>
                                    <td>
                                        <a class="btn btn-danger" href="">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>李洪旭</td>
                                    <td>110****4453</td>
                                    <td>
                                        <a class="btn btn-danger" href="">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>李洪旭</td>
                                    <td>110****4453</td>
                                    <td>
                                        <a class="btn btn-danger" href="">
                                            <span class="glyphicon glyphicon-trash"></span> 删除
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                            <p class="pull-left" style="margin: 12px 14px;">
                                <span>${pageSize}条/页</span>
                                <span>总${count}条</span>
                            </p>
                            <ul class="pagination pull-right">
                                <c:if test="${currentPage == 1}">
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
                                <c:if test="${currentPage != 1}">
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
                                <c:if test="${currentPage == lastPage}">
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
                                <c:if test="${currentPage != lastPage}">
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
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">子会员添加</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputEmail3" placeholder="姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword3" placeholder="手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-plus"></span> 添 加
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="member"/>
    <c:param name="subNav" value="list"/>
</c:import>
