<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="Content/app/office/office_notifications.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#notification_form').validate({
                ignore: ":hidden"
            });

            $(".note-type.btn-primary").addClass("btn-default").removeClass("btn-primary");
            $(".note-type[data-type='${type}']").addClass("btn-primary").removeClass("btn-default");
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
                        <a href="office/getNotifications?type=1" data-type="1" class="btn btn-primary note-type">
                            <span class="glyphicon glyphicon-pencil"></span> 草稿箱
                        </a>
                        <a href="office/getNotifications?type=2" data-type="2" class="btn btn-default note-type">
                            <span class="glyphicon glyphicon-send"></span> 发件箱
                        </a>
                        <a href="office/getNotifications?type=4" data-type="4" class="btn btn-default note-type">
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
                        <a href="#notifications_view_modal" class="btn btn-primary add-notification" data-toggle="modal"
                           data-backdrop="false">
                            <span class="glyphicon glyphicon-plus"></span> 创建通知
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-body">
                <c:if test="${type==4}">
                    <p class="text-danger">每条已删除的通知会自动保存30天，之后会清空超时的通知。</p>
                </c:if>
                <div class="table-responsive">
                    <table class="table notifications-list">
                        <thead>
                        <tr class="bg-info">
                            <th>通知标题</th>
                            <th>通知内容</th>
                            <c:if test="${type==1}">
                                <th>更新时间</th>
                            </c:if>
                            <c:if test="${type==2}">
                                <th>发送时间</th>
                            </c:if>
                            <th>通知状态</th>
                            <c:if test="${type==2}">
                                <th>收件人</th>
                            </c:if>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="note" items="${list}">
                            <tr>
                                <td>${note.noteTitle}</td>
                                <td>${note.noteContent.substring(0, 28)}...</td>

                                <c:if test="${type==1}">
                                    <td>${note.updateTime}</td>
                                </c:if>
                                <c:if test="${type==2}">
                                    <td>${note.sendTime}</td>
                                </c:if>

                                <c:if test="${note.sendStatus == 1}">
                                    <td class="text-success">已发送</td>
                                </c:if>
                                <c:if test="${note.sendStatus == 2}">
                                    <td class="text-danger">未发送</td>
                                </c:if>
                                <c:if test="${note.sendStatus == 3}">
                                    <td class="text-danger">已删除</td>
                                </c:if>
                                <c:if test="${type==2}">
                                    <td>${note.operatorName}</td>
                                </c:if>

                                <td>
                                    <a href="#notifications_view_modal" class="btn btn-primary notifications-view" data-toggle="modal"
                                       data-backdrop="false" data-id="${note.noteId}">
                                        <span class="glyphicon glyphicon-share-alt"></span> 查看
                                    </a>
                                    <c:if test="${note.sendStatus == 2}">
                                        <a href="#notifications_send_modal" class="btn btn-warning notifications-send" data-toggle="modal"
                                           data-backdrop="false" data-id="${note.noteId}">
                                            <span class="glyphicon glyphicon-send"></span> 发送
                                        </a>
                                    </c:if>
                                    <c:if test="${note.sendStatus == 1}">
                                        <a href="#notifications_send_modal" class="btn btn-warning notifications-send" data-toggle="modal"
                                           data-backdrop="false" data-id="${note.noteId}">
                                            <span class="glyphicon glyphicon-send"></span> 转发
                                        </a>
                                    </c:if>
                                    <c:if test="${note.sendStatus == 1 || note.sendStatus == 2}">
                                        <a href="javascript:;" class="btn btn-danger notifications-delete" data-id="${note.noteId}">
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

    <div class="modal fade" id="notifications_send_modal" tabindex="-1" role="dialog" aria-labelledby="notifications_send_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="notifications_send_modal_label">发送通知</h5>
                </div>
                <div class="modal-body">
                    <form id="notification_send_form" class="form-horizontal" role="form" onsubmit="return false;">
                        <input type="hidden" id="notification_send_id" name="noteId">
                        <div class="form-group">
                            <div class="col-sm-12 text-right note-receivers">
                                <input type="hidden" id="notification_send_receivers" name="noteReceivers">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notification_send_receiver" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 收件人
                            </label>
                            <div class="col-sm-9">
                                <select class="form-control" id="notification_send_receiver" name="receiverId"
                                        data-val="true" data-val-required="请选择收件人">
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
                    <button type="button" class="btn btn-primary send-notification">
                        <span class="glyphicon glyphicon-send"></span> 发 送
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="notifications_view_modal" tabindex="-1" role="dialog" aria-labelledby="notifications_view_modal_label">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="notifications_view_modal_label">编辑通知</h5>
                </div>
                <div class="modal-body">
                    <form id="notification_view_form" class="form-horizontal" role="form" onsubmit="return false;">
                        <input type="hidden" id="notification_view_id" name="noteId" value="0">
                        <div class="form-group">
                            <div class="col-sm-12 text-right note-view-receivers">
                                <input type="hidden" id="notification_view_receivers" name="noteReceivers">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notification_view_receiver" class="col-sm-3 control-label">收件人</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="notification_view_receiver" name="noteReceiver">
                                    <option value="">请选择</option>
                                    <c:forEach var="operator" items="${operators}">
                                        <option value="${operator.id}">${operator.operatorName}(${operator.roleName})</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notification_view_title" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 通知标题
                            </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="notification_view_title" name="noteTitle"
                                       placeholder="通知标题" autocomplete="off"
                                       data-val="true" data-val-required="通知标题不能为空">
                                <div data-valmsg-for="noteTitle" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notification_view_content" class="col-sm-3 control-label">
                                <span class="text-danger">*</span> 通知内容
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="3" id="notification_view_content" name="noteContent"
                                          placeholder="通知内容" autocomplete="off"
                                          data-val="true" data-val-required="通知内容不能为空"></textarea>
                                <div data-valmsg-for="noteContent" data-valmsg-replace="true"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning save-notification">
                        <span class="glyphicon glyphicon-send"></span> 保 存
                    </button>
                    <button type="button" class="btn btn-primary send-notification">
                        <span class="glyphicon glyphicon-send"></span> 发 送
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
