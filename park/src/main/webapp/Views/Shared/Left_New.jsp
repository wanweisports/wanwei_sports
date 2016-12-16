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
            <tr class="list-nav-header" data-item="dashboard" style="display: none;">
                <td>
                    <span><a href="javascript:;">工作平台</a></span>
                </td>
            </tr>
            <tr class="list-nav-list dashboard" style="${param.nav == "dashboard" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item dashboard ${(param.nav == "dashboard" && param.subNav == "led") ? "active" : ""}">
                            <td>
                                <span><a href="/dashboard/led">场地实时</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item dashboard ${(param.nav == "dashboard" && param.subNav == "rota") ? "active" : ""}">
                            <td>
                                <span><a href="/dashboard/rota">值班表</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item dashboard last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="member">
                <td>
                    <span><a href="javascript:;">会员管理</a></span>
                </td>
            </tr>
            <tr class="list-nav-list member" style="${param.nav == "member" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "register") ? "active" : ""}">
                            <td>
                                <span><a href="/member/regMember">新会员办理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "list") ? "active" : ""}">
                            <td>
                                <span><a href="/member/memberList">会员查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "recharge") ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersCardRecharge">会员卡充值</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "refresh") ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersCardRefresh">会员卡补办</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "cancel") ? "active" : ""}" style="display: none;">
                            <td>
                                <span><a href="/member/getMembersCardCancel">会员卡注销</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "loan") ? "active" : ""}">
                            <td>
                                <span><a href="/member/getMembersLoans">应收款管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "invoice") ? "active" : ""}">
                            <td>
                                <span><a href="/member/getInvoices?invoiceOpenState=2&invoiceState=2">发票登记查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item member ${(param.nav == "member" && param.subNav == "setting") ? "active" : ""}">
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
            <tr class="list-nav-header" data-item="teacher">
                <td>
                    <span><a href="javascript:;">教师管理</a></span>
                </td>
            </tr>
            <tr class="list-nav-list teacher" style="${param.nav == "teacher" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item teacher ${(param.nav == "teacher" && param.subNav == "register") ? "active" : ""}">
                            <td>
                                <span><a href="/teachers/register">教师办卡</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item teacher ${(param.nav == "teacher" && param.subNav == "list") ? "active" : ""}">
                            <td>
                                <span><a href="/teachers/list">教师查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item teacher ${(param.nav == "teacher" && param.subNav == "data") ? "active" : ""}">
                            <td>
                                <span><a href="/teachers/data">教师用场统计</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item teacher ${(param.nav == "teacher" && param.subNav == "meals") ? "active" : ""}">
                            <td>
                                <span><a href="/site/getMeals">教师订餐统计</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item teacher last-nav-item">
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="list-nav-header" data-item="student">
                <td>
                    <span><a href="javascript:;">学生管理</a></span>
                </td>
            </tr>
            <tr class="list-nav-list student" style="${param.nav == "student" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item student ${(param.nav == "student" && param.subNav == "register") ? "active" : ""}">
                            <td>
                                <span><a href="/students/register">学生办卡</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item student ${(param.nav == "student" && param.subNav == "list") ? "active" : ""}">
                            <td>
                                <span><a href="/students/list">学生查询</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item student ${(param.nav == "student" && param.subNav == "data") ? "active" : ""}">
                            <td>
                                <span><a href="/students/data">学生用场统计</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item student last-nav-item">
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
                        <tr class="list-nav-item site ${(param.nav == "site" && param.subNav == "sequence") ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteReservationInfo">场地预订</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${(param.nav == "site" && param.subNav == "fixed") ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteReservationFixed">定场预订</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${(param.nav == "site" && param.subNav == "batch") ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteReservationBatch">批量预订</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${(param.nav == "site" && param.subNav == "order") ? "active" : ""}">
                            <td>
                                <span><a href="/order/getOrderList?orderServiceTypes=100,200">场地订单</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${(param.nav == "site" && param.subNav == "site") ? "active" : ""}">
                            <td>
                                <span><a href="/site/getSiteInfos">场地设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item site ${(param.nav == "site" && param.subNav == "sports") ? "active" : ""}">
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
                        <tr class="list-nav-item good ${(param.nav == "good" && param.subNav == "type") ? "active" : ""}">
                            <td>
                                <span><a href="/good/typeGood">商品类别设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${(param.nav == "good" && param.subNav == "setting") ? "active" : ""}">
                            <td>
                                <span><a href="/good/settingGood">商品设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${(param.nav == "good" && param.subNav == "stock") ? "active" : ""}">
                            <td>
                                <span><a href="/good/getGoods">进销存管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${(param.nav == "good" && param.subNav == "market") ? "active" : ""}">
                            <td>
                                <span><a href="/good/getGoodsMarket">商品销售</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${(param.nav == "good" && param.subNav == "order") ? "active" : ""}">
                            <td>
                                <span><a href="/order/getOrderList?orderServiceTypes=300">商品订单</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item good ${(param.nav == "good" && param.subNav == "detail") ? "active" : ""}">
                            <td>
                                <span><a href="/good/getGoodsStockDetails?countNum=1">库存明细日志</a></span>
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
                        <tr class="list-nav-item data ${(param.nav == "data" && param.subNav == "register") ? "active" : ""}">
                            <td>
                                <span><a href="/data/getMembersRegister?countNum=10">会员办理统计</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data ${(param.nav == "data" && param.subNav == "businessLog") ? "active" : ""}">
                            <td>
                                <span><a href="/data/getBusinessIncomeLog?countNum=1">营业流水日志</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data ${(param.nav == "data" && param.subNav == "business") ? "active" : ""}">
                            <td>
                                <span><a href="/data/getBusinessIncome?countNum=1">营业收支统计</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data ${(param.nav == "data" && param.subNav == "percent") ? "active" : ""}">
                            <td>
                                <span><a href="/data/getVenuePercentage">场地使用率</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item data ${(param.nav == "data" && param.subNav == "attendance") ? "active" : ""}">
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
            <tr class="list-nav-header" data-item="office">
                <td>
                    <span><a href="javascript:;">办公系统</a></span>
                </td>
            </tr>
            <tr class="list-nav-list office" style="${param.nav == "office" ? "" : "display:none;"}">
                <td>
                    <table style="width: 100%;">
                        <tr class="list-nav-item office ${(param.nav == "office" && param.subNav == "notification") ? "active" : ""}">
                            <td>
                                <span><a href="/office/notifications">通知管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item office ${(param.nav == "office" && param.subNav == "schedule") ? "active" : ""}">
                            <td>
                                <span><a href="/office/schedule?countNum=3">排班管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item office ${(param.nav == "office" && param.subNav == "course") ? "active" : ""}">
                            <td>
                                <span><a href="/office/getTrainsCourseList">培训课程管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item office ${(param.nav == "office" && param.subNav == "class") ? "active" : ""}">
                            <td>
                                <span><a href="/office/getTrainsClassList">培训班级管理</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item office last-nav-item">
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
                        <tr class="list-nav-item setting ${(param.nav == "setting" && param.subNav == "base") ? "active" : ""}">
                            <td>
                                <span><a href="/settings/common">场馆基础设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${(param.nav == "setting" && param.subNav == "user") ? "active" : ""}">
                            <td>
                                <span><a href="settings/getUsers">员工信息设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${(param.nav == "setting" && param.subNav == "role") ? "active" : ""}">
                            <td>
                                <span><a href="/settings/getRoles">员工权限设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${(param.nav == "setting" && param.subNav == "print") ? "active" : ""}">
                            <td>
                                <span><a href="/settings/printTemplate">小票模板设置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${(param.nav == "setting" && param.subNav == "database") ? "active" : ""}">
                            <td>
                                <span><a href="/settings/database">数据库操作</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item setting ${(param.nav == "setting" && param.subNav == "logs") ? "active" : ""}">
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
                        <tr class="list-nav-item passport ${(param.nav == "passport" && param.subNav == "profile") ? "active" : ""}">
                            <td>
                                <span><a href="/passport/profile">完善信息</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item passport ${(param.nav == "passport" && param.subNav == "password") ? "active" : ""}">
                            <td>
                                <span><a href="/passport/modifyPassword">密码重置</a></span>
                            </td>
                        </tr>
                        <tr class="list-nav-item passport ${(param.nav == "passport" && param.subNav == "message") ? "active" : ""}">
                            <td>
                                <span><a href="/passport/message">我的消息</a></span>
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