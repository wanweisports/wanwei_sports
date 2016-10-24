<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navigator-container">
    <div class="navigator">
        <table class="list list-performance">
            <tr>
                <td class="list-title"></td>
            </tr>
            <!--<tr>
                <td class="list-data">
                    <table class="base-data">
                        <tr>
                            <td><span>会员办理</span></td>
                            <td><span>1895.00元</span></td>
                        </tr>
                        <tr>
                            <td><span>场地预订</span></td>
                            <td><span>1895.00元</span></td>
                        </tr>
                        <tr>
                            <td><span>商品销售</span></td>
                            <td><span>1895.00元</span></td>
                        </tr>
                    </table>
                    <table class="more-data">
                        <tr>
                            <td><span><a href="">刷新</a></span></td>
                            <td><span><a href="">更多</a></span></td>
                        </tr>
                    </table>
                </td>
            </tr>-->
        </table>
        <table class="list list-nav">
            <tr class="list-nav-header" data-item="member">
                <td>
                    <span><a href="javascript:;">会员管理</a></span>
                </td>
            </tr>
            <tr class="list-nav-list member" style="${param.nav == "member" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item member ${param.subNav == "register" ? "active" : ""}">
                            <td>
                                <span><a href="/member/regMember">新会员办理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "list" ? "active" : ""}">
                            <td>
                                <span><a href="/member/memberList">会员查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "recharge" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersCardRecharge">会员卡充值</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "upgrade" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersCardUpgrade">会员卡升级</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "refresh" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersCardRefresh">会员卡补办</a></span>
                            </td>
                        </tr>
                        <!--<tr class="list-nav-item member ${param.subNav == "operation" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getOperations">会员卡操作</a></span>
                            </td>
                        </tr>-->
                        <tr class="list-nav-item member ${param.subNav == "loan" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersLoans">应收款管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "invoice" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getInvoices">发票登记查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "setting" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMemberCarTypes">会员类型设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="site">
                <td>
                    <span><a href="javascript:;">预订管理</a></span>
                </td>
            </tr>
            <tr class="list-nav-list site" style="${param.nav == "site" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item site ${param.subNav == "sequence" ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteReservationInfo">场地预订</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${param.subNav == "batch" ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteReservationBatch">批量预订</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${param.subNav == "batch" ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteReservationOrders">预订订单查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${param.subNav == "pda" ? "active" : ""}">
                            <td>
                                <span><a href="/site/getReservationsSequencePDA">场地热点分析</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${param.subNav == "site" ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteInfos">场地设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${param.subNav == "sports" ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteSports">场地类型设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="good">
                <td>
                    <span><a href="javascript:;">商品管理</a></span>
                </td>
            </tr>
            <tr class="list-nav-list good" style="${param.nav == "good" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item good ${param.subNav == "setting" ? "active" : ""}">
                            <td>
                                <span><a href="/good/settingGood">商品设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${param.subNav == "stock" ? "active" : ""}">
                            <td>
                                <span><a href="/good/getGoods">进销存管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${param.subNav == "market" ? "active" : ""}">
                            <td>
                                <span><a href="/good/getGoodsMarket">商品销售</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${param.subNav == "detail" ? "active" : ""}">
                            <td>
                                <span><a href="/good/getGoodsStockDetails">库存明细日志</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="data">
                <td>
                    <span><a href="javascript:;">数据统计</a></span>
                </td>
            </tr>
            <tr class="list-nav-list data" style="${param.nav == "data" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item data ${param.subNav == "register" ? "active" : ""}">
                            <td>
                                <span><a href="/data/getMembersRegister">会员办理统计</a></span>
                            </td>
                        </tr>
                        <!--<tr class="list-nav-item data">
                            <td>
                                <span><a href="">订单日志</a></span>
                            </td>
                        </tr>-->
                        <tr class="list-nav-item data ${param.subNav == "business" ? "active" : ""}">
                            <td>
                                <span><a href="/data/getBusinessIncome">营业收支统计</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data ${param.subNav == "percent" ? "active" : ""}">
                            <td>
                                <span><a href="/data/getBusinessIncome">场地使用率</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data ${param.subNav == "attendance" ? "active" : ""}">
                            <td>
                                <span><a href="/data/getMembersAttendance">签到记录</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="setting">
                <td>
                    <span><a href="javascript:;">系统设置</a></span>
                </td>
            </tr>
            <tr class="list-nav-list setting" style="${param.nav == "setting" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item setting ${param.subNav == "base" ? "active" : ""}">
                            <td>
                                <span><a href="/settings/common">场馆基础设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${param.subNav == "user" ? "active" : ""}">
                            <td>
                                <span><a href="settings/getUsers">员工信息设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${param.subNav == "role" ? "active" : ""}">
                            <td>
                                <span><a href="/settings/getRoles">员工权限设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${param.subNav == "notification" ? "active" : ""}">
                            <td>
                                <span><a href="/settings/notification">通知管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${param.subNav == "database" ? "active" : ""}">
                            <td>
                                <span><a href="/settings/database">数据库操作</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${param.subNav == "logs" ? "active" : ""}">
                            <td>
                                <span><a href="/settings/systemLogs">系统日志</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="passport">
                <td>
                    <span><a href="javascript:;">个人中心</a></span>
                </td>
            </tr>
            <tr class="list-nav-list passport" style="${param.nav == "passport" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item passport ${param.subNav == "profile" ? "active" : ""}">
                            <td>
                                <span><a href="/passport/profile">完善信息</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item passport ${param.subNav == "password" ? "active" : ""}">
                            <td>
                                <span><a href="/passport/modifyPassword">密码重置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item passport ${param.subNav == "questions" ? "active" : ""}">
                            <td>
                                <span><a href="/error/questions">操作指南</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item passport last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>