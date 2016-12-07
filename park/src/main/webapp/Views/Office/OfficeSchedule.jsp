<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>办公系统</span> &gt;&gt; <span>排班管理</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <style>
        .progress {
            margin-bottom: 0;
        }
    </style>
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">排班表</div>
            <div class="panel-body">
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#settingsModal" data-backdrop="false">
                    <span class="glyphicon glyphicon-cog"></span> 设置值班段
                </button>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#addModal" data-backdrop="false">
                    <span class="glyphicon glyphicon-plus"></span> 添加值班老师
                </button>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th>
                            <th>&nbsp;</th>
                            <th>07:00</th>
                            <th>&nbsp;</th>
                            <th>08:00</th>
                            <th>&nbsp;</th>
                            <th>09:00</th>
                            <th>&nbsp;</th>
                            <th>10:00</th>
                            <th>&nbsp;</th>
                            <th>11:00</th>
                            <th>&nbsp;</th>
                            <th>12:00</th>
                            <th>&nbsp;</th>
                            <th>13:00</th>
                            <th>&nbsp;</th>
                            <th>14:00</th>
                            <th>&nbsp;</th>
                            <th>15:00</th>
                            <th>&nbsp;</th>
                            <th>16:00</th>
                            <th>&nbsp;</th>
                            <th>17:00</th>
                            <th>&nbsp;</th>
                            <th>18:00</th>
                            <th>&nbsp;</th>
                            <th>19:00</th>
                            <th>&nbsp;</th>
                            <th>20:00</th>
                            <th>&nbsp;</th>
                            <th>21:00</th>
                            <th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td>
                            <td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td>
                            <td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td>
                            <td>|</td><td>|</td><td>|</td><td>|</td><td>|</td><td>|</td>
                        </tr>
                        <tr>
                            <td colspan="21">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="12"></td>
                        </tr>
                        <tr>
                            <td colspan="19"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td colspan="27"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>06:00</th>
                            <th>&nbsp;</th>
                            <th>07:00</th>
                            <th>&nbsp;</th>
                            <th>08:00</th>
                            <th>&nbsp;</th>
                            <th>09:00</th>
                            <th>&nbsp;</th>
                            <th>10:00</th>
                            <th>&nbsp;</th>
                            <th>11:00</th>
                            <th>&nbsp;</th>
                            <th>12:00</th>
                            <th>&nbsp;</th>
                            <th>13:00</th>
                            <th>&nbsp;</th>
                            <th>14:00</th>
                            <th>&nbsp;</th>
                            <th>15:00</th>
                            <th>&nbsp;</th>
                            <th>16:00</th>
                            <th>&nbsp;</th>
                            <th>17:00</th>
                            <th>&nbsp;</th>
                            <th>18:00</th>
                            <th>&nbsp;</th>
                            <th>19:00</th>
                            <th>&nbsp;</th>
                            <th>20:00</th>
                            <th>&nbsp;</th>
                            <th>21:00</th>
                            <th>&nbsp;</th>
                            <th>22:00</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="10">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="23"></td>
                        </tr>
                        <tr>
                            <td colspan="10"></td>
                            <td colspan="8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="16"></td>
                        </tr>
                        <tr>
                            <td colspan="18"></td>
                            <td colspan="6">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="24"></td>
                            <td colspan="9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 100%;">张老师（13:00 - 15:30）</div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="office"/>
    <c:param name="subNav" value="schedule"/>
</c:import>
