<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/app/office/office_message.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            $(".note-type.btn-success").addClass("btn-default").removeClass("btn-success");
            $(".note-type[data-type='${type}']").addClass("btn-success").removeClass("btn-default");
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>个人中心</span> &gt;&gt; <span>我的消息</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">我的消息</div>
            <div class="panel-body">
                <form id="message_filter_form" class="form-inline" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <a href="office/getMessage?type=3" data-type="3" class="btn btn-success note-type">
                            <span class="glyphicon glyphicon-envelope"></span> 全部消息
                        </a>
                        <a href="office/getMessage?type=31" data-type="31" class="btn btn-default note-type">
                            <span class="glyphicon glyphicon-send"></span> 未读消息
                        </a>
                        <a href="office/getMessage?type=32" data-type="32" class="btn btn-default note-type">
                            <span class="glyphicon glyphicon-trash"></span> 已读消息
                        </a>
                        <a href="office/getMessage?type=4" data-type="4" class="btn btn-default note-type">
                            <span class="glyphicon glyphicon-trash"></span> 已删消息
                        </a>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="keywords" placeholder="全文检索..." value="${keywords}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-success message-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="#markModal" class="btn btn-primary" data-toggle="modal"
                           data-backdrop="false">
                            <span class="glyphicon glyphicon-pushpin"></span> 标记全部已读
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <c:if test="${type==4}">
                    <p class="text-danger">每条已删除的消息会自动保存30天，之后会清空超时的消息。</p>
                </c:if>
                <div class="table-responsive message-list">
                    <table class="table">
                        <thead>
                        <tr class="bg-info">
                            <th>消息标题</th>
                            <th>消息内容</th>
                            <th>发件人</th>
                            <th>发送时间</th>
                            <th>消息状态</th>
                            <th>读取时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="note" items="${list}">
                            <tr>
                                <td>${note.noteTitle}</td>
                                <td>${note.noteContent.substring(0, 28)}...</td>

                                <td>${note.operatorName}</td>
                                <td>${note.sendTime}</td>

                                <c:if test="${note.receiverStatus == 1}">
                                    <td class="text-success">已读</td>
                                </c:if>
                                <c:if test="${note.receiverStatus == 2}">
                                    <td class="text-danger">未读</td>
                                </c:if>
                                <td>${note.noteReadTime}</td>

                                <td>
                                    <a href="#message_content_modal" class="btn btn-success message-view" data-toggle="modal"
                                       data-backdrop="false" data-note="${note.noteId}" data-id="${note.id}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                    <c:if test="${note.receiverStatus == 1 || note.receiverStatus == 2}">
                                        <a href="javascript:;" class="btn btn-danger message-delete" data-id="${note.id}">
                                            <span class="glyphicon glyphicon-remove"></span> 删除
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
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

    <div class="modal fade" id="message_content_modal" tabindex="-1" role="dialog" aria-labelledby="message_content_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="message_content_modal_label">消息通知</h5>
                </div>
                <div class="modal-body" style="text-align: left;">
                    <form id="notification_send_form" class="form-horizontal" role="form" onsubmit="return false;">
                        <input type="hidden" id="notification_send_id" name="noteId">
                        <div class="form-group">
                            <label for="notification_send_receiver" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 发件人
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control" id="notification_send_receiver" name="receiverId"
                                        data-val="true" data-val-required="请选择收件人" disabled="disabled">
                                    <option value="">请选择</option>
                                    <c:forEach var="operator" items="${operators}">
                                        <option value="${operator.id}">${operator.operatorName}(${operator.roleName})</option>
                                    </c:forEach>
                                </select>
                                <div data-valmsg-for="receiverId" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notification_send_title" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 通知标题
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="notification_send_title" name="noteTitle"
                                       placeholder="通知标题" autocomplete="off" disabled="disabled"
                                       data-val="true" data-val-required="通知标题不能为空">
                                <div data-valmsg-for="noteTitle" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notification_send_content" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 通知内容
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="3" id="notification_send_content" name="noteContent"
                                          placeholder="通知内容" autocomplete="off" disabled="disabled"
                                          data-val="true" data-val-required="通知内容不能为空"></textarea>
                                <div data-valmsg-for="noteContent" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
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
                    <p class="text-danger">您确定要全部标记为已读状态吗?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="passport"/>
    <c:param name="subNav" value="message"/>
</c:import>
