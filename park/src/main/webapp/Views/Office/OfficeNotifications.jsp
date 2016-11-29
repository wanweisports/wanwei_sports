<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/app/office/office_notifications.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#notification_form').validate({
                ignore: ":hidden"
            });

            $("#noteStatus").val('${noteStatus}');
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>通知管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">通知管理</div>
            <div class="panel-body">
                <form id="notification_filter_form" class="form-inline" novalidate onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" name="noteStatus" id="noteStatus" style="width: 200px;">
                            <option value="">全部状态</option>
                            <option value="1">对方已读</option>
                            <option value="2">对方未读</option>
                            <option value="3">发送草稿</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="noteTitle" placeholder="通知标题" value="${noteTitle}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary notification-filter">
                            <span class="glyphicon glyphicon-search"></span> 检索 & 显示
                        </a>
                    </div>
                    <div class="form-group pull-right">
                        <a href="#fasongModal" class="btn btn-primary add-notification" data-toggle="modal"
                           data-backdrop="false">
                            <span class="glyphicon glyphicon-send"></span> 发送通知
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table notifications-list">
                        <thead>
                        <tr>
                            <th>发送标题</th>
                            <th>发送内容</th>
                            <th>有无附件</th>
                            <th>发送时间</th>
                            <th>收件人</th>
                            <th>通知状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="note" items="${list}">
                            <tr>
                                <td>${note.noteTitle}</td>
                                <td>${note.noteContent.substring(0, 28)}...</td>

                                <c:if test="${note.noteAttachments}">
                                    <td>${note.noteAttachments}</td>
                                </c:if>
                                <c:if test="${!note.noteAttachments}">
                                    <td>无</td>
                                </c:if>

                                <td>${note.noteCreateTime}</td>
                                <td>${note.operatorName}</td>

                                <c:if test="${note.noteStatus == 1}">
                                    <td class="text-success">已读</td>
                                </c:if>
                                <c:if test="${note.noteStatus == 2}">
                                    <td class="text-danger">未读</td>
                                </c:if>
                                <c:if test="${note.noteStatus == 3}">
                                    <td class="text-warning">草稿</td>
                                </c:if>

                                <td>
                                    <c:if test="${note.noteStatus == 3}">
                                        <a href="#fasongModal" class="btn btn-primary notifications-view" data-toggle="modal"
                                           data-backdrop="false" data-id="${note.noteId}" data-edit="1">
                                            <span class="glyphicon glyphicon-share-alt"></span> 查看
                                        </a>
                                    </c:if>
                                    <c:if test="${note.noteStatus == 1 || note.noteStatus == 2}">
                                        <a href="#senderModal" class="btn btn-primary notifications-view" data-toggle="modal"
                                           data-backdrop="false" data-id="${note.noteId}" data-edit="2">
                                            <span class="glyphicon glyphicon-share-alt"></span> 查看
                                        </a>
                                        <a href="#fasongModal" class="btn btn-warning notifications-resend" data-toggle="modal"
                                           data-backdrop="false" data-id="${note.noteId}" data-edit="1">
                                            <span class="glyphicon glyphicon-send"></span> 转发
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

    <div class="modal fade" id="senderModal" tabindex="-1" role="dialog" aria-labelledby="senderModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="senderModalLabel">消息通知</h5>
                </div>
                <div class="modal-body" style="text-align: left;">
                    <form class="form-horizontal" onsubmit="return false;">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">收件人</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="note_receiver1" name="noteReceiver">
                                    <c:forEach var="operator" items="${operators}">
                                        <option value="${operator.id}">${operator.operatorName}(${operator.roleName})</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">通知标题</label>
                            <div class="col-sm-10">
                                <p class="note-title"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">通知内容</label>
                            <div class="col-sm-10">
                                <p class="note-content"></p>
                            </div>
                        </div>
                    </form>
                    <!--<p>通知附件:</p>
                    <p><a href="" class="btn btn-link">2016年度场馆建设意见草稿.doc</a></p>
                    <p><a href="" class="btn btn-link">2016年度场馆建设.xls</a></p>
                    <p><a href="" class="btn btn-link">2016年度场馆建设意.jpg</a></p>-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span> 关 闭
                    </button>
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
                    <h5 class="modal-title" id="fasongModalLabel">发送通知</h5>
                </div>
                <div class="modal-body">
                    <form id="notification_form" role="form" onsubmit="return false;">
                        <input type="hidden" id="note_id" name="noteId">
                        <div class="form-group">
                            <select class="form-control" id="note_receiver" name="noteReceiver">
                                <option value="">请选择</option>
                                <c:forEach var="operator" items="${operators}">
                                    <option value="${operator.id}">${operator.operatorName}(${operator.roleName})</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="note_title" name="noteTitle"
                                   placeholder="消息标题" autocomplete="off"
                                   data-val="true" data-val-required="消息标题不能为空">
                            <div data-valmsg-for="noteTitle" data-valmsg-replace="true"></div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="3" id="note_content" name="noteContent"
                                      placeholder="消息内容" autocomplete="off"
                                      data-val="true" data-val-required="消息内容不能为空"></textarea>
                            <div data-valmsg-for="noteContent" data-valmsg-replace="true"></div>
                        </div>
                        <!--<div class="form-group">
                            <input type="file" id="note_attachments" name="noteAttachments" placeholder="请上传附件"
                                   autocomplete="off">
                        </div>-->
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span> 关 闭
                    </button>

                    <button type="button" class="btn btn-primary save-notification" style="display:none;">
                        <span class="glyphicon glyphicon-save"></span> 保 存
                    </button>

                    <button type="button" class="btn btn-warning send-notification" style="display:none;">
                        <span class="glyphicon glyphicon-send"></span> 发 送
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
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="notification"/>
</c:import>
