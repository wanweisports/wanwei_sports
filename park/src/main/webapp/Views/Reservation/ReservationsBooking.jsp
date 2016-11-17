<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/autosuggest/autosuggest.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-steps/jquery.steps.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <style type="text/css">
        a {
            text-decoration: none;
            cursor: pointer;
            color: inherit;
        }
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
        caption, th, td {
            text-align: left;
            font-weight: normal;
            vertical-align: middle;
        }
        .venues-booking-content {
            width: 1100px;
            display: block;
            margin: 0 auto;
            padding-bottom: 100px;
        }
        .order_form {
            width: 100%;
        }
        .venues-booking-content .booking-date {
            width: 100%;
            height: 25px;
            margin-top: 20px;
            margin-bottom: 30px;
            overflow: hidden;
        }
        .venues-booking-content .booking-date ul {
            text-align: left;
        }
        .venues-booking-content .booking-date ul li {
            margin-right: 3px;
            display: inline-block;
            max-width: 120px;
            color: #4f6dcf;
            font-size: 14px;
            padding: 5px 15px 5px 15px;
        }
        .venues-booking-content .booking-date ul li.title {
            display: inline-block;
            width: 60px;
            font-size: 14px;
            color: #666666;
            text-align: right;
        }
        .venues-booking-content .booking-date ul li.active {
            color: white;
            background-color: #4f6dcf;
            border-radius: 10px;
        }
        .venues-booking-content .left-time-list {
            width: 40px;
            float: left;
        }
        .venues-booking-content .left-time-list ul {
            padding-top: 25px;
            padding-bottom: 14px;
            text-align: right;
        }
        .venues-booking-content .left-time-list ul li {
            width: 100%;
            height: 36px;
            font-size: 12px;
            color: #666666;
        }
        .venues-booking-content .main-booking {
            float: right;
            width: 1040px;
            border: 1px solid #e6e6e6;
        }
        .venues-booking-content .main-booking .main-booking-detail {
            float: left;
            width: 747px;
            background-color: #f3f3f3;
            overflow-x: auto;
        }
        .venues-booking-content .main-booking .main-booking-detail table {
            height: 100%;
            margin-left: 6px;
        }
        .venues-booking-content .main-booking .main-booking-detail table thead tr th.heads {
            text-align: center;
        }
        .venues-booking-content .main-booking .main-booking-detail table thead tr th.heads span {
            max-width: 56px;
            display: block;
            font-size: 12px;
            color: #222222;
            overflow: hidden;
            padding: 8px 0 8px 0;
            word-wrap: break-word;
            word-break: normal;
        }
        .venues-booking-content .main-booking .main-booking-detail table tbody tr.rows td.single {
            min-width: 56px;
            height: 30px;
            padding: 2px 2px 2px 2px;
            text-align: center;
            cursor: pointer;
        }
        .venues-booking-content .main-booking .main-booking-detail table tbody tr.rows td.single span {
            width: 52px;
            height: 30px;
            line-height: 30px;
            display: block;
            border: 1px solid #aaaaaa;
            border-radius: 3px;
            font-size: 12px;
            color: #666666;
            overflow: hidden;
        }
        .venues-booking-content .main-booking .main-booking-detail table tbody tr.rows td.single span.can-order {
            background-color: white;
        }
        .venues-booking-content .main-booking .main-booking-detail table tbody tr.rows td.single span.highlight {
            background-color: #e7ecf9;
            color: #4f6dcf;
            border-color: #4f6dcf;
        }
        .venues-booking-content .main-booking .main-booking-detail table tbody tr.rows td.single span.chosen {
            border: 1px solid #4f6dcf;
            background-color: #4f6dcf;
            color: white;
        }
        .venues-booking-content .main-booking .right-order-plane {
            float: right;
            width: 293px;
        }
        .venues-booking-content .main-booking .right-order-plane .title {
             height: 30px;
             margin: 0 auto;
             width: 90%;
             color: #222222;
             font-size: 14px;
             padding-top: 10px;
        }
        .venues-booking-content .main-booking .right-order-plane .title ul {
            height: 100%;
            border-bottom: 1px solid #e6e6e6;
            white-space: nowrap;
            float: left;
        }
        .venues-booking-content .main-booking .right-order-plane .title li {
            display: inline-block;
            max-width: 90px;
            padding: 0 10px 0 0px;
            vertical-align: middle;
        }
        .venues-booking-content .main-booking .right-order-plane .title li span {
            display: block;
            overflow: hidden;
            width: 16px;
            height: 16px;
        }
        .venues-booking-content .main-booking .right-order-plane .title li span.can-order {
            border: 1px solid #aaaaaa;
            background-color: white;
        }
        .venues-booking-content .main-booking .right-order-plane .title li span.can-not-order {
            border: 1px solid #aaaaaa;
            background-color: #aaaaaa;
        }
        .venues-booking-content .main-booking .right-order-plane .title li span.chosen {
            border: 1px solid #4f6dcf;
            background-color: #4f6dcf;
        }
        .venues-booking-content .main-booking .right-order-plane .info {
            width: 90%;
            margin: 0 auto;
            overflow: hidden;
            padding-top: 15px;
        }
        .venues-booking-content .main-booking .right-order-plane .info dl {
            line-height: 20px;
        }
        .venues-booking-content .main-booking .right-order-plane .info dt {
            display: block;
            width: 50px;
            float: left;
            font-size: 14px;
            color: #666666;
        }
        .venues-booking-content .main-booking .right-order-plane .info dd {
            font-size: 14px;
            color: #222222;
            text-align: left;
        }
        .venues-booking-content .main-booking .right-order-plane .info ul.selected-booking {
            margin-top: 30px;
        }
        .venues-booking-content .main-booking .right-order-plane .info li {
            margin: 5px 5px;
            border: 1px solid #aaaaaa;
            border-radius: 3px;
            width: 246px;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            color: #222222;
        }
        .venues-booking-content .main-booking .right-order-plane .info .court-display {
            margin-top: 50px;
            float: left;
            margin-left: 5px;
            font-size: 14px;
            color: #222222;
        }
        .venues-booking-content .main-booking .right-order-plane .info .court-display span.number {
            padding: 5px;
            color: #4f6dcf;
        }
        .venues-booking-content .main-booking .right-order-plane .info .price-display {
            margin: 20px 20px 20px 5px;
            float: left;
            font-size: 18px;
            color: #222222;
            clear: both;
        }
        .venues-booking-content .main-booking .right-order-plane .info .price-display span.number {
            padding: 5px;
            color: #4f6dcf;
        }
        .venues-booking-content .main-booking .right-order-plane .info a.submit-button {
            display: block;
            width: 200px;
            height: 40px;
            line-height: 40px;
            border-radius: 5px;
            color: #fff;
            text-align: center;
            border: 0;
            outline: 0;
            margin: 100px auto;
            font-size: 14px;
            cursor: pointer;
            background: #aaa;
            clear: both;
        }
        .venues-booking-content .main-booking .right-order-plane .info a.active {
            background: #4f6dcf;
        }
    </style>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/autosuggest/autosuggest.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate/jquery.validate.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery.validate.unobtrusive/jquery.validate.unobtrusive.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery-steps/jquery.steps.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/moment/moment.min.js?v=${static_resource_version}"></script>
    <script>
        $(document).ready(function () {
            // 配置表单校验
            $('#reservations_user_form, #reservations_paid_form').validate({
                ignore: ":hidden"
            });
        });
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>场地预订</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left;">
        <div class="panel panel-default sequence-filter">
            <div class="panel-heading">
                <span>场地预订  </span>
                <div class="sports-list">
                    <button type="button" class="btn btn-primary sports-item" data-value="1">
                        <img class="sports-icon sports-active" src="/Content/images/sports/shuttercock-active.png?v=${static_resource_version}">
                        <img class="sports-icon sports-inactive" src="/Content/images/sports/shuttercock.png?v=${static_resource_version}">
                        羽毛球
                    </button>
                    <button type="button" class="btn btn-default sports-item">
                        <img class="sports-icon sports-active" src="/Content/images/sports/swimming-active.png?v=${static_resource_version}">
                        <img class="sports-icon sports-inactive" src="/Content/images/sports/swimming.png?v=${static_resource_version}">
                        游泳
                    </button>
                </div>
            </div>
            <div class="panel-body">
                <input type="hidden" value="${curDate}" id="current_date">
                <input type="hidden" value="${curSportId}" id="current_sport">
                <nav class="navbar navbar-default date-list">
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav sequence-date">
                            <li class="other-date-select">
                                <a href="javascript:;" class="other-date">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    <span class="icon-text">选择日期</span>
                                </a>
                                <div class="other-date-calendar"
                                     style="position: absolute; display: none; z-index: 1;">
                                    <input type="text" class="form-control" id="other_date" name="otherDate"
                                           autocomplete="off">
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="form-inline sequence-btns">
                    <div class="form-group pull-right">
                        <button type="button" class="btn btn-default sequence-unlock">
                            <span class="glyphicon glyphicon-lock"></span> 解 锁
                        </button>
                        <button type="button" class="btn btn-default sequence-lock">
                            <span class="glyphicon glyphicon-lock"></span> 锁 场
                        </button>
                        <button type="button" class="btn btn-primary sequence-order">
                            <span class="glyphicon glyphicon-ok"></span> 预 订
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default sequence-show">
            <div class="panel-body">
                <div class="venues-booking-content clearfix">
                    <form method="post" action="/order/confirm" id="booking" class="order_form">
                        <break></break>
                        <input type="hidden" name="court_name" value="人和李宁羽毛球馆">
                        <input type="hidden" name="category_name" value="羽毛球">
                        <input type="hidden" name="address" value="白云区人和镇106国道（太成收费站前800米）">
                        <input type="hidden" name="category_id" value="1">
                        <input type="hidden" name="business_id" value="18458">
                        <input type="hidden" name="min_hour" value="1">
                        <input type="hidden" name="order_type" value="0">
                        <input type="hidden" name="book_date" value="1479225600">
                        <div class="booking-date">
                            <ul>
                                <li class="title">日期:</li>
                                <li class="active">
                                    <a data-time="1479225600" href="javascript:;" class="active book-date">11月16日(周三)</a>
                                </li>
                                <li>
                                    <a data-time="1479312000" href="javascript:;" class=" book-date">11月17日(周四)</a>
                                </li>
                                <li>
                                    <a data-time="1479398400" href="javascript:;" class=" book-date">11月18日(周五)</a>
                                </li>
                                <li>
                                    <a data-time="1479484800" href="javascript:;" class=" book-date">11月19日(周六)</a>
                                </li>
                                <li>
                                    <a data-time="1479571200" href="javascript:;" class=" book-date">11月20日(周日)</a>
                                </li>
                                <li>
                                    <a data-time="1479657600" href="javascript:;" class=" book-date">11月21日(周一)</a>
                                </li>
                                <li>
                                    <a data-time="1479744000" href="javascript:;" class=" book-date">11月22日(周二)</a>
                                </li>
                            </ul>
                        </div>
                        <div class="left-time-list">
                            <ul style="padding-top: 23px;">
                                <li class="hour">8:00</li>
                                <li class="hour">9:00</li>
                                <li class="hour">10:00</li>
                                <li class="hour">11:00</li>
                                <li class="hour">12:00</li>
                                <li class="hour">13:00</li>
                                <li class="hour">14:00</li>
                                <li class="hour">15:00</li>
                                <li class="hour">16:00</li>
                                <li class="hour">17:00</li>
                                <li class="hour">18:00</li>
                                <li class="hour">19:00</li>
                                <li class="hour">20:00</li>
                                <li class="hour">21:00</li>
                                <li class="hour">22:00</li>
                                <li class="hour">23:00</li>
                            </ul>
                        </div>
                        <div class="main-booking">
                            <div class="main-booking-detail">
                                <table class="main-table">
                                    <thead>
                                    <tr>
                                        <th class="heads"><span>1号场</span></th>
                                        <th class="heads"><span>2号场</span></th>
                                        <th class="heads"><span>3号场</span></th>
                                        <th class="heads"><span>4号场</span></th>
                                        <th class="heads"><span>5号场</span></th>
                                        <th class="heads"><span>6号场</span></th>
                                        <th class="heads"><span>7号场</span></th>
                                        <th class="heads"><span>8号场</span></th>
                                        <th class="heads"><span>9号场</span></th>
                                        <th class="heads"><span>10号场</span></th>
                                        <th class="heads"><span>11号场</span></th>
                                        <th class="heads"><span>12号场</span></th>
                                        <th class="heads"><span>13号场</span></th>
                                        <th class="heads"><span>14号场</span></th>
                                        <th class="heads"><span>15号场</span></th>
                                        <th class="heads"><span>16号场</span></th>
                                    </tr>
                                    </thead>
                                    <tbody class="main-table-body">
                                    <tr class="rows">
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504598,8:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504613,8:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504628,8:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504643,8:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504658,8:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504673,8:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504688,8:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504703,8:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504718,8:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504733,8:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504748,8:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504763,8:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504778,8:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504793,8:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504569,9:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504584,9:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504599,9:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504614,9:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504629,9:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504644,9:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504659,9:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504674,9:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504689,9:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504704,9:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504719,9:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504734,9:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504749,9:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504764,9:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504779,9:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504794,9:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504570,10:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504585,10:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504600,10:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504615,10:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504630,10:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504645,10:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504660,10:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504675,10:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504690,10:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504705,10:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504720,10:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504735,10:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504750,10:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504765,10:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504780,10:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504795,10:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504598,8:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504613,8:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504628,8:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504643,8:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504658,8:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504673,8:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504688,8:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504703,8:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504718,8:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504733,8:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504748,8:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504763,8:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504778,8:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504793,8:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504569,9:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504584,9:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504599,9:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504614,9:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504629,9:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504644,9:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504659,9:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504674,9:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504689,9:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504704,9:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504719,9:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504734,9:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504749,9:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504764,9:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504779,9:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504794,9:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504570,10:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504585,10:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504600,10:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504615,10:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504630,10:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504645,10:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504660,10:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504675,10:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504690,10:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504705,10:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504720,10:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504735,10:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504750,10:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504765,10:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504780,10:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504795,10:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504598,8:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504613,8:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504628,8:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504643,8:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504658,8:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504673,8:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504688,8:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504703,8:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504718,8:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504733,8:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504748,8:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504763,8:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504778,8:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504793,8:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504569,9:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504584,9:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504599,9:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504614,9:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504629,9:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504644,9:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504659,9:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504674,9:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504689,9:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504704,9:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504719,9:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504734,9:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504749,9:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504764,9:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504779,9:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504794,9:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504570,10:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504585,10:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504600,10:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504615,10:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504630,10:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504645,10:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504660,10:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504675,10:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504690,10:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504705,10:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504720,10:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504735,10:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504750,10:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504765,10:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504780,10:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504795,10:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504598,8:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504613,8:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504628,8:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504643,8:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504658,8:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504673,8:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504688,8:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504703,8:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504718,8:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504733,8:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504748,8:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504763,8:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504778,8:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504793,8:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504569,9:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504584,9:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504599,9:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504614,9:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504629,9:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504644,9:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504659,9:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504674,9:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504689,9:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504704,9:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504719,9:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504734,9:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504749,9:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504764,9:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504779,9:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504794,9:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504570,10:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504585,10:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504600,10:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504615,10:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504630,10:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504645,10:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504660,10:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504675,10:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504690,10:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504705,10:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504720,10:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504735,10:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504750,10:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504765,10:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504780,10:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504795,10:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504583,8:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504598,8:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504613,8:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504628,8:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504643,8:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504658,8:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504673,8:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504688,8:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504703,8:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504718,8:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504733,8:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504748,8:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504763,8:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504778,8:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504793,8:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504569,9:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504584,9:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504599,9:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504614,9:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504629,9:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504644,9:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504659,9:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504674,9:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504689,9:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504704,9:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504719,9:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504734,9:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504749,9:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504764,9:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504779,9:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504794,9:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504570,10:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504585,10:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504600,10:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504615,10:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504630,10:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504645,10:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504660,10:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504675,10:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504690,10:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504705,10:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504720,10:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504735,10:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504750,10:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504765,10:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504780,10:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                        <td status="2" goods_id="70504795,10:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span></td>
                                    </tr>
                                    <tr class="rows">
                                        <td status="2" goods_id="70504569,9:00,25,2,13978" court_name="1号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504584,9:00,25,2,13979" court_name="2号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504599,9:00,25,2,13980" court_name="3号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504614,9:00,25,2,13981" court_name="4号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504629,9:00,25,2,13982" court_name="5号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504644,9:00,25,2,13983" court_name="6号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504659,9:00,25,2,13984" court_name="7号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504674,9:00,25,2,13985" court_name="8号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504689,9:00,25,2,13986" court_name="9号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504704,9:00,25,2,13987" court_name="10号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504719,9:00,25,2,13988" court_name="11号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504734,9:00,25,2,13989" court_name="12号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504749,9:00,25,2,13990" court_name="13号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504764,9:00,25,2,13991" court_name="14号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504779,9:00,25,2,13992" court_name="15号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                        <td status="2" goods_id="70504794,9:00,25,2,13993" court_name="16号场" place_holder="该场次已经售出" price="25" group_ids="" class="single">
                                            <span class="can-not-order"></span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="right-order-plane">
                                <div class="title">
                                    <ul>
                                        <li><span class="can-order"></span></li>
                                        <li>可预定</li>
                                        <li><span class="can-not-order"></span></li>
                                        <li>不可预定</li>
                                        <li> <span class="chosen"></span></li>
                                        <li>当前选定</li>
                                    </ul>
                                </div>
                                <div class="info">
                                    <dl>
                                        <dt>项目：</dt><dd> <strong class="category-name">羽毛球</strong></dd>
                                        <dt>日期：</dt><dd data="1479225600" class="current-book-date">2016年11月16日(周三)</dd>
                                        <dt>场次：</dt>
                                    </dl>
                                    <ul class="selected-booking">
                                        <li class="none" style="display: none;">请点击左侧列表选择场次</li>
                                        <li class="court">
                                            10号场 11:00-12:00
                                            <input type="hidden" name="goods_id" value="70648141">
                                            <input type="hidden" name="goods_list[70648141]" value="10号场 11:00-12:00">
                                        </li>
                                        <li class="court">
                                            10号场 12:00-13:00
                                            <input type="hidden" name="goods_id" value="70648142">
                                            <input type="hidden" name="goods_list[70648142]" value="10号场 12:00-13:00">
                                        </li>
                                        <li class="court">
                                            10号场 13:00-14:00
                                            <input type="hidden" name="goods_id" value="70648143">
                                            <input type="hidden" name="goods_list[70648143]" value="10号场 13:00-14:00">
                                        </li>
                                        <li class="court">9号场 12:00-13:00
                                            <input type="hidden" name="goods_id" value="70648127">
                                            <input type="hidden" name="goods_list[70648127]" value="9号场 12:00-13:00">
                                        </li>
                                    </ul>
                                    <div class="court-display">已选择 <span class="number">4</span>场地<span class="append-msg" style="display: inline;">，再次单击取消</span></div>
                                    <div class="court-display">已选择 <span class="number">0</span>场地<span class="append-msg">，再次单击取消</span></div>
                                    <div class="price-display">共计<span class="number">0元</span></div>
                                    <div class="price-display">共计<span class="number">100元</span></div>
                                    <a onclick="" href="javascript:void(0);" class="submit-button">提交订单</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="zhifuModalLabel">预订支付</h5>
                </div>
                <div class="modal-body">
                    <div class="reservations-steps">
                        <h1>谁预订场地</h1>
                        <div class="reservations-steps-user">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="reservations_user_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <input type="hidden" id="reservations_op_type" name="opType" value="2">
                                        <input type="hidden" id="reservations_member" name="memberId" value="">
                                        <div class="form-group">
                                            <label for="reservations_name" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_name"
                                                       name="name" placeholder="姓名" value="散客" autocomplete="off"
                                                       data-val="true" data-val-required="姓名不能为空">
                                                <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_mobile" class="col-sm-3 control-label">手机号</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_mobile" name="mobile"
                                                       placeholder="手机号码" autocomplete="off"
                                                       data-val="true" data-val-required="手机号码不能为空"
                                                       data-val-regex-pattern="^1\d{10}$"
                                                       data-val-regex="手机号码格式错误">
                                                <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_amount" class="col-sm-3 control-label">预计(元)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_amount" name="amount"
                                                       placeholder="预计价格" value="" autocomplete="off" disabled>
                                            </div>
                                        </div>
                                        <p class="sc-submit-tips"></p>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-primary pull-right reservations-pay" data-val="1">
                                                    <span class="glyphicon glyphicon-arrow-right"></span> 去支付
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <h1>预订支付</h1>
                        <div class="reservations-steps-pay">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="reservations_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <input type="hidden" id="reservations_order_id" name="orderId">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_order_no" class="col-sm-2 control-label">订单号</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="reservations_order_no"
                                                           name="orderno" placeholder="订单号" value="" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_ex_money" class="col-sm-4 control-label">附加金额</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_ex_money" name="additionalPrice"
                                                           placeholder="附加金额(元)" autocomplete="off"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="附加金额格式错误">
                                                    <div data-valmsg-for="additionalPrice" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_money_type" class="col-sm-4 control-label">支付方式</label>

                                                <div class="col-sm-8">
                                                    <select class="form-control" id="reservations_money_type" name="payType"
                                                        data-val="true" data-val-required="请选择支付方式">
                                                        <option value="">请选择</option>
                                                        <option value="1">现金</option>
                                                        <option value="2">支付宝</option>
                                                        <option value="3">微信</option>
                                                    </select>
                                                    <div data-valmsg-for="payType" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_se_money" class="col-sm-4 control-label">优惠金额</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_se_money" name="subAmount"
                                                           placeholder="优惠金额(元)" autocomplete="off"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="优惠金额格式错误">
                                                    <div data-valmsg-for="subAmount" data-valmsg-replace="true"></div>
                                                </div>
                                            </div>
                                            <!--<div class="form-group">
                                                <label for="reservations_money_no" class="col-sm-4 control-label">支票号</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_money_no" name="checkNo"
                                                           placeholder="支票号" value="" autocomplete="off">
                                                </div>
                                            </div>-->
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_pay_remark" class="col-sm-2 control-label">备注</label>

                                                <div class="col-sm-10">
                                                        <textarea class="form-control" rows="3" id="reservations_pay_remark"
                                                                  name="orderRemark" placeholder="备注"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_real_money" class="col-sm-2 control-label">实收金额</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_real_money" name="paySumPrice"
                                                           placeholder="请输入实收金额(元)" autocomplete="off"
                                                           data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                           data-val-regex="实收金额格式错误">
                                                    <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                                                    <!--<p class="bg-info">应收: 100元</p>-->
                                                </div>
                                                <div class="col-sm-2">
                                                    <button class="btn btn-primary reservations-pay-confirm">
                                                        <span class="glyphicon glyphicon-ok"></span> 确 定
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade tips-modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tipsModalLabel">提示框</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-info text-message" role="alert">您确定要锁定这些场地?</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                    <button type="button" class="btn btn-primary">确 定</button>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="booking"/>
</c:import>