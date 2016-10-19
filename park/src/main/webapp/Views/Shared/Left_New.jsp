<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navigator-container">
    <div class="navigator">
        <table class="list list-performance">
            <tr>
                <td class="list-title"></td>
            </tr>
            <tr>
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
            </tr>
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
                        <tr class="list-nav-item member">
                            <td>
                                <span><a href="#">会员充值</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member">
                            <td>
                                <span><a href="#">会员升级</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member">
                            <td>
                                <span><a href="#">会员补办</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member">
                            <td>
                                <span><a href="#">未收款列表</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "invoice" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getInvoices">发票登记</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${param.subNav == "setting" ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMemberCarTypes">会员设置</a></span>
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
                        <tr class="list-nav-item site">
                            <td>
                                <span><a href="#">批量预订</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site">
                            <td>
                                <span><a href="#">订单列表</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site">
                            <td>
                                <span><a href="#">关注度分析</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site">
                            <td>
                                <span><a href="#">场地设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site">
                            <td>
                                <span><a href="#">场地类型设置</a></span>
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
                                <span><a href="/good/updateGood">商品设置</a></span>
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
                        <tr class="list-nav-item good ${param.subNav == "order" ? "active" : ""}">
                            <td>
                                <span><a href="#">商品订单</a></span>
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
                        <tr class="list-nav-item data">
                            <td>
                                <span><a href="#">会员办理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data">
                            <td>
                                <span><a href="#">订单日志</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data">
                            <td>
                                <span><a href="#">营业收支</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data">
                            <td>
                                <span><a href="#">签到记录</a></span>
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
                                <span><a href="/settings/common">基础设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting">
                            <td>
                                <span><a href="#">用户设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${param.subNav == "role" ? "active" : ""}">
                            <td>
                                <span><a href="/settings/getRoles">角色设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting">
                            <td>
                                <span><a href="#">通知管理</a></span>
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
        </table>
    </div>
</div>