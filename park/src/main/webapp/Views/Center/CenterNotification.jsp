<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>个人中心</span> &gt;&gt; <span>我的消息</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">我的消息</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>发送标题</th>
                            <th>发送内容</th>
                            <th>有无附件</th>
                            <th>发送时间</th>
                            <th>发送人</th>
                            <th>通知状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>关于2016年场馆建设意见</td>
                            <td>关于2016年场馆建设意见, 关于2016年场馆建设意见....</td>
                            <td>无</td>
                            <td>2016-12-11 10:11</td>
                            <td>李洪旭</td>
                            <td>未读</td>
                            <td>
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>关于2016年场馆建设意见</td>
                            <td>关于2016年场馆建设意见, 关于2016年场馆建设意见....</td>
                            <td>2个文件</td>
                            <td>2016-12-11 10:11</td>
                            <td>李洪旭</td>
                            <td>已读</td>
                            <td>
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a class="btn btn-danger" href="">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>关于2016年场馆建设意见</td>
                            <td>关于2016年场馆建设意见, 关于2016年场馆建设意见....</td>
                            <td>5个文件</td>
                            <td>2016-12-11 10:11</td>
                            <td>李洪旭</td>
                            <td>已读</td>
                            <td>
                                <a class="btn btn-primary" href="">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
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
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="passport"/>
    <c:param name="subNav" value="message"/>
</c:import>
