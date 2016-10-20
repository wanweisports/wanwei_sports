<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>系统设置</span> &gt;&gt; <span>系统操作日志</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">系统操作日志</div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <td>操作员</td>
                            <td>操作类型</td>
                            <td>操作时间</td>
                            <td>操作内容</td>
                            <td>IP记录</td>
                            <td>操作场馆</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地</td>
                            <td>2016-10-19 13:55:41</td>
                            <td>&nbsp;&nbsp;删除场地:网球场</td>
                            <td>113.107.220.137</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地</td>
                            <td>2016-10-19 13:55:37</td>
                            <td>&nbsp;&nbsp;删除场地:乒乓球场地</td>
                            <td>113.107.220.137</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地</td>
                            <td>2016-10-19 13:55:32</td>
                            <td>&nbsp;&nbsp;删除场地:排球场地</td>
                            <td>113.107.220.137</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地</td>
                            <td>2016-10-19 13:55:27</td>
                            <td>&nbsp;&nbsp;删除场地:游泳中心</td>
                            <td>113.107.220.137</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地类型</td>
                            <td>2016-10-18 10:40:43</td>
                            <td>&nbsp;&nbsp;删除:羽毛球</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地</td>
                            <td>2016-10-18 10:40:39</td>
                            <td>&nbsp;&nbsp;删除场地:羽毛球场地</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>修改场地类型</td>
                            <td>2016-10-18 10:40:22</td>
                            <td>&nbsp;&nbsp;修改:乒乓球场地</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>修改场地类型</td>
                            <td>2016-10-18 10:40:18</td>
                            <td>&nbsp;&nbsp;修改:排球场地</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>修改场地类型</td>
                            <td>2016-10-18 10:40:12</td>
                            <td>&nbsp;&nbsp;修改:篮球场地</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地类型</td>
                            <td>2016-10-18 10:39:26</td>
                            <td>&nbsp;&nbsp;删除:跑步机3号</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地类型</td>
                            <td>2016-10-18 10:39:23</td>
                            <td>&nbsp;&nbsp;删除:化妆间2号</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地类型</td>
                            <td>2016-10-18 10:39:21</td>
                            <td>&nbsp;&nbsp;删除:3号</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                        <tr>
                            <td>admin</td>
                            <td>删除场地类型</td>
                            <td>2016-10-18 10:39:18</td>
                            <td>&nbsp;&nbsp;删除:6号</td>
                            <td>183.166.130.196</td>
                            <td>171中学</td>
                        </tr>
                    </table>
                    <nav class="pull-right">
                        <p class="pull-left" style="margin: 12px 14px;">
                            <span class="text-danger">自动清除30天前的记录</span>
                            <span>10条/页</span>
                            <span>总120条</span>
                        </p>
                        <ul class="pagination pull-right">
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
                            <li class="active"><a href="javascript:;" data-index="1">1</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="2">2</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="3">3</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="4">4</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="5">5</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="6">6</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="7">7</a></li>
                            <li><a class="page-index" href="javascript:;" data-index="8">8</a></li>
                            <li>
                                <a class="page-next" href="javascript:;" data-index="2">
                                    <span>下一页</span>
                                </a>
                            </li>
                            <li>
                                <a class="page-last" href="javascript:;" data-index="12">
                                    <span>末页</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="setting"/>
    <c:param name="subNav" value="logs"/>
</c:import>
