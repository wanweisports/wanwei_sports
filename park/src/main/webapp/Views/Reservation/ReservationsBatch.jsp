<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">批量预订</li>
        </ol>
        <div>
            <form action="" method="post" novalidate onsubmit="return false;">
                <div class="panel panel-default sc-booking-user">
                    <div class="panel-heading">基本信息</div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="block_user_name" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 预订人
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="block_user_name" name="membername"
                                               placeholder="预订人" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="block_user_degree" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 类型
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="block_user_degree" name="siteclass">
                                            <option value="">选择类型</option>
                                            <option value="1">羽毛球</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="block_user_phone" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 手机号码 </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="block_user_phone" name="fitphone"
                                               placeholder="手机号码" autocomplete="off"
                                               data-val="true" data-val-required="手机号码不能为空"
                                               data-val-regex-pattern="^1\d{10}$"
                                               data-val-regex="手机号码格式错误">
                                        <div data-valmsg-for="fitphone" data-valmsg-replace="true"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="block_start_date" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 起始日期
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" id="block_start_date" name="startdate"
                                               placeholder="起始日期" autocomplete="off"
                                               data-val="true" data-val-required="起始日期不能为空">
                                        <div data-valmsg-for="startdate" data-valmsg-replace="true"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <a href="javascript:void(0);" class="btn btn-primary user-search" title="搜索">
                                            <span class="glyphicon glyphicon-search"></span> 搜索
                                        </a>
                                        <a href="/users" class="btn btn-primary" title="选择会员">
                                            <span class="glyphicon glyphicon-th-list"></span> 选择会员
                                        </a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="block_end_date" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 终止日期
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" id="block_end_date" name="enddate"
                                               placeholder="终止日期" autocomplete="off"
                                               data-val="true" data-val-required="终止日期不能为空">
                                        <div data-valmsg-for="enddate" data-valmsg-replace="true"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <span class="text-danger">*</span> 预订周
                                    </label>
                                    <div class="col-sm-10">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="1"> 周一
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="2"> 周二
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="3"> 周三
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="3"> 周四
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="3"> 周五
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="3"> 周六
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="scheduledweek" value="3"> 周日
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default sc-booking-venue">
                    <div class="panel-heading">场地信息</div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="block_venue_name" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 场地编号
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="block_venue_name" name="sitenumber">
                                            <option value="1">场地1</option>
                                            <option value="2">场地2</option>
                                            <option value="3">场地3</option>
                                            <option value="4">场地4</option>
                                            <option value="5">场地5</option>
                                            <option value="6">场地6</option>
                                            <option value="7">场地7</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="block_time_start" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 开始时间
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="block_time_start" name="starttime">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="block_time_end" class="col-sm-4 control-label">
                                        <span class="text-danger">*</span> 结束时间
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="block_time_end" name="endtime">
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div class="table-responsive sc-table">
                                <table class="table table-striped sc-booking-venues">
                                    <tr class="sc-table-header">
                                        <th>类型</th>
                                        <th>预订日期</th>
                                        <th>预订周</th>
                                        <th>预订时间</th>
                                        <th>场地</th>
                                        <th>操作</th>
                                    </tr>
                                    <tr>
                                        <td>羽毛球</td>
                                        <td>2016-07-01 ~ 2016-09-30</td>
                                        <td>周一,周二</td>
                                        <td>10:00 ~ 11:00</td>
                                        <td>场地1</td>
                                        <td>
                                            <a href="javascript:;" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>羽毛球</td>
                                        <td>2016-07-01 ~ 2016-09-30</td>
                                        <td>周一,周二</td>
                                        <td>14:00 ~ 15:00</td>
                                        <td>场地1</td>
                                        <td>
                                            <a href="javascript:;" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <p class="sc-submit-tips text-center"></p>
                            <div class="form-group col-sm-12">
                                <button type="button" class="btn btn-primary col-sm-12 booking-add">
                                    <span class="glyphicon glyphicon-plus"></span> 加场
                                </button>
                            </div>
                            <div class="form-group col-sm-12">
                                <button type="submit" class="btn btn-primary col-sm-12 booking-pay">
                                    <span class="glyphicon glyphicon-usd"></span> 预订付款
                                </button>
                            </div>
                            <div class="form-group col-sm-12" style="display: none;">
                                <button type="submit" class="btn btn-primary col-sm-12 booking-confirm">
                                    <span class="glyphicon glyphicon-ok"></span> 预订确认
                                </button>
                            </div>
                            <!--<div class="form-group col-sm-12">
                                <button type="button" class="btn btn-default col-sm-12">
                                    <span class="glyphicon glyphicon-print"></span> 打印
                                </button>
                            </div>
                            <div class="form-group col-sm-12">
                                <a href="/venue" class="btn btn-default col-sm-12">
                                    <span class="glyphicon glyphicon-arrow-left"></span> 返回
                                </a>
                            </div>-->
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />
