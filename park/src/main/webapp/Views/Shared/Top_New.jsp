<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="top-container">
    <table class="top-header">
        <tr>
            <td class="top-header-left">
                <table class="top-header-logo">
                    <tr>
                        <td>
                            <img src="/Content/images/new/logo.png?v=${static_resource_version}" alt="logo">
                        </td>
                    </tr>
                </table>
            </td>
            <td class="top-header-right">
                <table>
                    <tr>
                        <td class="top-header-date">今天是2016年10月19日 星期三</td>
                    </tr>
                    <tr>
                        <td class="top-header-title">
                            <div>
                                <p>场馆运营管理系统</p>
                            </div>
                        </td>
                        <td class="top-header-menu">
                            <div class="menu">
                                <ul>
                                    <li><a href="/passport/profile"><span>完善信息</span></a></li>
                                    <li><a href="/passport/modifyPassword"><span>密码修改</span></a></li>
                                    <li><a class="user-logout" href="javascript:;"><span>安全退出</span></a></li>
                                    <li><a href="/error/questions"><span>操作指南</span></a></li>
                                </ul>
                            </div>
                        </td>
                        <td style="width: 18px;"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table class="top-menu">
        <tr>
            <td class="top-menu-left">
                <div class="top-menu-user">
                    <p>当前用户：管理员</p>
                </div>
            </td>
            <td class="top-menu-list">
                <div>
                    <ul>
                        <li><a href="/member/regMember"><span>新会员办理</span></a></li>
                        <li><a href="/site/getSiteReservationInfo"><span>场地预订</span></a></li>
                        <li><a href="/site/getSiteReservationBatch"><span>批量预订</span></a></li>
                        <li><a href="/good/getGoodsMarket"><span>商品销售</span></a></li>
                        <li><a href="/data/getBusinessIncome"><span>营业收支记录</span></a></li>
                        <li><a href="/settings/database"><span>数据备份</span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</header>