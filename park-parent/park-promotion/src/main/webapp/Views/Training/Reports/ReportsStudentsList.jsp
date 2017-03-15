<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>"></layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"></layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="btn-toolbar" role="toolbar" aria-label="操作">
                <div class="btn-group" role="group" aria-label="学员相关操作">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-plus"></span> 添加学员
                    </button>
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-pencil"></span> 修改学员
                    </button>
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-remove"></span> 删除学员
                    </button>
                </div>
                <div class="btn-group" role="group" aria-label="数据相关操作">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-usd"></span> 学员缴费
                    </button>
                </div>
                <div class="btn-group" role="group" aria-label="其他操作">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-print"></span> 导出数据
                    </button>
                </div>
            </div>
            <div class="panel-body">
                <form class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="学生姓名或者编号">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="课程名称或者编号">
                    </div>
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 显示已毕业学员
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary">
                            <span class="glyphicon glyphicon-search"></span> 检索
                        </a>
                    </div>

                    <div class="form-group pull-right">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" checked> 显示已选学员的课程
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>学员编号</th>
                    <th>学员姓名</th>
                    <th>学员性别</th>
                    <th>入学时间</th>
                    <th>手机号码</th>
                    <th>固定电话</th>
                    <th>证件类型</th>
                    <th>证件号码</th>
                    <th>通讯地址</th>
                    <th>学员状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><label><input type="checkbox" value=""></label></td>
                    <td>01</td>
                    <td>战三胖</td>
                    <td>男</td>
                    <td>2017-05-01</td>
                    <td>12345678901</td>
                    <td>010-123456</td>
                    <td>身份证</td>
                    <td>123456789987654321</td>
                    <td>北京市海淀区纸抽路大少100号</td>
                    <td>正常</td>
                </tr>
                <tr>
                    <td><label><input type="checkbox" value=""></label></td>
                    <td>02</td>
                    <td>战三胖</td>
                    <td>男</td>
                    <td>2017-05-01</td>
                    <td>12345678901</td>
                    <td>010-123456</td>
                    <td>身份证</td>
                    <td>123456789987654321</td>
                    <td>北京市海淀区纸抽路大少100号</td>
                    <td>正常</td>
                </tr>
                <tr>
                    <td><label><input type="checkbox" value=""></label></td>
                    <td>03</td>
                    <td>战三胖</td>
                    <td>男</td>
                    <td>2017-05-01</td>
                    <td>12345678901</td>
                    <td>010-123456</td>
                    <td>身份证</td>
                    <td>123456789987654321</td>
                    <td>北京市海淀区纸抽路大少100号</td>
                    <td>正常</td>
                </tr>
                </tbody>
            </table>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>课程编号</th>
                    <th>课程名称</th>
                    <th>报名时间</th>
                    <th>课时</th>
                    <th>开课时间</th>
                    <th>结束时间</th>
                    <th>有效次数</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>01</td>
                    <td>英语全天</td>
                    <td>2017-05-01 12:11:00</td>
                    <td>100</td>
                    <td>2017-05-01</td>
                    <td>2017-06-01</td>
                    <td>0</td>
                    <td>周六上课</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="学员上课统计"/>
</c:import>
