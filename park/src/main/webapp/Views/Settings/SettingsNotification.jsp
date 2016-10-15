<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/dist/settings/settings_notification.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="ww-wrapper">
        <div class="wrapper">
            <ol class="breadcrumb">
                <li><a href="/">工作平台</a></li>
                <li class="active">通知设置</li>
            </ol>
            <div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form id="notification_form" class="form-horizontal" onsubmit="return false;">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="member_mobile" class="col-sm-4 control-label">手机号码</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="member_mobile" name="member_mobile"
                                               placeholder="请输入手机号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="member_type" class="col-sm-4 control-label">会员类型</label>

                                    <div class="col-sm-8">
                                        <select class="form-control" id="member_type" name="member_type">
                                            <option value="">全部类型</option>
                                            <option value="1">金卡</option>
                                            <option value="2">银卡</option>
                                            <option value="3">记账卡</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="member_idcard" class="col-sm-4 control-label">身份证号</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="member_idcard" name="member_idcard"
                                               placeholder="请输入身份证号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-8">
                                        <a href="javascript:;" class="btn btn-primary">
                                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="card_no" class="col-sm-4 control-label">会员卡号</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="card_no" name="card_no"
                                               placeholder="请输入会员卡号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <a href="#fasongModal" class="btn btn-primary pull-right" data-toggle="modal">
                                            <span class="glyphicon glyphicon-send"></span> 发送消息
                                        </a>
                                    </div>
                                </div>
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
                                    <th>#</th>
                                    <th>姓名</th>
                                    <th>手机号码</th>
                                    <th>身份证号</th>
                                    <th>会员卡号</th>
                                    <th>会员类型</th>
                                    <th>有效期至</th>
                                    <th>余额(元)</th>
                                    <th>状态</th>
                                    <th>操作人</th>
                                    <th>注册时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><label><input type="checkbox" name="message_status" value=""></label></td>
                                    <td>李洪旭</td>
                                    <td>110****5678</td>
                                    <td>123456***4321</td>
                                    <td>34543553</td>
                                    <td>金卡</td>
                                    <td>2016-12-31</td>
                                    <td>10000</td>
                                    <td class="text-success">有效</td>
                                    <td>李晓丹</td>
                                    <td>2016-09-03</td>
                                </tr>
                                <tr>
                                    <td><label><input type="checkbox" name="message_status" value=""></label></td>
                                    <td>李洪旭</td>
                                    <td>110****5678</td>
                                    <td>123456***4321</td>
                                    <td>34543553</td>
                                    <td>金卡</td>
                                    <td>2016-12-31</td>
                                    <td>10000</td>
                                    <td class="text-danger">锁定</td>
                                    <td>李晓丹</td>
                                    <td>2016-09-03</td>
                                </tr>
                                <c:forEach var="member" items="${members}">
                                    <tr>
                                        <td><label><input type="checkbox" name="message_status" value="${loop.index}"></label></td>
                                        <td>${loop.index}</td>
                                        <td>${member.member_name}</td>
                                        <td>${member.member_mobile}</td>
                                        <td>${member.member_idcard}</td>
                                        <td>${member.card_id}</td>
                                        <td>白金卡</td>
                                        <td>2016-12-31</td>
                                        <td>10000</td>
                                        <c:if test="${member.member_status == 1}">
                                            <td class="text-success">有效</td>
                                        </c:if>
                                        <c:if test="${member.member_status == 2}">
                                            <td class="text-danger">锁定</td>
                                        </c:if>
                                        <td>李晓丹</td>
                                        <td>2016-09-03</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                                <p class="pull-left" style="margin: 24px 14px;">
                                    <span>${pageSize} 条/页</span>
                                    <span>总 ${count} 条</span>
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
        </div>
    </div>

    <div class="modal fade" id="fasongModal" tabindex="-1" role="dialog" aria-labelledby="fasongModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="fasongModalLabel">发送消息</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-info" role="alert">发送消息至 李洪旭, 李洪旭, 李洪旭等</div>
                    <textarea class="form-control" rows="3"></textarea>
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

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="notification"/>
</c:import>
