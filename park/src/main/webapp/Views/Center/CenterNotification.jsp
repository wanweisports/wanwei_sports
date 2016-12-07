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
                <form id="notification_filter_form" class="form-inline" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-envelope"></span> 收件箱
                        </a>
                        <a href="javascript:;" class="btn btn-default">
                            <span class="glyphicon glyphicon-folder-close"></span> 收件箱(未读)
                        </a>
                        <a href="javascript:;" class="btn btn-default">
                            <span class="glyphicon glyphicon-folder-open"></span> 收件箱(已读)
                        </a>
                        <a href="javascript:;" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span> 垃圾箱
                        </a>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="keywords" placeholder="全文检索..." value="${keywords}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary notification-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="#markModal" class="btn btn-warning" data-toggle="modal"
                           data-backdrop="false">
                            <span class="glyphicon glyphicon-pushpin"></span> 标记已读
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>选择</th>
                            <th>发送标题</th>
                            <th>发送内容</th>
                            <th>有无附件</th>
                            <th>发送时间</th>
                            <th>发件人</th>
                            <th>通知状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <label>
                                    <input type="checkbox" name="noteId" value="1">
                                </label>
                            </td>
                            <td>关于2016年场馆建设意见</td>
                            <td>关于2016年场馆建设意见, 关于2016年场馆建设意见....</td>
                            <td>无</td>
                            <td>2016-12-11 10:11</td>
                            <td>李洪旭</td>
                            <td class="text-danger">未读</td>
                            <td>
                                <a href="#fasongModal" class="btn btn-primary notifications-view" data-toggle="modal"
                                   data-backdrop="false" data-id="${note.noteId}">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>关于2016年场馆建设意见</td>
                            <td>关于2016年场馆建设意见, 关于2016年场馆建设意见....</td>
                            <td>2个文件</td>
                            <td>2016-12-11 10:11</td>
                            <td>李洪旭</td>
                            <td class="text-success">已读</td>
                            <td>
                                <a href="#fasongModal" class="btn btn-primary notifications-view" data-toggle="modal"
                                   data-backdrop="false" data-id="${note.noteId}">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a href="#deleteModal" class="btn btn-danger notifications-del" data-toggle="modal"
                                   data-backdrop="false" data-id="${note.noteId}">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>关于2016年场馆建设意见</td>
                            <td>关于2016年场馆建设意见, 关于2016年场馆建设意见....</td>
                            <td>5个文件</td>
                            <td>2016-12-11 10:11</td>
                            <td>李洪旭</td>
                            <td class="text-success">已读</td>
                            <td>
                                <a href="#fasongModal" class="btn btn-primary notifications-view" data-toggle="modal"
                                   data-backdrop="false" data-id="${note.noteId}">
                                    <span class="glyphicon glyphicon-share-alt"></span> 查看
                                </a>
                                <a href="#deleteModal" class="btn btn-danger notifications-del" data-toggle="modal"
                                   data-backdrop="false" data-id="${note.noteId}">
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

    <div class="modal fade" id="fasongModal" tabindex="-1" role="dialog" aria-labelledby="fasongModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="fasongModalLabel">消息通知</h5>
                </div>
                <div class="modal-body" style="text-align: left;">
                    <p>发件人: 李洪旭</p>
                    <p>通知标题: 关于2016年场馆建设意见</p>
                    <p>通知内容:</p>
                    <p>关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，
                        关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，
                        关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，关于2016年场馆建设意见，
                        关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。关于2016年场馆建设意见，
                        关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见，关于2016年场馆建设意见。</p>
                    <p>通知附件:</p>
                    <p><a class="btn btn-link">2016年度场馆建设意见草稿.doc</a></p>
                    <p><a class="btn btn-link">2016年度场馆建设.xls</a></p>
                    <p><a class="btn btn-link">2016年度场馆建设意.jpg</a></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span> 关 闭
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="markModal" tabindex="-1" role="dialog" aria-labelledby="markModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="markModalLabel">确认框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-danger">您确定要标记为已读状态吗?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="deleteModalLabel">确认框</h5>
                </div>
                <div class="modal-body">
                    <p class="text-danger">您确定要删除此通知消息吗?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="passport"/>
    <c:param name="subNav" value="message"/>
</c:import>
