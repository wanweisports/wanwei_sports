<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">数据库操作</div>
            <div class="panel-body">
                <div class="alert alert-danger" role="alert">数据库清除功能是永久性清除数据库中的所有场馆表的数据，是不可恢复性的；请在操作前仔细确认每一操作步骤.<br>强烈建议您在清空数据表时先做“数据库导出备份”</div>

                <button class="btn btn-primary">
                    <span class="glyphicon glyphicon-floppy-disk"></span> 数据库导出备份
                </button>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">清除数据库</div>
            <div class="panel-body">
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
                <div class="col-sm-4">
                    <button class="btn btn-danger" style="margin: 10px;">
                        <span class="glyphicon glyphicon-trash"></span> 清空会员信息表
                    </button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="database"/>
</c:import>
